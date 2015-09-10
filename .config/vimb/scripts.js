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

