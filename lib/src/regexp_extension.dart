import 'package:iban_formatter/src/regexp.dart';

extension Regexp on String {
  bool get isValidIban => specialAndAlphaCharacter.hasMatch(this);
}
