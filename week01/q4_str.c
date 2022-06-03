#include <stdio.h>

int main(void) {
    char str[600];
    str[0] = 'H';
    str[1] = 'i';
    str[2] = '\0'; // Terminate the string
    printf("%s", str);
    return 0;
}
