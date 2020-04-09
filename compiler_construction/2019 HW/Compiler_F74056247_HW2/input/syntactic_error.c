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
    iff (a) {
        x += a;
        // Undeclared variable
    } else {
        x = a % 10 + 10 * 7; /* Arithmetic */
    }
    print("Hello World");

    // Redeclare variable

    return 0; 
}
