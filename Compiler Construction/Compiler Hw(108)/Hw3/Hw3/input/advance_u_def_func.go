/*
 * For handling user defined function, you need to consider the main
 * function is the default entrance.
 */

func add(x int, y int) int {
	return x + y
}

func main() {
	var x int
	x = add(10, 5)
	println(x)
}
