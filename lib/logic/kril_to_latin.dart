// ignore_for_file: non_constant_identifier_names

var alpha = [
  //kirill-lotin uchun lotin alfaviti
  'A', 'B', 'V', 'G', 'D', 'E', 'Yo', 'J', 'Z', 'I', 'Y', 'K', 'L', 'M', 'N',
  'O', 'P',
  'R', 'S', 'T', 'U', 'F', 'X', 'Ts', 'Ch', 'Sh', 'Sh', '\'', 'I', '', 'E',
  'Yu', 'Ya', 'G\'', 'Q', 'H', 'O\'',
  'a', 'b', 'v', 'g', 'd', 'e', 'yo', 'j', 'z', 'i', 'y', 'k', 'l', 'm', 'n',
  'o', 'p',
  'r', 's', 't', 'u', 'f', 'x', 'ts', 'ch', 'sh', 'sh', '\'', 'i', '', 'e',
  'yu', 'ya', 'g\'', 'q', 'h', 'o\'',
];

var alphaLatin = [
  //lotin-kirill uchun lotin alfaviti
  'A', 'B', 'V', 'G', 'D', 'E', '‡', 'J', 'Z', 'I', 'Y', 'K', 'L', 'M', 'N',
  'O', 'P',
  'R', 'S', 'T', 'U', 'F', 'X', '‡', '‡', '‡', '‡', '‡', '‡', '‡', '‡', '‡',
  '‡', '‡', 'Q', 'H', '‡',
  'a', 'b', 'v', 'g', 'd', 'e', '‡', 'j', 'z', 'i', 'y', 'k', 'l', 'm', 'n',
  'o', 'p',
  'r', 's', 't', 'u', 'f', 'x', '‡', '‡', '‡', '‡', '\'', '‡', '‡', '‡', '‡',
  '‡', '‡', 'q', 'h', '‡',
];
var alphaRus = [
  'А',
  'Б',
  'В',
  'Г',
  'Д',
  'Е',
  'Ё',
  'Ж',
  'З',
  'И',
  'Й',
  'К',
  'Л',
  'М',
  'Н',
  'О',
  'П',
  'Р',
  'С',
  'Т',
  'У',
  'Ф',
  'Х',
  'Ц',
  'Ч',
  'Ш',
  'Щ',
  'Ъ',
  'Ы',
  'Ь',
  'Э',
  'Ю',
  'Я',
  'Ғ',
  'Қ',
  'Ҳ',
  'Ў',
  'а',
  'б',
  'в',
  'г',
  'д',
  'е',
  'ё',
  'ж',
  'з',
  'и',
  'й',
  'к',
  'л',
  'м',
  'н',
  'о',
  'п',
  'р',
  'с',
  'т',
  'у',
  'ф',
  'х',
  'ц',
  'ч',
  'ш',
  'щ',
  'ъ',
  'ы',
  'ь',
  'э',
  'ю',
  'я',
  'ғ',
  'қ',
  'ҳ',
  'ў',
];

// ignore: non_constant_identifier_names
 //lotin ga o'girilgan xabar
String LatinTranslated = "";
toLatin(String CyrillicMessage) async {

  String letterE2 = CyrillicMessage.split(" ").map(Eliser2).join(' ');
  CyrillicMessage = letterE2;

  await decrypt(CyrillicMessage,);
  /*natijani return qiladi */
  String neww = LatinTranslated;
  LatinTranslated = "";

  return neww;
}

/*lotinga o'girish algoritmi :*/
decrypt(String string,) {
  for (var i = 0; i < string.length; i++) {
    for (var j = 0; j < alphaRus.length; j++) {
      /* lotinchaga o'tkazadi*/
      if (string[i] == alphaRus[j]) {
        LatinTranslated += alpha[j];
      }
      /*simvollar va lotin alfavitidagi so'zlar o'girilmaydi */
      else if ((string.codeUnitAt(i) >= 9 && string.codeUnitAt(i) <= 11) ||
          (string.codeUnitAt(i) > 32 && string.codeUnitAt(i) < 1000) ||
          (string.codeUnitAt(i) > 1300)) {
        LatinTranslated += string[i];
        break;
      }
      /* probelni necha bo'lsa shuncha qo'shadi :)*/
      else if (string.codeUnitAt(i) == 32) {
        LatinTranslated += " ";
        break;
      }
    }
  }
}

