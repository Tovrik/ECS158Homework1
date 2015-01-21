#include <stdio.h>
#include <stdlib.h>
#include <iostream>
#include <string>
#include <sstream>
#include <unordered_map>
#include <omp.h>

using namespace std;


static const int ARRAY_SIZE = 100;
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

int *numcount(int *x, int n, int m) {
	omp_set_dynamic(0);     // Explicitly disable dynamic teams
	omp_set_num_threads(8); // Use 8 threads for all consecutive parallel regions
	#pragma omp parallel
	{
		int me = omp_get_thread_num(); //current thread number
		#pragma omp single
		{
			nth = omp_get_num_threads();
			cout << "NUMBER OF THREADS = :" << nth << endl;
			chunk = n / nth; 
		}
		int begin = me * chunk;
		int end = begin + chunk;
		me = omp_get_thread_num();
		//beginning of parallel for loop
		#pragma omp for 
		for(int i = begin; i < end; i++) {
			stringstream convert;
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
				globalHash[key] = globalIndex;
				globalIndex++;
			}
			else {

			}

			// cout << "Thread number: " << me << endl;
			// cout << "BEGIN =        " << begin << endl;
			// cout << "END =          " << end << endl << endl;

		}
	}	
};


int main (int argc, char** argv) {
	int x[ARRAY_SIZE];
	for(int i = 0; i < ARRAY_SIZE; i++)
		x[i] = rand()%100+1;
	int * y;
	y = x;

	numcount(y, ARRAY_SIZE, 3);
	return 0;
}