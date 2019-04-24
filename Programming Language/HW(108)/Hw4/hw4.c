#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <time.h>

int **mulMatrix(int **rst, int **a, int **b, int n){
    int i, j, k;
    int sum;
    for(i=0; i<n; i++){
        for(j=0; j<n; j++){
            sum = 0.0;
            for(k=0; k<n; k++){
                sum += a[i][k] * b[k][j];
            }
            rst[i][j] = sum;
        }
    }
    return rst;
}

int **newMatrix(int n1, int n2){
	int ** rst = (int **)malloc(n1 * sizeof(int *));
	int i;
	for(i=0; i<n1; i++){
		rst[i] = (int *)malloc(n2 * sizeof(int));
	}
	return rst;
}

int **add(int **rst, int **a, int **b, int n1, int n2){
	//printf("add\n");
	int i, j;
	for(i=0; i<n1; i++){
		for(j=0; j<n2; j++){
			rst[i][j] = a[i][j] + b[i][j];
		}
	}
	return rst;
}

int **sub(int **rst, int **a, int **b, int n1, int n2){
	//printf("sub\n");
	int i, j;
	for(i=0; i<n1; i++){
		for(j=0; j<n2; j++){
			rst[i][j] = a[i][j] - b[i][j];
		}
	}
	return rst;
}

int **strassen2(int **rst, int **a, int **b){
    int p1 = (a[0][1] - a[1][1]) * ( b[1][0] + b[1][1] );
    int p2 = (a[0][0] + a[1][1]) * ( b[0][0] + b[1][1] );
    int p3 = (a[0][0] - a[1][0]) * ( b[0][0] + b[0][1] );
    int p4 = (a[0][0] + a[0][1]) * b[1][1];
    int p5 = a[0][0] * (b[0][1] - b[1][1]);
    int p6 = a[1][1] * (b[1][0] - b[0][0]);
    int p7 = (a[1][0] + a[1][1]) * b[0][0];
 
    rst[0][0] = p1 + p2 - p4 + p6;
    rst[0][1] = p4 + p5;
    rst[1][0] = p6 + p7;
    rst[1][1] = p2 - p3 + p5 - p7;
 
    return rst;
}

