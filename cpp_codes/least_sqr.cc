#include <iostream>
#include <fstream>
#include <cmath>

using namespace std;

double line (double x, double a0, double a1) {
  double func = a0 + a1*x;
  return func;
}

int main () {

  int n;
  double err, S = 0, Sy, a0, a1, xbar = 0, ybar = 0, xsqrbar = 0, ysqrbar = 0, xybar = 0, cc;

  ifstream infile("least_sqr.in");
  infile >> n;

  double* X = new double[n];
  double* Y = new double[n];

  for (int i = 0; i < n; i++) {
    infile >> X[i] >> Y[i];
    xbar = xbar + X[i]/n;
    ybar = ybar + Y[i]/n;
    xsqrbar = xsqrbar + X[i]*X[i]/n;
    ysqrbar = ysqrbar + Y[i]*Y[i]/n;
    xybar = xybar + X[i]*Y[i]/n;
  }

  a1 = (xybar - xbar*ybar)/(xsqrbar - xbar*xbar);
  a0 = ybar - a1*xbar;

  for (int i = 0; i < n; i++) {
    err = Y[i] - line(X[i], a0, a1);
    S = S + err*err;
  }

  Sy = n*n*(ysqrbar - ybar*ybar);

  cc = sqrt((Sy-S)/S);

  cout << "The fitted line is: " << a0 << "+" << a1 << "x" << endl << "Error squared is: " << S << endl << "Corelation Coefficient is: " << cc << endl;

}