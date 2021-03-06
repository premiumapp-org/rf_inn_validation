///     Проверка действительности ИНН
///     Идентификаторы ИНН (Идентификационный Номер Налогоплательщика) бывают 10-значные с одной контрольной цифрой в конце (для юридических лиц) и 12-значные с двумя контрольными цифрами в конце (для физических лиц и индивидуальных предпринимателей).
///     Проверку ИНН проводят путем вычисления одного контрольного числа для 10-значных ИНН и двух контрольных чисел для 12-значных ИНН. Коэффициенты для вычисления первого контрольного числа n1 для 10-значного ИНН:
///     2, 4, 10, 3, 5, 9, 4, 6, 8.
///     Коэффициенты для вычисления первого контрольного числа n1 для 12-значного ИНН:
///     3, 7, 2, 4, 10, 3, 5, 9, 4, 6, 8.
///     Коэффициенты для вычисления второго контрольного числа n2 для 12-значного ИНН:
///     7, 2, 4, 10, 3, 5, 9, 4, 6, 8.
///     Шаг 1. Контрольное число n1 вычисляется как остаток от деления на 11 суммы из цифр номера (по порядку слева направо), умноженных на соответствующие (приведенные выше) коэффициенты. Если в остатке получается 10, то n1 = 0. Полученное контрольное число n1 должно совпадать с последней цифрой ИНН (как 10-значного, так и 12-значного).
///     Шаг 2 (только для 12-значного ИНН). Контрольное число n2 - это остаток от деления на 11 суммы из цифр номера, умноженных на соответствующие коэффициенты (аналогично шагу 1). Если в остатке получается 10, то n2 = 0. Полученное контрольное число n2 должно совпадать с предпоследней цифрой 12-значного ИНН.

bool isPersonInnValid(String inn) {
  const multipliers1 = [7, 2, 4, 10, 3, 5, 9, 4, 6, 8];
  const multipliers2 = [3, 7, 2, 4, 10, 3, 5, 9, 4, 6, 8];

  if (!isTwelveDigitsString(inn)) {
    return false;
  }

  final digits = inn.split('').map((ch) => int.parse(ch)).toList();

  final n1 = _calculateControlNumber(multipliers1, digits);
  final n2 = _calculateControlNumber(multipliers2, digits);

  return (digits[10] == n1 % 11 % 10) && (digits[11] == n2 % 11 % 10);
}

bool isOrganizationInnValid(String inn) {
  const multipliers = [2, 4, 10, 3, 5, 9, 4, 6, 8];

  if (!isTenDigitsString(inn)) {
    return false;
  }

  final digits = inn.split('').map((ch) => int.parse(ch)).toList();

  final n = _calculateControlNumber(multipliers, digits);

  return digits[9] == n % 11 % 10;
}

// helpers

bool isTenDigitsString(String value) =>
    null != value && RegExp(r"^\d{10}$").hasMatch(value);

bool isTwelveDigitsString(String value) =>
    null != value && RegExp(r"^\d{12}$").hasMatch(value);

int _calculateControlNumber(List<int> mpl, List<int> digits) => mpl
    .asMap()
    .entries
    .map((e) => e.value * digits[e.key])
    .reduce((acc, n) => acc + n);
