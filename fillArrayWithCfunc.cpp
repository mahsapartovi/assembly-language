// 11fillArrayWithCfunc.cpp : Defines the entry point for the console application.
// Telegram Channel @AssemblyTutorials

#include "stdafx.h"
#include <iostream>

extern "C"
{
	// local c/c++ functions
	int getint();
	// external assembly functions
	void fillArray(int* a);
}
int getint()
{
	int a;
	std::cin >> a;
	return a;
}
int main()
{
	int a[2];
	fillArray(a);
	std::cout << a[0] << ' ' << a[1];
	std::cin >> a[0];
}