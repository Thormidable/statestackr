
<!-- README.md is generated from README.Rmd. Please edit that file -->
[![Travis-CI Build Status](https://travis-ci.org/Thormidable/statestackr.svg?branch=master)](https://travis-ci.org/Thormidable/statestackr) [![AppVeyor Build Status](https://ci.appveyor.com/api/projects/status/github/Thormidable/statestackr?branch=master&svg=true)](https://ci.appveyor.com/project/Thormidable/statestackr) [![codecov](https://codecov.io/gh/Thormidable/statestackr/branch/master/graph/badge.svg)](https://codecov.io/gh/Thormidable/statestackr)

StateStack
==========

Introduction
------------

An R package implementing a push pop stack which allows for reading and writing to the top value of the stack. An example of a use for this class would be to store a series of states while traversing a tree structure.

The stack will be created with a single element in the stack to be used as the current state, this value can be specified in the constructor or if undefined will default to 0. As such starting `$depth()` is 1 and cannot be reduced beneath 1.

StateStack has the following functions: `$push()`, `$pop()`, `$peek()`, `$set()`, `$depth()` and `$clear()`. It also has an active binding called `$state` which can be used to read or write to the current state (equivalent to using `$peek()` and `$set()`.)

Calling `$pop()` more times than `$push()` will throw an error.

`$push()` : Will push the supplied value to the top of the stack. If no value is supplied will copy the current state.

`$pop()` : Will pop the current state from the stack and return it.

`$peek()`: Will return the current state from the stack without removing it.

`$set()` : Will change the current state without changing the stack

`$depth()`: Will return the number of layers in the stack.

`$clear()`: Will clear the stack making the current state the supplied value.

Utilisation
-----------

``` r
library(statestackr)

#instantiate a new state Stack with a starting value of 7L
statestack <- StateStack$new(7L)

#check the current state
statestack$state
#> [1] 7
statestack$depth()
#> [1] 1

#Update the current state
statestack$state <- 2L
statestack$state
#> [1] 2
statestack$depth()
#> [1] 1

#Store the old state and make a new current state.
#Not supplying an argument will copy the current state and push it onto the stack.
#Changing the current state will not affect the first state on the stack.
statestack$push()
statestack$state
#> [1] 2
statestack$depth()
#> [1] 2

#Update the current state
statestack$state <- 3L
statestack$state
#> [1] 3
statestack$depth()
#> [1] 2

#Update the current state
statestack$state <- 1L
statestack$state
#> [1] 1
statestack$depth()
#> [1] 2

#Remove the top item of the stack and return it
statestack$pop()
#> [1] 1
statestack$depth()
#> [1] 1

#Check that the state stored before the previous push() has been retained
statestack$state
#> [1] 2
statestack$depth()
#> [1] 1
```

Installation
------------

To install from GitHub

    # install.packages("devtools")
    devtools::install_github("Thormidable/statestackr")

Contribution
------------

Please report any [issues](https://github.com/Thormidable/statestackr/issues).

[Pull requests](https://github.com/Thormidable/statestackr/pulls) are always welcome.

Documentation
-------------

-   [R6 class package](https://cran.r-project.org/package=R6)
