all: newProblem2.cpp
	g++ -std=c++0x -g myProblem2.cpp -lgomp -fopenmp -o myProblem2.out && ./myProblem2.out
clean:
	$(RM) ./*.out