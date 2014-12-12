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
        var i, name = e.nodeName.toLowerCase();

        if (name == "input") {
            if (!e.type || e.type == "text" || e.type == "password") {
                e.value = v;
            } else if (e.type == "checkbox" || e.type == "radio") {
                e.checked = ("1" == v) ? true : false;
            }
        } else if (name == "textarea") {
            e.value = v;
        } else if (name == "select") {
            for (i = 0; i < e.options.length; i++) {
                if (e.options[i].value == v) {
                    e.options[i].selected = "selected";
                }
            }
        }
    }
};
