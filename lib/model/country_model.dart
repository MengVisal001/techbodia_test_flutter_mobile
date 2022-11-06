class CountryModel {
  Name? name;
  List<String>? tld;
  String? cca2;
  String? ccn3;
  String? cca3;
  String? cioc;
  bool? independent;
  String? status;
  bool? unMember;
  Currencies? currencies;
  Idd? idd;
  List<String>? capital;
  List<String>? altSpellings;
  String? region;
  String? subregion;
  Languages? languages;
  Translations? translations;
  List<int>? latlng;
  bool? landlocked;
  List<String>? borders;
  int? area;
  Demonyms? demonyms;
  String? flag;
  Maps? maps;
  int? population;
  Gini? gini;
  String? fifa;
  Car? car;
  List<String>? timezones;
  List<String>? continents;
  Flags? flags;
  Flags? coatOfArms;
  String? startOfWeek;
  CapitalInfo? capitalInfo;
  PostalCode? postalCode;

  CountryModel(
      {this.name,
      this.tld,
      this.cca2,
      this.ccn3,
      this.cca3,
      this.cioc,
      this.independent,
      this.status,
      this.unMember,
      this.currencies,
      this.idd,
      this.capital,
      this.altSpellings,
      this.region,
      this.subregion,
      this.languages,
      this.translations,
      this.latlng,
      this.landlocked,
      this.borders,
      this.area,
      this.demonyms,
      this.flag,
      this.maps,
      this.population,
      this.gini,
      this.fifa,
      this.car,
      this.timezones,
      this.continents,
      this.flags,
      this.coatOfArms,
      this.startOfWeek,
      this.capitalInfo,
      this.postalCode});

  CountryModel.fromJson(Map<String, dynamic> json) {
    name = json['name'] != null ? Name.fromJson(json['name']) : null;
    tld = json['tld'].cast<String>();
    cca2 = json['cca2'];
    ccn3 = json['ccn3'];
    cca3 = json['cca3'];
    cioc = json['cioc'];
    independent = json['independent'];
    status = json['status'];
    unMember = json['unMember'];
    currencies = json['currencies'] != null
        ? Currencies.fromJson(json['currencies'])
        : null;
    idd = json['idd'] != null ? Idd.fromJson(json['idd']) : null;
    capital = json['capital'].cast<String>();
    altSpellings = json['altSpellings'].cast<String>();
    region = json['region'];
    subregion = json['subregion'];
    languages = json['languages'] != null
        ? Languages.fromJson(json['languages'])
        : null;
    translations = json['translations'] != null
        ? Translations.fromJson(json['translations'])
        : null;
    latlng = json['latlng'].cast<int>();
    landlocked = json['landlocked'];
    borders = json['borders'].cast<String>();
    area = json['area'];
    demonyms =
        json['demonyms'] != null ? Demonyms.fromJson(json['demonyms']) : null;
    flag = json['flag'];
    maps = json['maps'] != null ? Maps.fromJson(json['maps']) : null;
    population = json['population'];
    gini = json['gini'] != null ? Gini.fromJson(json['gini']) : null;
    fifa = json['fifa'];
    car = json['car'] != null ? Car.fromJson(json['car']) : null;
    timezones = json['timezones'].cast<String>();
    continents = json['continents'].cast<String>();
    flags = json['flags'] != null ? Flags.fromJson(json['flags']) : null;
    coatOfArms =
        json['coatOfArms'] != null ? Flags.fromJson(json['coatOfArms']) : null;
    startOfWeek = json['startOfWeek'];
    capitalInfo = json['capitalInfo'] != null
        ? CapitalInfo.fromJson(json['capitalInfo'])
        : null;
    postalCode = json['postalCode'] != null
        ? PostalCode.fromJson(json['postalCode'])
        : null;
  }

  // country from list
  static fromList(List<dynamic> jsonString) => List<CountryModel>.from(
      jsonString.map((value) => CountryModel.fromJson(value)));
}

class Name {
  String? common;
  String? official;
  NativeName? nativeName;

  Name({this.common, this.official, this.nativeName});

  Name.fromJson(Map<String, dynamic> json) {
    common = json['common'];
    official = json['official'];
    nativeName = json['nativeName'] != null
        ? NativeName.fromJson(json['nativeName'])
        : null;
  }
}

class NativeName {
  Ron? ron;

  NativeName({this.ron});

  NativeName.fromJson(Map<String, dynamic> json) {
    ron = json['ron'] != null ? Ron.fromJson(json['ron']) : null;
  }
}

class Ron {
  String? official;
  String? common;

  Ron({this.official, this.common});

  Ron.fromJson(Map<String, dynamic> json) {
    official = json['official'];
    common = json['common'];
  }
}

class Currencies {
  RON? rON;

  Currencies({this.rON});

  Currencies.fromJson(Map<String, dynamic> json) {
    rON = json['RON'] != null ? RON.fromJson(json['RON']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (rON != null) {
      data['RON'] = rON!.toJson();
    }
    return data;
  }
}

class RON {
  String? name;
  String? symbol;

  RON({this.name, this.symbol});

  RON.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    symbol = json['symbol'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['symbol'] = symbol;
    return data;
  }
}

class Idd {
  String? root;
  List<String>? suffixes;

  Idd({this.root, this.suffixes});

