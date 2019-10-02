#include <iostream>
#include <fstream>
#include <cmath>

using namespace std;

const double h = 1e-4;

double func (x) {
  func = x;
  return func;
}

int main () {

  double x;
  cin >> x;

  f_dash = {func(x+h) - func(x-h)}/2;

  cout << "The first derivative of the function is: " << f_dash << endl;
}