var x int
var a int = 2
var y float32 = 1.3

// pure int operation
x = a + 5 * 2
println(x)
//x = y

// hybrid operation
y = x + 3.2 * (a - 2.3)
println(y)

/*
 * Mod operation need to consider type checking.
 * If float involve into mod operation, we expext to see the error message.
 */
x = (x - 1) % 2
println(x)
//x = y % 2

// All operator
x = x + 1 //10
x = x - 1
x = x * 1
x = x / 1
x = x % 1
x += 5
x -= 3
x *= 6
x /= 4
x %= 6
x++
x--
x += 1.5
println(x)
y += 1
println(y)
x -= 1.5
println(x)
y -= 1
println(y)
x *= 1.5
println(x)
y *= 2
println(y)
x /= 1.5
println(x)
y /= 2
println(y)
y++
println(y)
y--
println(y)
