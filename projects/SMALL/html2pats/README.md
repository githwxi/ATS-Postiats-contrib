# HTML -> PATS translator

A tool for generating [ATS/Postiats](http://www.ats-lang.org/) source
code emitting the specified HTML.

License: BSD v3.

## Intro

By far the simplest approach to emitting HTML in ATS is simply
printing to file (using the C `stdio.h` functions), but it can get
really tedious, real fast. `HTML2PATS` provides syntax sugar for a
class of ATS functions which print HTML to a handle (which is
currently only for file output).

## The approach

You declare a function, e.g.:

```
extern
fun
mytemplate (out: &HTMLprint, x: int): void
```

Then, use the HTML2PATS to turn your HTML template into the
implementation of the function above. The file `mytemplate.html` is
translated into the function body, which is `#include`d into the
dynamics file of your choice. For instance, the above function
translates to:

```
implement
mytemplate (out, x) = {
  ... (*statements for emitting the file [mytemplate.html] *)
} (* end of [mytemplate] *)
```

Please note that the first argument is (currently) restricted to
`out`. Remaining arguments (if any) are the runtime parameters
to the template. You could always provide your own overloads
for the `htmlprint` symbol.

Please see the `TEST` directory for a full sample.

## Building and installing

The only dependency of the tool is `libxml2` (in addition to
`ATS/Postiats` prelude). You should be able to issue the standard
`make` to build it.
