/* See LICENSE file for copyright and license details. */

/* appearance */
static const char *fonts[] = {
    "DejaVuSansMono:pixelsize=14:antialias=true:autohint=true"
};
static const char dmenufont[] = "DejaVuSansMono:pixelsize=14";

static const unsigned int borderpx  = 1;        /* border pixel of windows */
static const unsigned int snap      = 10;       /* snap pixel */
static const unsigned int systraypinning = 0;   /* 0: sloppy systray follows selected monitor, >0: pin systray to monitor X */
static const unsigned int systrayspacing = 1;   /* systray spacing */
static const int systraypinningfailfirst = 1;   /* 1: if pinning fails, display systray on the first monitor, 0: display systray on the last monitor*/
static const int showsystray        = 1;        /* 0 means no systray */
static const int showbar            = 1;        /* 0 means no bar */
static const int topbar             = 1;        /* 0 means bottom bar */
static const char *colors[][3]      = {
	/*               fg         bg         border   */
	[SchemeNorm] = { "#666666", "#111111", "#222222" },
	[SchemeSel]  = { "#c0c0c0", "#111111", "#5e468c" },
	[SchemeUrg]  = { "#cf4f88", "#111111", "#cf4f88" },
	[3]          = { "#06989a", "#111111", "#111111" },
	[4]          = { "#53a653", "#111111", "#111111" },
};

/* tagging */
static const char *tags[] = { "1", "2", "3", "4" };

static const Rule rules[] = {
	/* xprop(1):
	 *	WM_CLASS(STRING) = instance, class
	 *	WM_NAME(STRING) = title
	 */
	/* class                instance        title         tags mask     isfloating   monitor */
	{ "Tabbed",             NULL,           NULL,         1 << 2,       0,           -1 },
	{ "Chromium-browser",   NULL,           NULL,         1 << 2,       0,           -1 },
	{ "jetbrains-phpstorm", NULL,           NULL,         1 << 1,       0,           -1 },
	{ "Display",            NULL,           NULL,         0,            1,           -1 },
	{ NULL,                 NULL,           "scratchpad", 0,            1,           -1 },
	{ NULL,                 "scratchpad",   NULL,         0,            1,           -1 },
};

/* layout(s) */
static const float mfact     = 0.50; /* factor of master area size [0.05..0.95] */
static const int nmaster     = 1;    /* number of clients in master area */
static const int resizehints = 0;    /* 1 means respect size hints in tiled resizals */

static const Layout layouts[] = {
	/* symbol     arrange function */
	{ "[M]",      monocle }, /* first entry is default */
	{ "[T]",      tile },
	{ "[B]",      bstack },
	{ "[H]",      bstackhoriz },
};

/* key definitions */
#define MODKEY Mod1Mask
#define TAGKEYS(KEY,TAG) \
	{ MODKEY,                       KEY,      view,           {.ui = 1 << TAG} }, \
	{ MODKEY|ControlMask,           KEY,      toggleview,     {.ui = 1 << TAG} }, \
	{ MODKEY|ShiftMask,             KEY,      tag,            {.ui = 1 << TAG} }, \
	{ MODKEY|ControlMask|ShiftMask, KEY,      toggletag,      {.ui = 1 << TAG} },

/* helper for spawning shell commands in the pre dwm-5.0 fashion */
#define SHCMD(cmd) { .v = (const char*[]){ "/bin/sh", "-c", cmd, NULL } }

/* commands */
static const char terminal[]  = "st";
static char dmenumon[2] = "0"; /* component of dmenucmd, manipulated in spawn() */
static const char *dmenucmd[] = { "dmenu-run-recent", "-m", dmenumon, "-fn", dmenufont, "-nb", "#111111", "-nf", "#666666", "-sb", "#111111", "-sf", "#c0c0c0", "-l", "7", NULL };
static const char *dpasscmd[] = { "dpass", "-m", dmenumon, "-fn", dmenufont, "-nb", "#111111", "-nf", "#666666", "-sb", "#111111", "-sf", "#c0c0c0", "-l", "7", NULL };
static const char *termcmd[]  = { terminal, NULL };
static const char scratchpadname[] = "scratchy";
static const char *scratchpadcmd[] = { terminal, "-t", scratchpadname, "-g", "80x20+350+130", NULL };
static const char *slockcmd[] = { "slock", NULL };

