all: Problem2.cpp
	g++ -std=c++0x -g Problem2.cpp -lgomp -fopenmp -o Problem2.out && ./Problem2.out
clean:
	$(RM) ./*.out