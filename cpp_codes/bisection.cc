#include <iostream>
#include <cmath>

using namespace std;

double func (double x) {
  double func = 4*exp(-x)*(3.2*sin(x) - 0.5*cos(x));
  return func;
}

int main() {

  double xl = 3., xu = 4., tol = 1e-4, eta = 100., xm[2];
  int n = 0;

  while (eta > tol) {

    xm[1] = (xu + xl)/2.;

    if (func(xm[1])*func(xu) > 0) {
      xu = xm[1];
    } else {
      xl = xm[1];
    }

    if (n) {
      eta = abs ((xm[1] - xm[0])*100/xm[0]);
    }

    xm[0] = xm[1];
    n++;
  }

  cout << "The root of the given expression is : " << xm[1] << endl << "The tolerance is : " << eta << endl;
}