#include <iostream>
#include <dlfcn.h>

int main(int argc, char* argv[]) {
  dlopen("stringManip.so", RTLD_LAZY);
  return 0;
}
