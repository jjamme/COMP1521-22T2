#include <stdio.h>


int main() {
	int i = 0;
	int arr[10];
	
	while(i < 10) {
		arr[i] = i * 42;

		printf("%d\n", arr[i]);

		i++;
	}

	return 0;
}

