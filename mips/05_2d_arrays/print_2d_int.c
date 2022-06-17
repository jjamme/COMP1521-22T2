#include  <stdio.h>

#define N_ROW 2
#define N_COL 10

int main() {
	int int_arr[N_ROW][N_COL] = {
		{0, 1, 2, 3, 4, 5, 6, 7, 8, 9},
		{10, 11, 12, 13, 14, 15, 16, 17, 18, 19}
	};

	for(int row = 0; row < N_ROW; row++) {
		for(int col = 0; col < N_COL; col++) {
			printf("%d ", int_arr[row][col]);
		}
		printf("\n");
	}
	
	return 0;
}
