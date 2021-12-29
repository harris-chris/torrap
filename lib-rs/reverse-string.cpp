void manipulate(char* orig, char *reversed) {
  int strLen{0};
  char c = *orig;
  while (c != '\n') {
    ++strLen;
    ++c;
  }

  for (int i = 0; i < strLen; ++i)
    *(reversed + strLen - i) = *(orig + i);
}

