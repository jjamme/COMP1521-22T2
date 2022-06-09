#include <stdio.h>

void big_number_goto() {
    int x, y;
    printf("Enter a number: ");
    scanf("%d", &x);

    if (x <= 46340) goto square;
	printf("square too big for 32 bits\n");
	goto end_func;

square:
	y = x * x;
	printf("%d\n", y);

end_func:
	return;
}

void big_number() {
    int x, y;
    printf("Enter a number: ");
    scanf("%d", &x);

    if (x > 46340) {
        printf("square too big for 32 bits\n");
    } else {
        y = x * x;
        printf("%d\n", y);
    }
}

int main(void) {
	 
}

