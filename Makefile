all: newProblem2.cpp
<<<<<<< HEAD
	g++ -std=c++0x myProblem2.cpp -lgomp -fopenmp -o myProblem2.out && ./myProblem2.out
clean:
	$(RM) ./*.out
=======
	g++ -std=c++0x -g newProblem2.cpp -lgomp -fopenmp -o newProblem2.out

>>>>>>> 886f3c9689e300c29644bcd263b43fbdcc13e713
