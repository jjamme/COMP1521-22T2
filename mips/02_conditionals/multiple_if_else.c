#include <stdio.h>

void guess_simple() {
	int answer = 42;
	int guess;

	printf("Guess what number I'm thinking: ");
	scanf("%d", &guess);

	if (guess < 42) goto low_guess;
	if (guess > 42) goto high_guess;

	printf("Correct answer!\n");
	goto finish;

high_guess:
	printf("Too high\n");
	goto finish;

low_guess:
	printf("Too low\n");

finish:
	return;
}

void guess() {
	int answer = 42;
	int guess;

	printf("Guess what number I'm thinking: ");
	scanf("%d", &guess);

	if (guess > 42) {
		printf("Too high\n");
	} else if (guess < 42) {
		printf("Too low\n");
	} else {
		printf("Correct answer!\n");
	}
}

int main() {
	printf("Testing normal\n");
	guess();
	printf("Testing simple\n");
	guess_simple();

	return 0;
}
