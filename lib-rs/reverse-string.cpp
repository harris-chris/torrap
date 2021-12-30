#include <iostream>

extern "C" {
  void manipulate(char* orig, char *reversed) {
    std::cout << "Reversing string!\n";
    int strLen{0};
    while (*(orig + strLen) != '\0')
      ++strLen;

    for (int i = 0; i < strLen; ++i)
      *(reversed + strLen - i - 1) = *(orig + i);
  }
}

