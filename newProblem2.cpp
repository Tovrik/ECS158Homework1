#include <stdio.h>
#include <stdlib.h>
#include <iostream>
#include <string>
#include <sstream>
#include <unordered_map>
#include <omp.h>

using namespace std;


static const int ARRAY_SIZE = 1000;
int nth, 			//number of threads
chunk, 				//number of verticies handled by each thread 	
globalIndex = 0;	//index used as value of globalHash 

unordered_map <string, int> globalHash;
unordered_map <int, int> t0;
unordered_map <int, int> t1;
unordered_map <int, int> t2;
unordered_map <int, int> t3;
unordered_map <int, int> t4;
unordered_map <int, int> t5;
unordered_map <int, int> t6;
unordered_map <int, int> t7;

unordered_map<int, int> *whichHash(int nth) {
	switch(nth) {
		case 0:
			return &t0;
			break;
		case 1:
			return &t1;
			break;
		case 2:
			return &t2;
			break;
		case 3:
			return &t3;
			break;
		case 4:
			return &t4;
			break;		
		case 5:
			return &t5;
			break;
		case 6:
			return &t6;
			break;
		case 7:
			return &t7;
			break;		
	}
};

int *numcount(int *x, int n, int m) {
	int *results = new int[(m + 1)* globalHash.size() + 1];
	omp_set_dynamic(0);     // Explicitly disable dynamic teams
	omp_set_num_threads(8); // Use 8 threads for all consecutive parallel regions
	#pragma omp parallel
	{
		int me = omp_get_thread_num(); //current thread number
		int myIndex ; //local hash key  or global hash value
		unordered_map <int, int> *myHash;

		#pragma omp single
		{
			nth = omp_get_num_threads();	//number of threads
			chunk = n / nth; 				//chunk size
		}
		int begin = me * chunk;		//beginning of chunk
		int end = begin + chunk;	//end of chunk 
		me = omp_get_thread_num();	//determine current thread
		myHash = whichHash(me); 	//determine which hash current thread is working on
		
		//beginning of parallel for loop
		//#pragma omp for 
		if(end < n && me == nth - 1) {
			end = n - m + 1;
		}
		for(int i = begin; i < end; i++) {
			stringstream convert;
			string key;
			for(int j = i; j < i + m; j++) {
				if(j == i + m - 1) {
					convert << x[j];					
				}
				else {
					convert << x[j] << ",";
				}

			}
			key = convert.str();
			if(!globalHash.count(key)) {
				#pragma omp critical
				{
					globalHash[key] = globalIndex;	//create index for local hash in global
					myIndex = globalIndex;
					globalIndex++;
				}					
			}		
			else {
				myIndex = globalHash[key]; 		//grab index for local hash from global
			}
			(*myHash)[myIndex]++;

			// cout << "Thread number: " << me << endl;
			// cout << "BEGIN =        " << begin << endl;
			// cout << "END =          " << end << endl << endl;

		}
	}	
	int i = 1;
	string key = "";
	results[0] = globalHash.size();
	for(auto j = globalHash.begin(); j != globalHash.end(); ++j) {
		key = j->first; 			// Key
		int temp = j->second; 		// Global value local key
		istringstream ss(key); 		// Stringstream is for converting key back to integers
		//loop that stores the integer value of the key string for the hash seperated by ','
		while(getline(ss,key,',')) {
			results[i] = atoi(key.c_str());
			i++;
		}
		results[i] = t0[temp] + t1[temp] + t2[temp] +t3[temp] +t4[temp] +t5[temp] +t6[temp] +t7[temp]; // Value
		i++;
	}

	// for(int i = 0; i < (m + 1)* globalHash.size() + 1; i++) {
	// 	cout << results[i] << ", " ;
	// 	if (i % 4 == 0)
	// 		cout << endl;
	// }
	// cout << endl;

};


 

int main (int argc, char** argv) {
	int x[ARRAY_SIZE];
	for(int i = 0; i < ARRAY_SIZE; i++)
		x[i] = rand()%100+1;
	// int x[] = {3,4,5,12,13,4,5,12,4,5,6,3,4,5,13,4,5};
	int * y;
	y = x;

	numcount(y, ARRAY_SIZE, 3);
	return 0;
}