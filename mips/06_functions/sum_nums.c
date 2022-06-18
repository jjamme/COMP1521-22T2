#include <stdio.h>

int sum(int, int);

int main() {
	int x, y;

	printf("Enter two numbers and I'll add them together\n");
	scanf("%d %d", &x, &y);

	printf("%d + %d = %d\n", x, y, sum(x, y));

	return 0;
}

int sum(int num1, int num2) {
	return num1 + num2;
}
