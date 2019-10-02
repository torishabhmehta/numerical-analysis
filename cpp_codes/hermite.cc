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

double Li_dash (double* X, int i, int n) {

  double val = 0;

  for (int j = 0; j < n; j++) {
    if (j == i) continue;
    val = val + 1/(X[i] - X[j]);
  }

  return val;
}

int main () {

  int n;
  double x = 0.3, val = 0.;

  ifstream infile("hermite.in");
  infile >> n;

  double* X = new double[n];
  double* Y = new double[n];
  double* Y_dash = new double[n];


  for (int i = 0; i < n; i++) {
    infile >> X[i] >> Y[i] >> Y_dash[i];
  }

  for (int i = 0; i < n; i++) {
    val = val + ((1-2*(x-X[i])*Li_dash(X, i, n))*Y[i] + (x-X[i])*Y_dash[i])*Li(x, X, i, n)*Li(x, X, i, n);
  }

  cout << "The value of the interpolated function at x = " << x << " is: " << val << endl;
}