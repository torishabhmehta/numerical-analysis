#include <iostream>
#include <cmath>

using namespace std;

double func (double x) {
  double func = log(x) + 5*x - 1000;
  return func;
}

double diff_func (double x) {
  double func = 5 + 1/x;
  return func;
}

int main() {

  double tol = 1e-4, eta = 100., x[2] = {200.,0.1};

  while (eta > tol) {
    x[2] = x[1] - func(x[1])/diff_func(x[1]);
    eta = abs ((x[2] - x[1])*100/x[1]);
    x[1] = x[2];
  }

  cout << "The root of the given expression is : " << x[1] << endl << "The error is: " << eta << endl;
}