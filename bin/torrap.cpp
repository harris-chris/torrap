#include <dlfcn.h>
#include <iostream>
#include <cstring>
#include <stdio.h>

extern char **environ;

int main(int argc, char* argv[]) {
  typedef void (*manip_func_ptr)(char*, char*);
  void *handle;
  manip_func_ptr manip;
  char* error;

  char **s = environ;
  while (*s)
    std::cerr << *s++ << "\n";

  handle = dlopen("stringManip.so", RTLD_LAZY);
  if (!handle) {
      fputs (dlerror(), stderr);
      exit(1);
  }  char* origStr = argv[1];

  manip = (manip_func_ptr)dlsym(handle, "manipulate");
  if ((error = dlerror()) != NULL)  {
      fputs(error, stderr);
      exit(1);
  }

  std::cerr << origStr << "\n";
  char newStr[strlen(origStr)];
  (*manip)(origStr, newStr);
  std::cout << "string before: " << origStr;
  std::cout << "string after: " << newStr;
  dlclose(handle);
  return 0;
}
