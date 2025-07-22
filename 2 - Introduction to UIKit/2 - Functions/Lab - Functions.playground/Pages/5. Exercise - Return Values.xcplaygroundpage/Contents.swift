/*:
## Exercise - Return Values

 Write a function called `greeting` that takes a `String` argument called name, and returns a `String` that greets the name that was passed into the function. I.e. if you pass in "Sophie" the return value might be "Hi, Sophie! How are you?" Use the function and print the result.
 */
func greeting(name : String )-> String{
    let result = "Hi, \(name)! How are you?"
    return result
}
print(greeting(name: "Sophie"))

//:  Write a function that takes two `Int` arguments, and returns an `Int`. The function should multiply the two arguments, add 2, then return the result. Use the function and print the result.
func intMultiplier(num1 : Int, num2 : Int )-> Int{
    let result = (num1 * num2) + 2
    return result
}
print(intMultiplier(num1: 10, num2: 20))
/*:
[Previous](@previous)  |  page 5 of 6  |  [Next: App Exercise - Separating Functions](@next)
 */
