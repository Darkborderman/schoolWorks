/*
 * Your parser just need to match the if... else if ... grammar.
 * Don't need to operate the correct result after parsing.
 * In the other hand, we don't consider the "x" value in this input case.
 */
var x int = 10

if (x < 10) {
    x++
} else if(x == 10) {
    x--
} else if(x == 9) {
    x = 20
} else {
    x = 0
}

if (x < 10) {
    x++
} 
else if(x == 10) {
    x--
} 
else if(x == 9) {
    x = 20
} 
else {
    x = 0
}
