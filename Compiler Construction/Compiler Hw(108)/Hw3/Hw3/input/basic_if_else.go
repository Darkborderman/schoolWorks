var x int = 10

if (x <= 10 / 2) {
    if(x > 0){
		x = 6
	} else if(x == 8){
		x = 2
	} else {
		x = 13
	}
} else if(x < 10) {
	if(x > 0){
		x = 5
	} else if(x == 8){
		x = 1
	} else {
		x = 12
	}
} else if(x == 9) {
    x = 20
} else {
    x = 100
}

println(x)

if(5.5 > 55 / 10){
	println("5.5 > 55 / 10 is True")
}
if(55 / 10 < 2.2){
	println("True")
} else if(2.2 <= 1.2) {
	println("2.2<=1.2 is True")
} else if(2.2 == 10) {
	println("2.2==1.2 is True")
} else if(5.5 <= 55/10) {
	println("5.5 <= 55/10 is True")
} else if(2.2 != 1.0) {
	println("2.2!=1.0 is True")
} else {
	println("False")
}
