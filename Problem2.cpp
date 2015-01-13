#include <iostream>
#include <vector>
//#include <omp.h>

using namespace std;

int *numcount(int *x, int n, int m) {
	bool inSeq = false;
	int count = 0;
	int smallCount = 0;
	int firstIter = 0;
	int lastIter = m;
	int compareArray[m];
	int results[n-m + 1][m+1];
	//#pragma omp parallel for reduction(+:count) schedule(static, 1)
	for(int i = 0; i < n - m + 1; i++) {
		for(int j = firstIter; j < lastIter; j++) {
			for(int k = 0; k < m; k++) {
				compareArray[k] = x[j];
			}
		}
		firstIter++;
		lastIter++;
		for(int j = 0; j < m; j++){
			results[i][j] = compareArray[j];
		}
		for(int j = 0; j < n - m + 1; j++) {
			if(x[j] == compareArray[smallCount] && smallCount != m) {
				inSeq = true;
				smallCount++;
			}
			else if(smallCount == m){
				count++;
			}
			else {
				inSeq = false;
				smallCount = 0;
			}
		}
		results[i][m] = count;
		cout << count << endl;
		count = 0;
	}
	for(int i = 0; i < n - m + 1; i++) {
		for(int j = 0; j < m; j++) {
			cout << results[i][j] << " ";
		}
		cout << endl;
	}
	//return temp;
	cout << endl;
};
	

int main (int argc, char** argv)
{
	int x[] = {3,4,5,12,13,4,5,12,4,5,6,3,4,5,13,4,5};
	int * y;
	y = x;
	int *test = numcount(y, 17, 3);
	for(int i = 0; i < 17; i++)
		//cout << test[i] << ", ";
    	
    return 0;
}	