// An example of parsing the contents of a JS object.
//
// With Node.js:
//
//    $ node js_parse.js

var obj = {
    "sections": [
	{
	    "members": [
		"run_duration",
		"dt",
		"rti_file",
		"pixel_file"
	    ],
	    "title": "Run"
	},
	{
	    "members": [
		"PRECIP_ONLY",
		"rho_H2O_ptype",
		"rho_H2O_scalar",
		"rho_H2O_file",
		"Cp_air_ptype",
		"Cp_air_scalar",
		"Cp_air_file"
	    ],
	    "title": "Input"
	}
    ]
}

console.log("n_sections: " + obj.sections.length);
for (i = 0; i < obj.sections.length; i++) {
    console.log("section number " + i);
    console.log("\ttitle: " + obj.sections[i].title);
    console.log("\tmembers: " + obj.sections[i].members);
}
