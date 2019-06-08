/*
 * 2019 Spring Compiler Course Assignment 2 
 */

bool loop(int n, int m) {
    while (n > m) {
        n--;
    }
    return true;
}

int main() {
    // Declaration
    int x;
    int i;
    int a = 5;

    // if condition
    if (a > 10) {
        int keke=1;
        x += a;
        // Undeclared variable
    } else if(a>3){
        int aaa=123;
        x = a % 10 + 10 * 7; /* Arithmetic */
    } else if(a>4){
        int bbb=0;
        x=11;
    }
    print("Hello World");

    // Redeclare variable

    return 0; 
}
