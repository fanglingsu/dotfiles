"use strict",
navigator.doNotTrack=true;

// [["selector:value"],[...]]
// e! _vbform.fill([
//     "input[name='user']:Daniel",
//     "select[name='gender']:male",
//     "input[name='foo']:1",
//     "input[name='favorite-color'][value='green']:1"
// ]);
var _vbform = {
    fill: function(data) {
        data = data||[];
        var e, i, k, s;

        // iterate over data array and try to fin the elemenst
        for (i = 0; i < data.length; i++) {
            // split into selecto and value part
            s = data[i].split(":");
            e = document.querySelectorAll(s[0]);
            for (k = 0; k < e.length; k++) {
                // fill the form fields
                this.set(e[k], s[1]);
            }
        }
    },

    // set the value for the form element
    set: function(e, v) {
        var i, t, n = e.nodeName.toLowerCase();

        if (n == "input") {
            t = e.type;
            if (t == "checkbox" || t == "radio") {
                e.checked = ("1" == v);
            } else if (t == "submit") {
                e.click();
            } else {
                e.value = v;
            }
        } else if (n == "textarea") {
            e.value = v;
        } else if (n == "select") {
            for (i = 0; i < e.options.length; i++) {
                if (e.options[i].value == v) {
                    e.options[i].selected = "selected";
                }
            }
        }
    }
};

var _page = {
    duplicateIdCheck: function() {
        var es, e, k, is, r = [];
        // Fetch ll elements that have an id.
        es = document.querySelectorAll('[id]');
        for (k = 0; k < es.length; k++) {
            e = es[k];
            // Get all elements with the current id.
            is = document.querySelectorAll('[id="' + e.id + '"]');
            if (is.length > 1 && is[0] == e) {
                r.push(e.id + " " + is.length);
            }
        }

        return r.length ? r.join(",\n") : "no duplicates found";
    }
};

// https://njw.name/simplyread/
if (window.content && window.content.document && window.content.document.simplyread_original === undefined) window.content.document.simplyread_original = false;

function simplyread(nostyle, nolinks)
{
	/* count the number of <p> tags that are direct children of parenttag */
	function count_p(parenttag)
	{
		var n = 0;
		var c = parenttag.childNodes;
		for (var i = 0; i < c.length; i++) {
			if (c[i].tagName == "p" || c[i].tagName == "P")
				n++;
		}
		return n;
	}
	
	var doc;
	doc = (document.body === undefined)
	      ? window.content.document : document;
	
	/* if simplyread_original is set, then the simplyread version is currently active,
	 * so switch to the simplyread_original html */
	if (doc.simplyread_original) {
		doc.body.innerHTML = doc.simplyread_original;
		for (var i = 0; i < doc.styleSheets.length; i++)
			doc.styleSheets[i].disabled = false;
		doc.simplyread_original = false
		return 0;
	}
	
	doc.simplyread_original = doc.body.innerHTML;
	doc.body.innerHTML = doc.body.innerHTML.replace(/<br[^>]*>\s*<br[^>]*>/g, "<p>");
	
	var biggest_num = 0;
	var biggest_tag;
	
	/* search for tag with most direct children <p> tags */
	var t = doc.getElementsByTagName("*");
	for (var i = 0; i < t.length; i++) {
		var p_num = count_p(t[i]);
		if (p_num > biggest_num) {
			biggest_num = p_num;
			biggest_tag = t[i];
		}
	}
	
	if (biggest_num == 0) return 1;
	
	if (biggest_tag.childNodes[1].tagName != "H1")
		biggest_tag.innerHTML = "<h1>"+doc.title+"</h1>"+biggest_tag.innerHTML;
	
	/* save and sanitise content of chosen tag */
	var fresh = doc.createElement("div");
	fresh.innerHTML = biggest_tag.innerHTML;
	fresh.innerHTML = fresh.innerHTML.replace(/<\/?font[^>]*>/g, "");
	fresh.innerHTML = fresh.innerHTML.replace(/style="[^"]*"/g, "");
	if(nolinks)
		fresh.innerHTML = fresh.innerHTML.replace(/<\/?a[^>]*>/g, "");
	fresh.innerHTML = fresh.innerHTML.replace(/<\/?span[^>]*>/g, "");
	fresh.innerHTML = fresh.innerHTML.replace(/<style[^>]*>/g, "<style media=\"aural\">"); /* ensures contents of style tag are ignored */
	
	for (var i = 0; i < doc.styleSheets.length; i++)
		doc.styleSheets[i].disabled = true;
	
	srstyle =
		"p{margin:0ex auto;} h1,h2,h3,h4{font-weight:normal}" +
		"p+p{text-indent:2em;} body{background:#cccccc none}" +
		"img{display:block; max-width: 32em; padding:1em; margin: auto}" +
		"h1{text-align:center;text-transform:uppercase}" +
		"div#sr{width:34em; padding:2em 8em 50% 8em;" +
		"  background-color:white; margin:auto; line-height:1.4;" +
		"  text-align:justify; font-family:serif; hyphens:auto;}";
		/* text-rendering:optimizeLegibility; - someday this will work,
		 *   but at present it just ruins justify, so is disabled */
	
	doc.body.innerHTML =
		"<style type=\"text/css\">" + (nostyle ? "" : srstyle) + "</style>" +
		"<div id=\"sr\">" + fresh.innerHTML + "</div>";
	return 0;
}
