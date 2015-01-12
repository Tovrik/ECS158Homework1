#include <iostream>

using namespace std;

int *numcount(int *x, int n, int m) {
	int temp[n-m+1];
	int count1 = x[0];
	int count2 = x[1];
	int count3 = x[2];
	cout << &count1;
	for(int i = 0; i < n - m; i++) {

	}
	//return temp;
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