#include <stdio.h>
#include <stdlib.h>
#include <iostream>
#include <string>
#include <sstream>
#include <unordered_map>
//#include <omp.h>

using namespace std;

int *numcount(int *x, int n, int m) {
	unordered_map <string, int> mapCount;
	string key;
	int val;
	int firstIter = 0;
	int lastIter = m;
	//#pragma omp parallel for reduction(+:count) schedule(static, 1)
	for(int i = 0; i < n - m + 1; i++) {
		stringstream convert;
		for(int j = firstIter; j < lastIter; j++) {
			convert << x[j] << ",";
		}
		key = convert.str();
		//#pragma omp critical (writeToHash)
		{
			mapCount[key]++;
		}
		cout << key << mapCount[key] <<endl;
		firstIter++;
		lastIter++;
	}
	int result[(m + 1)* mapCount.size()];
	auto it = mapCount.begin();
	
	for(auto i = it; i != mapCount.end(); ++i) {
		key = i->first; // Key
		istringstream ss(key);
		while(getline(ss,key,',')) {
			cout << key << endl;
		}
		val = i->second; // Value
	}
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