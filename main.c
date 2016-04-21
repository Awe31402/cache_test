#include <stdio.h>
#include <stdlib.h>

#define MATRIX_DIM 32

int main(int argc, char *argv[])
{
	int matrix_dim;
	int **a;
	int row, col;

	if(argc != 2) {
		perror("need indicate matrix dimension");
		return -2;
	}

	matrix_dim = atoi(argv[1]);

	a = (int**) malloc(matrix_dim * sizeof(int*));
	for(row = 0; row < matrix_dim; row++) {
		a[row] = (int*) malloc(matrix_dim * sizeof(int));
	}

#ifndef TRANS
	for(row = 0; row < matrix_dim; row++)
		for(col = 0; col < matrix_dim; col++)
			a[row][col] = 0;
#else	
	for(col = 0; col < matrix_dim; col++)
		for(row = 0; row < matrix_dim; row++)
			a[row][col] = 0;
#endif

	for(row = 0; row < matrix_dim; row++)
		free(a[row]);
	free(a);
	return 0;
}