  Idd.fromJson(Map<String, dynamic> json) {
    root = json['root'];
    suffixes = json['suffixes'].cast<String>();
  }
}

class Languages {
  String? ron;

  Languages({this.ron});

  Languages.fromJson(Map<String, dynamic> json) {
    ron = json['ron'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['ron'] = ron;
    return data;
  }
}

class Translations {
  Ron? ara;
  Ron? bre;
  Ron? ces;
  Ron? cym;
  Ron? deu;
  Ron? est;
  Ron? fin;
  Eng? fra;
  Ron? hrv;
  Ron? hun;
  Ron? ita;
  Ron? jpn;
  Ron? kor;
  Ron? nld;
  Ron? per;
  Ron? pol;
  Ron? por;
  Ron? rus;
  Ron? slk;
  Ron? spa;
  Ron? swe;
  Ron? tur;
  Ron? urd;
  Ron? zho;

  Translations(
      {this.ara,
      this.bre,
      this.ces,
      this.cym,
      this.deu,
      this.est,
      this.fin,
      this.fra,
      this.hrv,
      this.hun,
      this.ita,
      this.jpn,
      this.kor,
      this.nld,
      this.per,
      this.pol,
      this.por,
      this.rus,
      this.slk,
      this.spa,
      this.swe,
      this.tur,
      this.urd,
      this.zho});

  Translations.fromJson(Map<String, dynamic> json) {
    ara = json['ara'] != null ? Ron.fromJson(json['ara']) : null;
    bre = json['bre'] != null ? Ron.fromJson(json['bre']) : null;
    ces = json['ces'] != null ? Ron.fromJson(json['ces']) : null;
    cym = json['cym'] != null ? Ron.fromJson(json['cym']) : null;
    deu = json['deu'] != null ? Ron.fromJson(json['deu']) : null;
    est = json['est'] != null ? Ron.fromJson(json['est']) : null;
    fin = json['fin'] != null ? Ron.fromJson(json['fin']) : null;
    fra = json['fra'] != null ? Eng.fromJson(json['fra']) : null;
    hrv = json['hrv'] != null ? Ron.fromJson(json['hrv']) : null;
    hun = json['hun'] != null ? Ron.fromJson(json['hun']) : null;
    ita = json['ita'] != null ? Ron.fromJson(json['ita']) : null;
    jpn = json['jpn'] != null ? Ron.fromJson(json['jpn']) : null;
    kor = json['kor'] != null ? Ron.fromJson(json['kor']) : null;
    nld = json['nld'] != null ? Ron.fromJson(json['nld']) : null;
    per = json['per'] != null ? Ron.fromJson(json['per']) : null;
    pol = json['pol'] != null ? Ron.fromJson(json['pol']) : null;
    por = json['por'] != null ? Ron.fromJson(json['por']) : null;
    rus = json['rus'] != null ? Ron.fromJson(json['rus']) : null;
    slk = json['slk'] != null ? Ron.fromJson(json['slk']) : null;
    spa = json['spa'] != null ? Ron.fromJson(json['spa']) : null;
    swe = json['swe'] != null ? Ron.fromJson(json['swe']) : null;
    tur = json['tur'] != null ? Ron.fromJson(json['tur']) : null;
    urd = json['urd'] != null ? Ron.fromJson(json['urd']) : null;
    zho = json['zho'] != null ? Ron.fromJson(json['zho']) : null;
  }
}

class Demonyms {
  Eng? eng;
  Eng? fra;

  Demonyms({this.eng, this.fra});

  Demonyms.fromJson(Map<String, dynamic> json) {
    eng = json['eng'] != null ? Eng.fromJson(json['eng']) : null;
    fra = json['fra'] != null ? Eng.fromJson(json['fra']) : null;
  }
}

class Eng {
  String? f;
  String? m;

  Eng({this.f, this.m});

  Eng.fromJson(Map<String, dynamic> json) {
    f = json['f'];
    m = json['m'];
  }
}

class Maps {
  String? googleMaps;
  String? openStreetMaps;

  Maps({this.googleMaps, this.openStreetMaps});

  Maps.fromJson(Map<String, dynamic> json) {
    googleMaps = json['googleMaps'];
    openStreetMaps = json['openStreetMaps'];
  }
}

class Gini {
  double? d2018;

  Gini({this.d2018});

  Gini.fromJson(Map<String, dynamic> json) {
    d2018 = json['2018'];
  }
}

class Car {
  List<String>? signs;
  String? side;

  Car({this.signs, this.side});

  Car.fromJson(Map<String, dynamic> json) {
    signs = json['signs'].cast<String>();
    side = json['side'];
  }
}

class Flags {
  String? png;
  String? svg;

  Flags({this.png, this.svg});

  Flags.fromJson(Map<String, dynamic> json) {
    png = json['png'];
    svg = json['svg'];
  }
}

class CapitalInfo {
  List<double>? latlng;

  CapitalInfo({this.latlng});

  CapitalInfo.fromJson(Map<String, dynamic> json) {
    latlng = json['latlng'].cast<double>();
  }
}

class PostalCode {
  String? format;
  String? regex;

  PostalCode({this.format, this.regex});

  PostalCode.fromJson(Map<String, dynamic> json) {
    format = json['format'];
    regex = json['regex'];
  }
}
