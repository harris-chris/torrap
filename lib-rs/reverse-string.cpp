extern "C" {
  void manipulate(char* orig, char *reversed) {
    int strLen{0};
    while (*(orig + strLen) != '\0')
      ++strLen;

    for (int i = 0; i < strLen; ++i)
      *(reversed + strLen - i - 1) = *(orig + i);
  }
}

