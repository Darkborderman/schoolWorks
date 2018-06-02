#include &lt;stdio.h&gt;
int add_one(int x);
main()
{
	int i = 1;
	float f = 2.0;

// error: ‘default’ label not within a switch statement
default:  printf("Ex1: default\n");

//error: case label not within a switch statement
case 1:  printf("Ex1: default\n");

//error: expected expression before ‘:’ token
//error: case label not within a switch statement
case :  printf("Ex1: default\n");

//error: case label does not reduce to an integer constant
switch (i) case i:  printf("case 1\n");
//Example 1
switch (i) default:  printf("Ex1: default\n");
switch (i) case 1:  printf("case 1\n");
	switch (i) {}
// error: switch quantity not an integer due to f
	switch (f) {}

	switch (i) if (1) printf("switch includes if statement\n");
	switch (i) printf("switch includes if statement\n");

	switch (i) {
		int x = 10, y = 20;
//    x=2; y=3;
		printf("x=%d, y=%d\n", x, y);
	case 1: printf("x=%d, y=%d\n", x, y); break;
//    case 1: x=3; printf("x=%d, y=%d\n", x, y); break;
	default: x = 2; printf("default, x=%d\n", x);
	}
	switch (i) {
		i = add_one(i);
	default: printf("i=%d\n", i);;
	}
}

int add_one(int x)
{
	return x + 1;
}
