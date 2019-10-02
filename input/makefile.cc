#include <iostream>
#include <fstream>
#include <cmath>

using namespace std;

double func (double x) {
  double l = cos(x);
  return l;
}

int main() {

  const int n = 5;

  ofstream outfile("lagr.in");
  outfile << n << endl;

  double X[n] = {-2, -0.5, 1.3, 4.5, 5.0}; 

  for (int i = 0; i < n; i++) {
    outfile << X[i] << " " <<  func(X[i]) << endl;
  }
}