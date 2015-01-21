all: newProblem2.cpp
	g++ -std=c++0x -g newProblem2.cpp -lgomp -fopenmp -o newProblem2.out

