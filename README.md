<!--
This README describes the package. If you publish this package to pub.dev,
this README's contents appear on the landing page for your package.

For information about how to write a good package README, see the guide for
[writing package pages](https://dart.dev/guides/libraries/writing-package-pages).

For general information about developing packages, see the Dart guide for
[creating packages](https://dart.dev/guides/libraries/create-library-packages)
and the Flutter guide for
[developing packages and plugins](https://flutter.dev/developing-packages).
-->

# Getting started

It allows formatting the IBAN of each country.

## Usage

```dart
final formatter = IbanTextInputFormatter(
    countryCode: CountryCode.TR,
    added: Added.two,
  );

final formatter = IbanTextInputFormatter(
    countryCode: CountryCode.UA,
    added: Added.zero,
    grupSize: 2,
  );
```

### Added

With Added you can choose how many digits to start with. For example

```dart
Added.two = 42 ....

Added.four = 4242 ....
```

### Grup Size

With group size you can specify how many groups the grouping will be. For example

```dart
grupSize = 2 => ... 42 42 ...

grupSize = 4 => ... 4242 4242 ...
```
