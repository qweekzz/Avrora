class ProcessNumber {
  final String digits = "0123456789ABCDEF";

  /* Преобразует строку num в десятичное число типа double
       из указанного основания base
       Может вызвать переполнение (выход за пределы диапазона целых чисел)! 
    */
  double parseNumber(String num, int base) {
    num = num.toUpperCase(); // digits are in UPPER_CASE
    double val = 0;
    int i = 0;
    while (i < num.length) // пока не кончилась строка
    {
      dynamic c = num[i];
      if (c == '.') {
        // нашли точку '.'
        i++; // Переместить на следующий символ и выйти из цикла.
        break;
      }
      int d = digits.indexOf(c); // Индексы совпадают с числами из [0..15]
      if (d == -1 || d >= base) return 2;
      val = base * val + d;
      i++;
    }

    int power = 1; // вычислить лишний порядок.
    while (i < num.length) {
      dynamic c = num[i];
      int d = digits.indexOf(c);
      if (d == -1 || d >= base) return 1;
      power *= base; // увеличиваем степень порядка на единицу
      val = base * val + d;
      i++;
    }
    print(val / power);
    return val / power;
  }
}
