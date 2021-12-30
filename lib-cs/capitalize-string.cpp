#include <locale>
#include <iostream>

extern "C" {
  void manipulate(char* origString, char *newString) {
    std::cout << "Capitalizing string!\n";
    int i{0};
    while (*(origString + i) != '\0') {
      *(newString + i) = toupper(*(origString + i));
      ++i;
    }
  }
}

