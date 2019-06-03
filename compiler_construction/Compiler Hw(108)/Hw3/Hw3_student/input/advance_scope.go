/*
 * We check the value which depends on result of JVM execution,
 * whether value of x is correct or not.
 */
var x int = 10

{
	println(x)
	var x int = 5
	x++
	println(x)
}

println(x)

{
	x++
	println(x)
}

println(x)
