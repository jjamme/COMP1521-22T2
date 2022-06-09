#include <stdio.h>

void for_func_goto() {
	int x = 24;

loop:
	if (x >= 42) goto end_func;
	printf("%d\n",x);
	x += 3;
	goto loop;

end_func:
	return;
}

void for_func() {
    for (int x = 24; x < 42; x += 3) {
        printf("%d\n",x);
    }
}

int main(void) {
	for_func();
	for_func_goto();
}
