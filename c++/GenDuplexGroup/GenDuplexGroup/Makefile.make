CC=/Share/home/zhangqf/lipan/gcc-6.1.0/bin/bin/g++

export C_INCLUDE_PATH=/Share/home/zhangqf/lipan/gccDependance/gmp/include:/Share/home/zhangqf/lipan/gccDependance/mpc/include:/Share/home/zhangqf/lipan/gccDependance/mpfr/include
export CPLUS_INCLUDE_PATH=/Share/home/zhangqf/lipan/gccDependance/gmp/include:/Share/home/zhangqf/lipan/gccDependance/mpc/include:/Share/home/zhangqf/lipan/gccDependance/mpfr/include
export LD_LIBRARY_PATH=/Share/home/zhangqf/lipan/gccDependance/gmp/lib:/Share/home/zhangqf/lipan/gccDependance/mpc/lib:/Share/home/zhangqf/lipan/gccDependance/mpfr/lib:/Share/home/zhangqf/lipan/gcc-6.1.0/bin/lib64

CFLAGS=-std=c++11 -Wall -c

all: paris

paris: TimeFunc.o Files.o environment.o DuplexGroup.o main.o
	$(CC) -I. main.o TimeFunc.o Files.o environment.o DuplexGroup.o -o paris
	rm *.o
	cp paris ../../../bin

main.o: main.cpp
	$(CC) $(CFLAGS) main.cpp

TimeFunc.o: TimeFunc.cpp
	$(CC) $(CFLAGS) TimeFunc.cpp

Files.o: Files.cpp
	$(CC) $(CFLAGS) Files.cpp

environment.o: environment.cpp
	$(CC) $(CFLAGS) environment.cpp

DuplexGroup.o: DuplexGroup.cpp
	$(CC) $(CFLAGS) DuplexGroup.cpp