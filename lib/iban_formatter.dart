library iban_formatter;

import 'package:flutter/services.dart';
import 'package:iban_formatter/src/regexp.dart';
import 'package:iban_formatter/src/regexp_extension.dart';

class IbanTextInputFormatter extends TextInputFormatter {
  final int grupSize;
  final Added added;
  CountryCode countryCode;

  IbanTextInputFormatter({this.grupSize = 4, this.added = Added.zero, required this.countryCode});

  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    String text = newValue.text;

    String newText = newValue.text.toUpperCase().replaceAll(" ", "").replaceAll(RegExp('[A-Za-z]'), "");

    if (text.contains(emoji)) {
      text = oldValue.text;

      return TextEditingValue(
        text: text,
        selection: TextSelection.collapsed(offset: text.length),
      );
    }

    if (text.toUpperCase().contains(RegExp('[A-Z]'))) {
      text = text.replaceAll(RegExp('[A-Za-z]'), "");

      if (newText.length > countryCode.value) {
        text = text.replaceAll(" ", "");
        text = text.substring(0, countryCode.value);
      }

      var splitText = _splitInGroupsOfFour(text, groupSize: grupSize, added: added.value);

      return TextEditingValue(
        text: splitText,
        selection: TextSelection.collapsed(offset: splitText.length),
      );
    }

    if (newText.length > countryCode.value) {
      text = text.replaceAll(" ", "");
      text = text.substring(0, countryCode.value);

      var splitText = _splitInGroupsOfFour(text, groupSize: grupSize, added: added.value);

      return TextEditingValue(
        text: splitText,
        selection: TextSelection.collapsed(offset: splitText.length),
      );
    }

    if (newText.length > countryCode.value || newText.isValidIban) {
      text = oldValue.text;
      // text = text.substring(0, countryCode.value);
      return TextEditingValue(
        text: text,
        selection: TextSelection.collapsed(offset: text.length),
      );
    }

    var oldOffset = newValue.selection.baseOffset -
        RegExp(' ')
            .allMatches(text)
            .map((e) => e.start < newValue.selection.baseOffset)
            .fold(0, (x, y) => x + (y ? 1 : 0));

    var splitText = _splitInGroupsOfFour(text, added: added.value, groupSize: grupSize);

    var newOffset = oldOffset;
    for (var i = 0; i < newOffset; i += 1) {
      if (splitText[i] == ' ') {
        newOffset += 1;
      }
    }

    return TextEditingValue(
      text: splitText,
      selection: TextSelection.collapsed(
        offset: newOffset as int,
      ),
    );
  }

  String _splitInGroupsOfFour(String input, {required int groupSize, required int added}) {
    input = input.replaceAll(RegExp(' '), '');
    var segments = input.split('');
    var groupSizes = groupSize;
    var addeds = added;

    var it = segments.iterator;
    final buffer = StringBuffer();
    while (it.moveNext()) {
      if (addeds != 0 && addeds % groupSizes == 0) {
        buffer.write(' ');
      }
      addeds++;
      buffer.write(it.current);
    }
    return buffer.toString();
  }
}

enum CountryCode {
  DE(20),
  AD(22),
  AL(26),
  AT(18),
  AZ(26),
  BH(20),
  BY(26),
  BE(14),
  AE(21),
  GB(20),
  BA(18),
  BR(27),
  BG(20),
  GI(21),
  DK(16),
  DO(26),
  TL(21),
  SV(26),
  EE(18),
  FO(16),
  PS(27),
  FI(16),
  FR(25),
  GL(16),
  GT(26),
  GE(20),
  NL(16),
  HR(19),
  IQ(21),
  IE(20),
  ES(22),
  IL(21),
  SE(22),
  CH(19),
  IT(25),
  IS(24),
  ME(20),
  QA(27),
  KZ(18),
  XK(18),
  CR(20),
  KW(28),
  CY(26),
  LV(19),
  LT(18),
  LB(26),
  LU(18),
  HU(26),
  MK(17),
  MT(29),
  MU(28),
  MD(22),
  MC(25),
  MR(25),
  PL(26),
  PT(23),
  RO(22),
  LC(30),
  SM(25),
  SA(22),
  TR(24),
  UA(27),
  GR(25),
  CZ(22);

  const CountryCode(this.value);
  final int value;
}

enum Added {
  zero(0),
  one(1),
  two(2),
  three(3);

  const Added(this.value);
  final int value;
}