int **strassen(int **rst, int **a, int **b, int n){
	//printf("st\n");
    int i, j, n2;
    int **p1, **p2, **p3, **p4, **p5, **p6, **p7;
    int **a11, **a12, **a21, **a22;
    int **b11, **b12, **b21, **b22;
    int **m11, **m12, **m21, **m22;
    int **arst, **brst;

    /*if(n%2!=0){
        return mulMatrix(rst, a, b, n);
    }*/
 
    /**/
    if(n == 256){
    	return mulMatrix(rst, a, b, n);
	}
	else if(n==2){
        return strassen2(rst, a, b);
    }
    n2 = n/2;

    p1 = newMatrix(n2, n2);
    p2 = newMatrix(n2, n2);
    p3 = newMatrix(n2, n2);
    p4 = newMatrix(n2, n2);
    p5 = newMatrix(n2, n2);
    p6 = newMatrix(n2, n2);
    p7 = newMatrix(n2, n2);
 
    a11 = newMatrix(n2, n2);
    a12 = newMatrix(n2, n2);
    a21 = newMatrix(n2, n2);
    a22 = newMatrix(n2, n2);
    b11 = newMatrix(n2, n2);
    b12 = newMatrix(n2, n2);
    b21 = newMatrix(n2, n2);
    b22 = newMatrix(n2, n2);    
    m11 = newMatrix(n2, n2);
    m12 = newMatrix(n2, n2);
    m21 = newMatrix(n2, n2);
    m22 = newMatrix(n2, n2);    
    arst = newMatrix(n2, n2);
    brst = newMatrix(n2, n2);
    
    for(i=0 ; i<n2; ++i){
        for(j=0 ; j<n2; ++j){
            a11[i][j] = a[i][j];
            a12[i][j] = a[i][n2+j];
            a21[i][j] = a[i+n2][j];
            a22[i][j] = a[i+n2][j+n2];
 
            b11[i][j] = b[i][j];
            b12[i][j] = b[i][n2+j];
            b21[i][j] = b[i+n2][j];
            b22[i][j] = b[i+n2][j+n2];
        }
    }
    //p1 = (a12 - a22) * (b21 + b22)
    strassen(p1, sub(arst, a12, a22, n2, n2), add(brst, b21, b22, n2, n2), n2);
    //p2 = (a11 + a22) * (b11 + b22)
    strassen(p2, add(arst, a11, a22, n2, n2), add(brst, b11, b22, n2, n2), n2);
    //p3 = (a11 - a21) * (b11 + b12)
    strassen(p3, sub(arst, a11, a21, n2, n2), add(brst, b11, b12, n2, n2), n2);
    //p4 = (a11 + a12) * b22
    strassen(p4, add(arst, a11, a12, n2, n2), b22, n2);
    //p5 = a11 * (b12 - b22)
    strassen(p5, a11, sub(brst, b12, b22, n2, n2), n2);
    //p6 = a22 * (b21 - b11)
    strassen(p6, a22, sub(brst, b21,b11, n2, n2), n2);
    //p7 = (a21 + a22) * b11
    strassen(p7, add(arst, a21, a22, n2, n2), b11, n2);
    //m11 = p1 + p2 - (p4 - p6)
    sub(m11, add(arst, p1, p2, n2, n2), sub(brst, p4, p6, n2, n2), n2, n2);
    //m12 = p4 + p5
    add(m12, p4, p5, n2, n2);
    //m21 = p6 + p7
    add(m21, p6, p7, n2, n2);
    //m22 = p2 - p3 + p5 - p7
    add(m22, sub(arst, p2, p3, n2, n2), sub(brst, p5, p7, n2, n2), n2, n2);
   
    for(i=0; i<n2; ++i){
        for(j=0; j<n2; ++j){
            rst[i][j] = m11[i][j];
            rst[i][j+n2] = m12[i][j];
            rst[i+n2][j] = m21[i][j];
            rst[i+n2][j+n2] = m22[i][j];
        }
    }

    free(p1);
    free(p2);
    free(p3);
    free(p4);
    free(p5);
    free(p6);
    free(p7);
    free(arst);
    free(brst);
    free(m11);
    free(m12);
    free(m21);
    free(m22);
    return rst;
}

int main(int argc, char *argv[]){
    
	FILE *fin = fopen("test3.txt", "r");
    FILE *fout = fopen("output.txt", "w");
    if(fin==NULL){
        printf("Failed opening file.\n");
        exit(1);
    }
    clock_t start, end;
	int row1, col1, row2, col2, i, j;
    //first matrix
	fscanf(fin, "%d", &row1);
	fscanf(fin, "%d", &col1);
	int **m1 = newMatrix(row1, col1);
	for(i=0; i<row1; i++){
		for(j=0; j<col1; j++){
			fscanf(fin, "%d", &m1[i][j]);
		}
	}
	//second matrix
	fscanf(fin, "%d", &row2);
	fscanf(fin, "%d", &col2);
	int **m2 = newMatrix(row2, col2);
	for(i=0; i<row2; i++){
		for(j=0; j<col2; j++){
			fscanf(fin, "%d", &m2[i][j]);
		}
	}
	//start strassen
    int **result = newMatrix(row1, col2);
    start = clock();
    strassen(result, m1, m2, row1);
    end = clock();
    
    fprintf(fout, "%d %d\n", row1, col2);
    for(i=0; i<row1; i++){
		for(j=0; j<col2; j++){
			fprintf(fout, "%d ", (int)result[i][j]);
		}
		fprintf(fout, "\n");
	}
	fprintf(fout,"Time used: %lf seconds.\n", (end-start)/(double)(CLOCKS_PER_SEC));
    fclose(fin);
	fclose(fout);
    return 0;
}
