println("Declaration test:\n")
var x int
var a int = 2
var y float32 = 1.3

println("Arithmetic test:\n")
// pure int operation
x = a + 5 * 2

print("x should be 12: ")
println(x)

// pure float32 operation
y = 1.3 * 2.3 + 1.33 * 9.99

print("y should be 16.2767: ")
println(y)

// hybrid operation
y = x + 3.2 * (a - 2.3)

print("y should be 11.04: ")
println(y)

// All operator for integer 
x = 10
x = x + 1
x = x - 2
x = x * 3
x = x / 4
x = x % 5
x += 6	
x -= 7	
x *= 8	
x /= 9	
x %= 10	
x++		
x--	

print("x should be 0: ")
println(x)

// All operator for float32
y = 0.0
y = y + 1.3	
y = y - 2.3	
y = y * 3.3 
y = y / 4.3 
y += 6.3	
y -= 7.3	
y *= 8.3	
y /= 9.3	
y++			
y--			

print("y should be -1.57739434: ")
println(y)

// print out arithmetic operation
println("Print arithmetic operation test: \n")
print("This should print out 0: ")
println(x + 10 % 5)	// 0
print("This should print out -3.31252811: ")
println(y * 2.1)	// -3.31252811