#include "focusurgent.c"

static Key keys[] = {
	/* modifier                     key        function        argument */
	{ MODKEY,                       XK_p,      spawn,          {.v = dmenucmd } },
	{ MODKEY,                       XK_x,      togglescratch,  {.v = scratchpadcmd } },
	{ MODKEY|ShiftMask,             XK_Return, spawn,          {.v = termcmd } },
    { MODKEY|ShiftMask,             XK_p,      spawn,          {.v = dpasscmd } },
    { MODKEY|ShiftMask,             XK_z,      spawn,          {.v = slockcmd } },
	{ MODKEY,                       XK_b,      togglebar,      {0} },
	{ MODKEY,                       XK_j,      focusstack,     {.i = +1 } },
	{ MODKEY,                       XK_k,      focusstack,     {.i = -1 } },
	{ MODKEY,                       XK_i,      incnmaster,     {.i = +1 } },
	{ MODKEY,                       XK_d,      incnmaster,     {.i = -1 } },
	{ MODKEY,                       XK_h,      setmfact,       {.f = -0.05} },
	{ MODKEY,                       XK_l,      setmfact,       {.f = +0.05} },
	{ MODKEY,                       XK_Return, zoom,           {0} },
	{ MODKEY,                       XK_Tab,    view,           {0} },
	{ MODKEY|ShiftMask,             XK_c,      killclient,     {0} },
	{ MODKEY|ShiftMask,             XK_m,      setlayout,      {.v = &layouts[0]} },
	{ MODKEY|ShiftMask,             XK_t,      setlayout,      {.v = &layouts[1]} },
	{ MODKEY|ShiftMask,             XK_b,      setlayout,      {.v = &layouts[2]} },
	{ MODKEY|ShiftMask,             XK_h,      setlayout,      {.v = &layouts[3]} },
	{ MODKEY,                       XK_space,  setlayout,      {0} },
	{ MODKEY,                       XK_t,      togglefloating, {0} },
	{ MODKEY,                       XK_0,      view,           {.ui = ~0 } },
	{ MODKEY|ShiftMask,             XK_0,      tag,            {.ui = ~0 } },
	/*
	{ MODKEY,                       XK_comma,  focusmon,       {.i = -1 } },
	{ MODKEY,                       XK_period, focusmon,       {.i = +1 } },
	{ MODKEY|ShiftMask,             XK_comma,  tagmon,         {.i = -1 } },
	{ MODKEY|ShiftMask,             XK_period, tagmon,         {.i = +1 } },
	*/
	TAGKEYS(                        XK_1,                      0)
	TAGKEYS(                        XK_2,                      1)
	TAGKEYS(                        XK_3,                      2)
	TAGKEYS(                        XK_4,                      3)
	TAGKEYS(                        XK_5,                      4)
	TAGKEYS(                        XK_6,                      5)
	TAGKEYS(                        XK_7,                      6)
	TAGKEYS(                        XK_8,                      7)
	TAGKEYS(                        XK_9,                      8)
	{ MODKEY|ShiftMask,             XK_q,      quit,           {0} },
	{ MODKEY,                       XK_u,      focusurgent,    {0} },
};

/* button definitions */
/* click can be ClkLtSymbol, ClkStatusText, ClkWinTitle, ClkClientWin, or ClkRootWin */
static Button buttons[] = {
	/* click                event mask        button          function        argument */
	{ ClkClientWin,         MODKEY|ShiftMask, Button1,        movemouse,      {0} },
	{ ClkClientWin,         MODKEY|ShiftMask, Button3,        resizemouse,    {0} },
	{ ClkTagBar,            0,              Button1,        view,           {0} },
	{ ClkTagBar,            0,              Button3,        toggleview,     {0} },
	{ ClkTagBar,            MODKEY,         Button1,        tag,            {0} },
	{ ClkTagBar,            MODKEY,         Button3,        toggletag,      {0} },
};

