#' Is StateStack
#'
#' Tests whether x is an object of class \code{\link{StateStack}}.
#'
#' @param x The object to test.
#' @return A flag indicating whether the test was positive.
#' @export
is.statestack <- function(x) {
  inherits(x, "R6") && inherits(x, "StateStack")
}


#' Stack Classs for storing a stack of states class
#'
#' @method push allows the user to push a new value onto the stack. If no value is supplied will use the current state
#' @method pop removes the top value from the stack and retuns it
#' @method peek returns the top value of the stack without removing it
#' @method clear resets the stack to be an empty stack
#' @method set will set the top value of the stack
#' @field State allows the user to peek or set the top value of the stack
#' @export
StateStack<- R6Class(
  "StateStack",
  public = list(
    initialize = function(StartingValue){
      if(missing(StartingValue)) {
        StartingValue <- private$default_state()
      }
      private$Stack <<- list()
      private$Stack[1] <- StartingValue
    },
    clear = function(value)
    {
      if(missing(value)){
        value <- private$default_state()
      }
      private$Stack <<- list()
      private$Stack[1] <-value
    },
    pop = function(){
      element <-self$depth()
      if(element < 2) {
        stop("In class StateStackr pop called more times than push")
      }
      temp <- private$Stack[element]
      private$Stack[element] <- NULL
      temp[[1]]
    },
    peek = function(){
      return(private$Stack[self$depth()][[1]])
    },
    push = function(x) {
      if(missing(x)){
        x <- self$peek()
      }
      private$Stack[self$depth()+1] <<-x
    },
    set = function(value) {
      private$Stack[self$depth()] = value
    },
    depth = function() {
      return(length(private$Stack))
    }
    ),
  private = list(
    Stack = NULL,
    default_state = function() { return(0) }
    ),
  active = list(
    State = function(value) {
      if(missing(value)){
        return(self$peek())
      }
      else{
        self$set(value)
      }
    }
    )
)

