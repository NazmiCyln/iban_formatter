import 'package:flutter/material.dart';
import 'package:iban_formatter/iban_formatter.dart';

void main() {
  final formatter1 = IbanTextInputFormatter(
    countryCode: CountryCode.TR,
    added: Added.two,
  );

  final formatter2 = IbanTextInputFormatter(
    countryCode: CountryCode.UA,
    grupSize: 2,
    added: Added.zero,
  );

  TextFormField(
    inputFormatters: [formatter1],
  );

  TextFormField(
    inputFormatters: [formatter2],
  );
}
