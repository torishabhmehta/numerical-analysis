#include <iostream>
#include <fstream>
#include <cmath>

double func (double x) {
  double func = x;
  return func;
}

int main () {

  int n;
  double I = 0, a, b;

  cin >> a >> b;

  ifstream infile("gaussqdr.in");
  infile >> n;

  double* C = new double[n];
  double* t = new double[n];

  for (int i = 0; i < n; i++) {

    infile >> C[i] >> t[i];
    double x = (b-a)*t[i]/2 + (b+a)/2;
    I = I + C[i]*func(x);
  }

  cout << "The integration of the above function under limits " << a <<  " and " << b << " is: " << I << endl;
}