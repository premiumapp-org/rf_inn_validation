import 'package:rf_inn_validation/rf_inn_validation.dart';
import 'package:test/test.dart';

void main() {
  test('assure that input is 12 digits string', () {
    expect(isTwelveDigitsString(''), false);
    expect(isTwelveDigitsString('abcabcabcabc'), false);
    expect(isTwelveDigitsString('12345678901'), false);
    expect(isTwelveDigitsString('a23456789012'), false);
    expect(isTwelveDigitsString('123456789012'), true);
  });

  test('test person inn correctness', () {
    // invalid
    expect(isPersonInnValid(null), false);
    expect(isPersonInnValid(''), false);
    expect(isPersonInnValid('1'), false);
    expect(isPersonInnValid('123456789012'), false);
    expect(isPersonInnValid('7723274005'), false);
    // valid
    expect(isPersonInnValid('027188439560'), true);
    expect(isPersonInnValid('618620222755'), true);
  });
}
