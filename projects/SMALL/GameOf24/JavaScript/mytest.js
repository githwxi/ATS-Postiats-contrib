//
// HX-2014-09-02:
// testing code for GameOf24_php
//
/* ****** ****** */
//
// file inclusion
//
var fs = require('fs');
//
eval(fs.readFileSync('./GameOf24_js_dats.js').toString());
//
eval(fs.readFileSync('./libatscc2js/CATS/basics_cats.js').toString());
eval(fs.readFileSync('./libatscc2js/CATS/integer_cats.js').toString());
//
eval(fs.readFileSync('./libatscc2js/CATS/float_cats.js').toString());
eval(fs.readFileSync('./libatscc2js/CATS/string_cats.js').toString());
//
eval(fs.readFileSync('./libatscc2js/CATS/JSarray_cats.js').toString());
//
eval(fs.readFileSync('./libatscc2js/CATS/node/basics_cats.js').toString());
eval(fs.readFileSync('./libatscc2js/CATS/node/process_cats.js').toString());
//
eval(fs.readFileSync('./libatscc2js/DATS/list_dats.js').toString());
//
/* ****** ****** */

GameOf24_js_main0_js()

/* ****** ****** */

/* end of [mytest.js] */
