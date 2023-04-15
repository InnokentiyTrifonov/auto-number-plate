class LicencePlate {
  final Region region;
  final String stateCode;
  final String number;
  final String serialNumber;

  LicencePlate({
    required this.region, 
    required this.stateCode, 
    required this.number, 
    required this.serialNumber,
  });

  String getCountryFlagImageAsset() {
    if (stateCode == "KG") {
      return 'assets/kgflag.jpg';
    }
    return 'assets/kgflag.jpg';
  }

  String getRegionString() {
    switch (region) {
      case Region.bishkek:
        return "01";
      case Region.osh:
        return "02";
      case Region.batken:
        return "03";
      case Region.jalalAbad:
        return "04";
      case Region.naryn:
        return "05";
      case Region.oshOblast:
        return "06";
      case Region.talas:
        return "07";
      case Region.chui:
        return "08";
      case Region.ik:
        return "09";
    }
  }

  String getRegionTitle() {
    switch (region) {
      case Region.bishkek:
        return "Бишкек";
      case Region.osh:
        return "Ош";
      case Region.batken:
        return "Баткенская область";
      case Region.jalalAbad:
        return "Джалал-абадская область";
      case Region.naryn:
        return "Нарынская область";
      case Region.oshOblast:
        return "Ошская область";
      case Region.talas:
        return "Таласская область";
      case Region.chui:
        return "Чуйская область";
      case Region.ik:
        return "Иссык-кульская область";
    }
  }
}

enum Region {
  bishkek,
  osh,
  batken,
  jalalAbad,
  naryn,
  oshOblast,
  talas,
  chui, 
  ik,
}

bool isValidRegion(String input) {
  switch (input) {
    case "01":
      return true;
    case "02":
      return true;
    case "03":
      return true;
    case "04":
      return true;
    case "05":
      return true;
    case "06":
      return true;
    case "07":
      return true;
    case "08":
      return true;
    case "09":
      return true;
    default:
      return false;
  }
}

Region getRegion(String input) {
  switch (input) {
    case "01":
      return Region.bishkek;
    case "02":
      return Region.osh;
    case "03":
      return Region.batken;
    case "04":
      return Region.jalalAbad;
    case "05":
      return Region.naryn;
    case "06":
      return Region.oshOblast;
    case "07":
      return Region.talas;
    case "08":
      return Region.chui;
    case "09":
      return Region.ik;
    default:
      return Region.bishkek;
  }
}

// Бишкек — 01
// Ош — 02
// Баткенская область — 03
// Джалал-Абадская область — 04
// Нарынская область — 05
// Ошская область — 06
// Таласская область — 07
// Чуйская область — 08
// Иссык-Кульская область — 09