import 'package:rf_inn_validation/rf_inn_validation.dart';
import 'package:test/test.dart';

void main() {
  test('assure that input is 12 digits string', () {
    expect(isTwelveDigitsString(''), false);
    expect(isTwelveDigitsString('abcabcabcabc'), false);
    expect(isTwelveDigitsString('12345678901'), false);
    expect(isTwelveDigitsString('a23456789012'), false);
    expect(isTwelveDigitsString('1234567890123'), false);
    expect(isTwelveDigitsString('123456789012'), true);
  });

  test('assure that input is 12 digits string', () {
    expect(isTenDigitsString(''), false);
    expect(isTenDigitsString('abcabcabca'), false);
    expect(isTenDigitsString('a23456789'), false);
    expect(isTenDigitsString('12345678901'), false);
    expect(isTenDigitsString('1234567890'), true);
  });

  test('test person inn correctness', () {
    // invalid
    expect(isPersonInnValid(''), false);
    expect(isPersonInnValid('1'), false);
    expect(isPersonInnValid('123456789012'), false);
    expect(isPersonInnValid('7723274005'), false);
    // valid
    expect(isPersonInnValid('027188439560'), true);
    expect(isPersonInnValid('618620222755'), true);
  });

  test('test organization inn correctness', () {
    // invalid
    expect(isOrganizationInnValid(''), false);
    expect(isOrganizationInnValid('1'), false);
    expect(isOrganizationInnValid('1234567890'), false);
    expect(isOrganizationInnValid('7723274005'), false);
    // valid
    expect(isOrganizationInnValid('7728168971'), true); // alfa bank
    expect(isOrganizationInnValid('7710140679'), true); // tinkoff bank
  });
}
