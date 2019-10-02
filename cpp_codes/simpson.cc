#include <iostream>
#include <fstream>
#include <cmath>

using namespace std;

double func (double x) {
  double func = x;
  return func;
}

int main () {

  double a, b, h, I = 0;
  int n;

  cout << "Please enter integration limits: " << endl;
  cin >> a >> b >> n;

  h = (b-a)/n;
  I = I + func(a) + func(b);

  for (int i = 1; i < n; i++) {
    int weight = (n%2 ? 4 : 2);
    I = I + weight*func(a + i*h);
  }

  I = h*I/3.;

  cout << "The integration of the above function under limits " << a <<  " and " << b << " is: " << I << endl;
}