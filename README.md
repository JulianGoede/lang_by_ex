# Language by example

I often find myself searching for examples in `man` pages, `tldr` or whenever I type `--help`.
Unfortunately, many times there are either no examples or they lack context such as imports etc.

Thus, here I try to provide myself with a random bunch of examples seperated by lanuage.

## Structure

A file `foo.{lang_extension}` in "{lang}/" is meant to be run directly, i.e. without
any dependency within this directory.

A directory `bar` in "{lang}/" is a small project, i.e. "{lang}/bar" my contain
multiple files written in "{lang}" and potentially even extra files that help
building/executing the "project" `bar`.


## TBD: Automatic testing

Provide a per-project (i.e. language) dockerfile that runs all examples.
This also serves as documentation to how to compile/run/do-whatever.
