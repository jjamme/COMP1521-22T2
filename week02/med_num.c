#include <stdio.h>

void medium_goto() {
    int x;
    printf("Enter a number: ");
    scanf("%d", &x);

	if (x <= 100) goto small_big;
	if (x >= 1000) goto small_big;
	printf("medium\n");
	goto end_func;

small_big:
	printf("small/big\n");

end_func:
	return;
}

void medium() {
    int x;
    printf("Enter a number: ");
    scanf("%d", &x);

    if (x > 100 && x < 1000) {
        printf("medium\n");
    } else {
        printf("small/big\n");
    }
}

int main(void) {
	medium();
	medium_goto();
}
