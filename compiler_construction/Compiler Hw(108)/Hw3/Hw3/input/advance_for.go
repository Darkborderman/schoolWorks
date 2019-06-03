/*
 * This input is what we score your advanced feature for handling for loop.
 */

var i int = 0
var j int = 0

// single statment for, like C's while loop
for (i < 10) {
	i++
	println(i)
	for j = 5; j > 0; j-- {
		println(j)
	}	
}

// C's for loop
for i = 0; i < 15; i++ {
	println(i)
}

