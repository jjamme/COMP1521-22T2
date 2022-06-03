#include <stdio.h>

void print_array(int nums[], int len) {
    for (int i = 0; i < len; i++) {
        printf("%d\n", nums[i]);
    }
}

void recursive_print_array(int nums[], int index, int len) {
	// Base case for where index reaches the end of array
	if (index == len) {
		return;
	}

	// Print the number
	printf("%d\n", nums[index]);

	// Call itself, incrementing index
	recursive_print_array(nums, ++index, len);
}

int main(void)
{
    int nums[] = {3, 1, 4, 1, 5, 9, 2, 6, 5, 3};
    //print_array(nums, 10);
    recursive_print_array(nums, 0, 10);

    return 0;
}
