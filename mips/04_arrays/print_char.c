#include <stdio.h>


int main() {
	int i = 0;
	char arr[] = {'a', 'b', 'z', 'y', 'x', 'w', 'v', 'u', 't', 'g'};
	
	while(i < 10) {
		printf("%c\n", arr[i]);

		i++;
	}

	return 0;
}
