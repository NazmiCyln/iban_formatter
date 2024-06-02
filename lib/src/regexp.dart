final specialAndAlphaCharacter = RegExp(
  r"[a-zA-Z\$\R\Ü\Ö\T\Q\Ç\%\#\@\_\:\!\?\&\|\£\½\§\{\[\]\}\\\>\<\=\'\.\,\*\-\,+\ü\ğ\ö\ç\/\;\(\)]+$",
);

final emoji = RegExp(
  r'(\u00a9|\u00ae|[\u2000-\u3300]|\ud83c[\ud000-\udfff]|\ud83d[\ud000-\udfff]|\ud83e[\ud000-\udfff])',
);