Eliser2(String currentWord) {
  //bu e harfini nastroyka qiladi ;)

  print(currentWord.toString());
  currentWord = currentWord.trim();
  if (currentWord.isEmpty) {
    return;
  }

  if (currentWord[0] == 'Ц') {
    //bu harf xat boshida kelsa, "S" yoziladi

    currentWord = currentWord.replaceAll("Ц", "S");
  } else if (currentWord[0] == 'ц') {
    currentWord = currentWord.replaceAll("ц", "s");
  }

  for (var r = 0; r < currentWord.length; r++) {
    //Agar Shu harflar capital letter bolib kelsa, So'z qandayligiga qarab nastroyka qiladi
    if (currentWord[r] == 'Ё') {
      for (var z = r + 1; z < currentWord.length; z++) {
        if (currentWord.codeUnitAt(z) >= 1040 &&
            currentWord.codeUnitAt(z) <= 1071) {
          currentWord = currentWord.replaceAll("Ё", "YO");
        }
      }
    } else if (currentWord[r] == 'Ц') {
      // bundan oldingi harf undosh bolsa(unli bolmasa), "S" yoziladi
      if (currentWord.codeUnitAt(r - 1) != 1040 &&
          currentWord.codeUnitAt(r - 1) != 1045 &&
          currentWord.codeUnitAt(r - 1) != 1048 &&
          currentWord.codeUnitAt(r - 1) != 1054 &&
          currentWord.codeUnitAt(r - 1) != 1059 &&
          currentWord.codeUnitAt(r - 1) != 1069 &&
          currentWord.codeUnitAt(r - 1) != 1070 &&
          currentWord.codeUnitAt(r - 1) != 1071 &&
          currentWord.codeUnitAt(r - 1) != 1072 &&
          currentWord.codeUnitAt(r - 1) != 1077 &&
          currentWord.codeUnitAt(r - 1) != 1080 &&
          currentWord.codeUnitAt(r - 1) != 1086 &&
          currentWord.codeUnitAt(r - 1) != 1091 &&
          currentWord.codeUnitAt(r - 1) != 1101 &&
          currentWord.codeUnitAt(r - 1) != 1102 &&
          currentWord.codeUnitAt(r - 1) != 1103) {
        currentWord = currentWord.replaceAll("Ц", "S");
      }
      for (var z = r + 1; z < currentWord.length; z++) {
        if (currentWord.codeUnitAt(z) >= 1040 &&
            currentWord.codeUnitAt(z) <= 1071) {
          currentWord = currentWord.replaceAll("Ц", "TS");
        }
      }
    } else if (currentWord[r] == 'ц') {
      // bundan oldingi harf undosh bolsa(unli bolmasa), "s" yoziladi
      if (currentWord.codeUnitAt(r - 1) != 1040 &&
          currentWord.codeUnitAt(r - 1) != 045 &&
          currentWord.codeUnitAt(r - 1) != 1048 &&
          currentWord.codeUnitAt(r - 1) != 1054 &&
          currentWord.codeUnitAt(r - 1) != 1059 &&
          currentWord.codeUnitAt(r - 1) != 1069 &&
          currentWord.codeUnitAt(r - 1) != 1070 &&
          currentWord.codeUnitAt(r - 1) != 1071 &&
          currentWord.codeUnitAt(r - 1) != 1072 &&
          currentWord.codeUnitAt(r - 1) != 1077 &&
          currentWord.codeUnitAt(r - 1) != 1080 &&
          currentWord.codeUnitAt(r - 1) != 1086 &&
          currentWord.codeUnitAt(r - 1) != 1091 &&
          currentWord.codeUnitAt(r - 1) != 1101 &&
          currentWord.codeUnitAt(r - 1) != 1102 &&
          currentWord.codeUnitAt(r - 1) != 1103) {
        currentWord = currentWord.replaceAll("ц", "s");
      }
    } else if (currentWord[r] == 'Ч') {
      for (var z = r + 1; z < currentWord.length; z++) {
        if (currentWord.codeUnitAt(z) >= 1040 &&
            currentWord.codeUnitAt(z) <= 1071) {
          currentWord = currentWord.replaceAll("Ч", "CH");
        }
      }
    } else if (currentWord[r] == 'Ш') {
      for (var z = r + 1; z < currentWord.length; z++) {
        if (currentWord.codeUnitAt(z) >= 1040 &&
            currentWord.codeUnitAt(z) <= 1071) {
          currentWord = currentWord.replaceAll("Ш", "SH");
        }
      }
    } else if (currentWord[r] == 'Ю') {
      for (var z = r + 1; z < currentWord.length; z++) {
        if (currentWord.codeUnitAt(z) >= 1040 &&
            currentWord.codeUnitAt(z) <= 1071) {
          currentWord = currentWord.replaceAll("Ю", "YU");
        }
      }
    } else if (currentWord[r] == 'Я') {
      for (var z = r + 1; z < currentWord.length; z++) {
        if (currentWord.codeUnitAt(z) >= 1040 &&
            currentWord.codeUnitAt(z) <= 1071) {
          currentWord = currentWord.replaceAll("Я", "YA");
        }
      }
    }
  }

  if (currentWord[0] == 'Е') {
    //agar E bosh harfda Upper case bo'lib kelsa :
    for (var z = 1; z < currentWord.length; z++) {
      if (currentWord.codeUnitAt(z) >= 1040 &&
          currentWord.codeUnitAt(z) <= 1071) {
        var E = currentWord.replaceAll("Е",
            "YE"); //agar so'z ikkinchi harfidan boshlab (z=1) upper case da bo'lsa, "YE" deb o'zgartir !
        return E;
      } else {
        var E =
            currentWord.replaceAll("Е", "Ye"); //aks holda "Ye" deb o'zgartir !
        return E;
      }
    }
  } else if (currentWord[0] == 'е') {
    //agar e bosh harfda lower case bolib kelsa:
    var e = currentWord.replaceAll("е", "ye");
    return e;
  } else {
    return currentWord;
  }
}
