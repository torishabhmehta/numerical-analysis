#include <iostream>
#include <fstream>
#include <cmath>

using namespace std;

double Li (double x, double* X, int i, int n) {

  double l =  1.0;

  for (int j = 0; j < n; j++) {
    if (j == i) continue;
    l = l*(x - X[j])/(X[i] - X[j]);
  }

  return l;
}

int main() {

  int n;
  double x = 0.3, val = 0.;

  ifstream infile("lagr.in");
  infile >> n;

  double* X = new double[n];
  double* Y = new double[n];

  for (int i = 0; i < n; i++) {
    infile >> X[i] >> Y[i];
  }

  for (int i = 0; i < n; i++) {
    val = val + Li(x, X, i, n)*Y[i];
  }

  cout << "The value of the interpolated function at x = " << x << " is: " << val << endl;
}