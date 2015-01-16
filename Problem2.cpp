#include <stdio.h>
#include <stdlib.h>
#include <iostream>
#include <string>
#include <sstream>
#include <unordered_map>
#include <omp.h>

using namespace std;

int *numcount(int *x, int n, int m) {
	unordered_map <string, int> mapCount;
	string key;
	int val;
	int firstIter = 0;
	int lastIter = m;
	#pragma omp parallel for 
	{
		for(int i = 0; i < n - m + 1; i++) {
			stringstream convert;
			for(int j = firstIter; j < lastIter; j++) {
				if(j == lastIter - 1)
					convert << x[j];
				else
					convert << x[j] << ",";
			}
			key = convert.str();
			#pragma omp critical (writeToHash)
			{
				mapCount[key]++;
			}
			//move our gaze to the next chunk of size m
			firstIter++;
			lastIter++;
		}
	}
	int *results;
	int mapSize = mapCount.size();
	//declare new array of size (m + 1) * mapSize + 1 to store the results
	results = new int[(m + 1)* mapSize + 1];
	int i = 1;
	//set the first element to the number of patterns found
	results[0] = mapSize;		
	//done in serial because it is quite fast?
	
	for(auto j = mapCount.begin(); j != mapCount.end(); ++j) {
		key = j->first; // Key
		int temp = j->second;
		istringstream ss(key);
		//loop that stores the integer value of the key string for the hash seperated by ','
		while(getline(ss,key,',')) {
			results[i] = atoi(key.c_str());
			i++;
		}
		results[i] = temp; // Value
		i++;
	}

	// for(int i = 0; i < (m + 1)* mapSize + 1; i++) {
	// 	cout << results[i] << " ";
	// }
	cout << results[0];
	cout << endl;
	return results;
};
	

int main (int argc, char** argv)
{
	int x[] = {3,4,5,12,13,4,5,12,4,5,6,3,4,5,13,4,5};
	int * y;
	y = x;
	
	double starttime, endtime;
	init(argc, argv);
	startime = omp_get_wtime();
	int *test = numcount(y, 17, 3);
	endtime = omp_get_wtime();
	cout << "Elapsed time: " << endtime - startime << endl;
	//for(int i = 0; i < total_size; i++)

    	
    return 0;
}	