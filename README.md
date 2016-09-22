
<!-- README.md is generated from README.Rmd. Please edit that file -->
[![Travis-CI Build Status](https://travis-ci.org/Thormidable/statestackr.svg?branch=master)](https://travis-ci.org/Thormidable/statestackr) [![AppVeyor Build Status](https://ci.appveyor.com/api/projects/status/github/Thormidable/statestackr?branch=master&svg=true)](https://ci.appveyor.com/project/Thormidable/statestackr) [![codecov](https://codecov.io/gh/Thormidable/statestackr/branch/master/graph/badge.svg)](https://codecov.io/gh/Thormidable/statestackr)

StateStack
==========

Introduction
------------

An R package implementing a stack class for managing state while traversing scope. This should be used for storing a stack of previous values to be returned to while allowing the current state to be easily read and written. StateStack has the following functions: `$push()`, `$pop()`, `$peek()`, `$set()`, `$depth()` and `$clear()`. It also has an active binding called `$State` which can be used to read or write to the current state (equivalent to using `$peek()` and `$set()`. Calling `$pop()` more times than `$push()` will throw an error.

`$push()` : Will push the supplied value to the top of the stack. If no value is supplied will copy the current state. `$pop()` : Will pop the current state from the stack and return it. `$peek()`: Will return the current state from the stack without removing it. `$set()` : Will change the current state without changing the stack `$depth()`: Will return the number of layers in the stack. This cannot go beneath 1. `$clear()`: Will clear the stack making the current state the supplied value.

Utilisation
-----------

``` r
library(statestackr)

#instantiate a new State Stack
statestack <- StateStack$new(0L)

#check the current state
statestack$State
#> [1] 0
# [1] 0

#Update the current state
statestack$State <- 2L
statestack$State
#> [1] 2
# [1] 2

#Store the old state (say for entering a scope contained within the old scope). This will copy the current state and push it onto the stack.
statestack$push()
statestack$State
#> [1] 2
# [1] 2

#Update the current state
statestack$State <- 3L
statestack$State
#> [1] 3
# [1] 3

#Update the current state
statestack$State <- 1L
statestack$State
#> [1] 1
# [1] 1

#Return to the last state
top_state <- statestack$pop()
top_state
#> [1] 1
# [1] 1

statestack$State
#> [1] 2
# [1] 2
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

-   [Introduction to R6 classes](https://cran.r-project.org/web/packages/R6/vignettes/Introduction.html)
