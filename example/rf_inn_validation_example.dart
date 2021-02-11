import 'package:rf_inn_validation/rf_inn_validation.dart';

void main() {
  final someOrganizationInn = '7728168971';
  final somePersonInn = '618620222755';

  print(isOrganizationInnValid(someOrganizationInn));
  print(isPersonInnValid(somePersonInn));
}
