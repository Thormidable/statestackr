context("StateStack")

test_that("is.statestack works", {
  expect_is(StateStack, "R6ClassGenerator")

  statestack <- StateStack$new()
  expect_true(is.statestack(statestack))
})
