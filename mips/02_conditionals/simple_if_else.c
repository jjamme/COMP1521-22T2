#include <stdio.h>

void test_signed() {
	int x = 0;

	printf("Enter a number: ");

	scanf("%d", &x);

	if (x < 0) {
		printf("Your number is negative\n");
	} else {
		printf("Your number is positive\n");
	}
}

void test_signed_simple() {
	int x = 0;

	printf("Enter a number: ");

	scanf("%d", &x);

test_number:
	if (x >= 0) goto if_positive;

if_negative:
	printf("Your number is negative");
	goto end_if;

if_positive:
	printf("Your number is positive");

end_if:
	return;
}

int main() {
	printf("Testing normal\n");
	test_signed();

	printf("Testing simple\n");
	test_signed_simple();

	return 0;
}
