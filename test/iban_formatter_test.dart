import 'package:flutter_test/flutter_test.dart';
import 'package:iban_formatter/iban_formatter.dart';

void main() {
  test('IBAN formatter test', () {
    const countryCode = CountryCode.AE;
    final formatter = IbanTextInputFormatter(countryCode: countryCode);

    expect(formatter.countryCode, equals(CountryCode.AE));
    expect(formatter.grupSize, equals(4));
    expect(formatter.added, equals(Added.zero));
  });
}
