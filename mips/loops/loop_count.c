#include <stdio.h>

int main_goto() {
	int x = 20;

start_loop:
	if (x >= 35) goto end_loop;
	printf("%d\n", x);
	x++;
	goto start_loop;


end_loop:
	return 0;
}

int main() {
	for (int x = 20; x < 35; x++) {
		printf("%d\n", x);
	}

	return 0;
}
