#include <stdio.h>

int mult_42(int);

int main() {
	int x;

	printf("Give me an integer and I'll multiply it by 42\n");
	scanf("%d", &x);

	printf("Your number multiplied by 42 is: %d\n", mult_42(x));

	return 0;
}

int mult_42(int num) {
	return num * 42;
}
