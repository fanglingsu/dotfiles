/* See LICENSE file for copyright and license details. */
#include "push.c"
#include "focusmaster.c"
#include "focusurgent.c"

/* appearance */
#define NUMCOLORS         5             // need at least 3
static const char colors[NUMCOLORS][ColLast][8] = {
   // border   foreground  background
   { "#111111", "#666666", "#111111" },  // \x01 = normal grey
   { "#5e468c", "#c0c0c0", "#111111" },  // \x02 = selected white
   { "#111111", "#cf4f88", "#111111" },  // \x03 = urgent/warning red
   { "#111111", "#06989a", "#111111" },  // \x04 = cyan
   { "#111111", "#53a653", "#111111" },  // \x05 = green
   // add more here
};

static const char font[]                 = "-*-terminus-medium-r-*-*-16-*-*-*-*-*-*-*";
static const unsigned int borderpx       = 1;       /* border pixel of windows */
static const unsigned int snap           = 10;      /* snap pixel */
static const unsigned int systrayspacing = 2;       /* systray spacing */
static const Bool showsystray            = True;    /* False means no systray */
static const Bool showbar                = True;    /* False means no bar */
static const Bool topbar                 = True;    /* False means bottom bar */
/* False means using the scroll wheel on a window will not change focus */
static const Bool focusonwheelscroll     = False;

/* tagging */
static const char *tags[] = { "term", "dev", "web", "media", "jabber", "mail" };

static unsigned int scratchtag = 1 << LENGTH(tags);

static const Rule rules[] = {
	/* xprop(1):
	 *	WM_CLASS(STRING) = instance, class
	 *	WM_NAME(STRING) = title
	 */
	/* class                instance    title       tags mask     isfloating  monitor */
	{ "Gimp",               NULL,       NULL,       0,            True,       -1 },
	{ "Wicd-client.py",     NULL,       NULL,       0,            True,       -1 },
    { "Vidalia",            NULL,       NULL,       0,            True,       -1 },
    { "Tabbed",             NULL,       NULL,       1 << 2,       False,      -1 },
	{ "Chromium-browser",   NULL,       NULL,       1 << 2,       False,      -1 },
    { "jetbrains-phpstorm", NULL,       NULL,       1 << 1,       False       -1 },
    { "Display",            NULL,       NULL,       0,            True,       -1 },
};

/* layout(s) */
static const float mfact      = 0.50;  /* factor of master area size [0.05..0.95] */
static const int nmaster      = 1;     /* number of clients in master area */
static const Bool resizehints = False; /* True means respect size hints in tiled resizals */

static const Layout layouts[] = {
	/* symbol     arrange function */
	{ "[T]",      tile },
	{ "[B]",      bstack },
	{ "[M]",      monocle },
	{ NULL,       NULL },
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
static const char terminal[]  = "urxvtc";
static const char scratchpadname[] = "scratchy";
static const char *dmenucmd[] = { "dmenu-run-recent", "-l 7", "-fn", font, "-nb", colors[0][ColBG], "-nf", colors[0][ColFG],"-sb", colors[1][ColBG], "-sf", colors[1][ColFG], NULL };
static const char *termcmd[]  = { terminal, NULL };
static const char *slockcmd[] = { "slock", NULL };
static const char *scratchpadcmd[] = { terminal, "-name", scratchpadname, "-geometry", "80x20", NULL };

static Key keys[] = {
	/* modifier                     key        function        argument */
	{ MODKEY,                       XK_p,      spawn,          {.v = dmenucmd } },
	{ MODKEY|ShiftMask,             XK_Return, spawn,          {.v = termcmd } },
	{ MODKEY|ShiftMask,             XK_z,      spawn,          {.v = slockcmd } },
	{ MODKEY,                       XK_b,      togglebar,      {0} },
	{ MODKEY,                       XK_j,      focusstack,     {.i = +1 } },
	{ MODKEY,                       XK_k,      focusstack,     {.i = -1 } },
	{ MODKEY,                       XK_i,      incnmaster,     {.i = +1 } },
	{ MODKEY,                       XK_d,      incnmaster,     {.i = -1 } },
	{ MODKEY,                       XK_h,      setmfact,       {.f = -0.05} },
	{ MODKEY,                       XK_l,      setmfact,       {.f = +0.05} },
	{ MODKEY,                       XK_Return, zoom,           {0} },
	{ MODKEY|ShiftMask,             XK_c,      killclient,     {0} },
	{ MODKEY|ShiftMask,             XK_t,      setlayout,      {.v = &layouts[0]} },
	{ MODKEY|ShiftMask,             XK_b,      setlayout,      {.v = &layouts[1]} },
	{ MODKEY|ShiftMask,             XK_m,      setlayout,      {.v = &layouts[2]} },
    { MODKEY,                       XK_x,      togglescratch,  {.v = scratchpadcmd } },
	{ MODKEY,                       XK_t,      togglefloating, {0} },
	{ MODKEY,                       XK_space,  nextlayout,     {0} },
	{ MODKEY|ShiftMask,             XK_space,  prevlayout,     {0} },
    { MODKEY|ShiftMask,             XK_j,      pushdown,       {0} },
    { MODKEY|ShiftMask,             XK_k,      pushup,         {0} },
    { MODKEY,                       XK_m,      focusmaster,    {0} },
    { MODKEY,                       XK_u,      focusurgent,    {0} },
    { MODKEY,                       XK_Tab,    view,           {0} },
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
    /*
	TAGKEYS(                        XK_7,                      6)
	TAGKEYS(                        XK_8,                      7)
	TAGKEYS(                        XK_9,                      8)
    */
	{ MODKEY,                       XK_0,      view,           {.ui = ~0 } },
	{ MODKEY|ShiftMask,             XK_0,      tag,            {.ui = ~0 } },
    /*
	{ MODKEY|ControlMask,           XK_0,      toggleview,     {.ui = ~0 } },
    */
	{ MODKEY|ShiftMask,             XK_q,      quit,           {0} },
	{ MODKEY,                       XK_r,      quit,           {.i = 1 } },
};

/* button definitions */
/* click can be ClkLtSymbol, ClkStatusText, ClkWinTitle, ClkClientWin, or ClkRootWin */
static Button buttons[] = {
	/* click                event mask      button          function        argument */
	{ ClkClientWin,         MODKEY,         Button1,        movemouse,      {0} },
	{ ClkClientWin,         MODKEY,         Button3,        resizemouse,    {0} },
};
