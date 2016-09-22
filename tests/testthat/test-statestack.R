context("StateStack")

test_that("is.statestack works", {
  expect_is(StateStack, "R6ClassGenerator")

  statestack <- StateStack$new()
  expect_true(is.statestack(statestack))

  statestack <- 5
  expect_false(is.statestack(statestack))

})

test_that("statestack push works", {
  expect_is(StateStack, "R6ClassGenerator")

  statestack <- StateStack$new()
  expect_equal(statestack$depth(),1)

  statestack$push(5)

  expect_equal(statestack$state,5)
  expect_equal(statestack$depth(),2)

  statestack$push(1)

  expect_equal(statestack$state,1)
  expect_equal(statestack$depth(),3)

  statestack$push()

  expect_equal(statestack$state,1)
  expect_equal(statestack$depth(),4)

})

test_that("statestack pop works", {
  expect_is(StateStack, "R6ClassGenerator")

  statestack <- StateStack$new()

  statestack$push(5)
  statestack$push(1)
  statestack$push()

  expect_equal(statestack$pop(),1)
  expect_equal(statestack$depth(),3)

  expect_equal(statestack$pop(),1)
  expect_equal(statestack$depth(),2)

  expect_equal(statestack$pop(),5)
  expect_equal(statestack$depth(),1)

  expect_error(statestack$pop())
  expect_equal(statestack$depth(),1)

})

test_that("statestack peek works", {
  expect_is(StateStack, "R6ClassGenerator")

  statestack <- StateStack$new()

  statestack$push(5)
  statestack$push(1)
  statestack$push()

  expect_equal(statestack$peek(),1)
  expect_equal(statestack$depth(),4)
  statestack$pop()

  expect_equal(statestack$peek(),1)
  expect_equal(statestack$depth(),3)
  statestack$pop()

  expect_equal(statestack$peek(),5)
  expect_equal(statestack$depth(),2)
  statestack$pop()
})


test_that("statestack clear works", {
  expect_is(StateStack, "R6ClassGenerator")

  statestack <- StateStack$new()

  statestack$push(5)
  statestack$push(1)
  statestack$push()

  expect_equal(statestack$depth(),4)

  statestack$clear()
  expect_equal(statestack$depth(),1)

  statestack$push(5)
  statestack$push(1)
  statestack$push()

  expect_equal(statestack$depth(),4)

  statestack$clear(2)
  expect_equal(statestack$state,2)
  expect_equal(statestack$depth(),1)

})


test_that("statestack set works", {
  expect_is(StateStack, "R6ClassGenerator")

  statestack <- StateStack$new()
  expect_equal(statestack$depth(),1)

  statestack$set(5)

  expect_equal(statestack$state,5)
  expect_equal(statestack$depth(),1)

  statestack$set(1)

  expect_equal(statestack$state,1)
  expect_equal(statestack$depth(),1)

  expect_error(statestack$set())

  statestack$push()
  expect_equal(statestack$state,1)
  expect_equal(statestack$depth(),2)

  statestack$set(2)
  expect_equal(statestack$state,2)
  expect_equal(statestack$depth(),2)



})
