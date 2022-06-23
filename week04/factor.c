#include <stdio.h>

void change (int nrows, int ncols, int M[nrows][ncols], int factor)
{
    for (int row = 0; row < nrows; row++) {
        for (int col = 0; col < ncols; col++) {
            M[row][col] = factor * M[row][col];
        }
    }
}


int main() {
	int M[3][4] = {
		1, 2, 3, 4,
    	3, 4, 5, 6,
    	5, 6, 7, 8,
	};

	change(3, 4, M, 2);
	return 0;
}
