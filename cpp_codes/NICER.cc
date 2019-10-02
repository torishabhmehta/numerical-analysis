#include <iostream>
#include<string>
using namespace std;
int main() {
  int a, b;
  string str;
  cout << "insert two numbers:" << endl;
  cin >> a >> b;
  a = a+b;
  str = a == 69 ? "sex" : a == 420 ? "drug" : a == 666 ? "satan" : "bad";
  cout << "NICE the " + str + " number HaHa!" << endl;
}