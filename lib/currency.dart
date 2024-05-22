import 'dart:convert';
/// time : {"updated":"May 18, 2024 04:38:39 UTC","updatedISO":"2024-05-18T04:38:39+00:00","updateduk":"May 18, 2024 at 05:38 BST"}
/// disclaimer : "This data was produced from the CoinDesk Bitcoin Price Index (USD). Non-USD currency data converted using hourly conversion rate from openexchangerates.org"
/// chartName : "Bitcoin"
/// bpi : {"USD":{"code":"USD","symbol":"&#36;","rate":"66,972.289","description":"United States Dollar","rate_float":66972.2892},"GBP":{"code":"GBP","symbol":"&pound;","rate":"52,713.353","description":"British Pound Sterling","rate_float":52713.353},"EUR":{"code":"EUR","symbol":"&euro;","rate":"61,557.58","description":"Euro","rate_float":61557.5796}}

Currency currencyFromJson(String str) => Currency.fromJson(json.decode(str));
String currencyToJson(Currency data) => json.encode(data.toJson());
class Currency {
  Currency({
      Time? time, 
      String? disclaimer, 
      String? chartName, 
      Bpi? bpi,}){
    _time = time;
    _disclaimer = disclaimer;
    _chartName = chartName;
    _bpi = bpi;
}

  Currency.fromJson(dynamic json) {
    _time = json['time'] != null ? Time.fromJson(json['time']) : null;
    _disclaimer = json['disclaimer'];
    _chartName = json['chartName'];
    _bpi = json['bpi'] != null ? Bpi.fromJson(json['bpi']) : null;
  }
  Time? _time;
  String? _disclaimer;
  String? _chartName;
  Bpi? _bpi;
Currency copyWith({  Time? time,
  String? disclaimer,
  String? chartName,
  Bpi? bpi,
}) => Currency(  time: time ?? _time,
  disclaimer: disclaimer ?? _disclaimer,
  chartName: chartName ?? _chartName,
  bpi: bpi ?? _bpi,
);
  Time? get time => _time;
  String? get disclaimer => _disclaimer;
  String? get chartName => _chartName;
  Bpi? get bpi => _bpi;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_time != null) {
      map['time'] = _time?.toJson();
    }
    map['disclaimer'] = _disclaimer;
    map['chartName'] = _chartName;
    if (_bpi != null) {
      map['bpi'] = _bpi?.toJson();
    }
    return map;
  }

}

/// USD : {"code":"USD","symbol":"&#36;","rate":"66,972.289","description":"United States Dollar","rate_float":66972.2892}
/// GBP : {"code":"GBP","symbol":"&pound;","rate":"52,713.353","description":"British Pound Sterling","rate_float":52713.353}
/// EUR : {"code":"EUR","symbol":"&euro;","rate":"61,557.58","description":"Euro","rate_float":61557.5796}

Bpi bpiFromJson(String str) => Bpi.fromJson(json.decode(str));
String bpiToJson(Bpi data) => json.encode(data.toJson());
class Bpi {
  Bpi({
      Usd? usd, 
      Gbp? gbp, 
      Eur? eur,}){
    _usd = usd;
    _gbp = gbp;
    _eur = eur;
}

  Bpi.fromJson(dynamic json) {
    _usd = json['USD'] != null ? Usd.fromJson(json['USD']) : null;
    _gbp = json['GBP'] != null ? Gbp.fromJson(json['GBP']) : null;
    _eur = json['EUR'] != null ? Eur.fromJson(json['EUR']) : null;
  }
  Usd? _usd;
  Gbp? _gbp;
  Eur? _eur;
Bpi copyWith({  Usd? usd,
  Gbp? gbp,
  Eur? eur,
}) => Bpi(  usd: usd ?? _usd,
  gbp: gbp ?? _gbp,
  eur: eur ?? _eur,
);
  Usd? get usd => _usd;
  Gbp? get gbp => _gbp;
  Eur? get eur => _eur;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_usd != null) {
      map['USD'] = _usd?.toJson();
    }
    if (_gbp != null) {
      map['GBP'] = _gbp?.toJson();
    }
    if (_eur != null) {
      map['EUR'] = _eur?.toJson();
    }
    return map;
  }

}

/// code : "EUR"
/// symbol : "&euro;"
/// rate : "61,557.58"
/// description : "Euro"
/// rate_float : 61557.5796

Eur eurFromJson(String str) => Eur.fromJson(json.decode(str));
String eurToJson(Eur data) => json.encode(data.toJson());
class Eur {
  Eur({
      String? code, 
      String? symbol, 
      String? rate, 
      String? description, 
      num? rateFloat,}){
    _code = code;
    _symbol = symbol;
    _rate = rate;
    _description = description;
    _rateFloat = rateFloat;
}

  Eur.fromJson(dynamic json) {
    _code = json['code'];
    _symbol = json['symbol'];
    _rate = json['rate'];
    _description = json['description'];
    _rateFloat = json['rate_float'];
  }
  String? _code;
  String? _symbol;
  String? _rate;
  String? _description;
  num? _rateFloat;
Eur copyWith({  String? code,
  String? symbol,
  String? rate,
  String? description,
  num? rateFloat,
}) => Eur(  code: code ?? _code,
  symbol: symbol ?? _symbol,
  rate: rate ?? _rate,
  description: description ?? _description,
  rateFloat: rateFloat ?? _rateFloat,
);
  String? get code => _code;
  String? get symbol => _symbol;
  String? get rate => _rate;
  String? get description => _description;
  num? get rateFloat => _rateFloat;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['code'] = _code;
    map['symbol'] = _symbol;
    map['rate'] = _rate;
    map['description'] = _description;
    map['rate_float'] = _rateFloat;
    return map;
  }

}

/// code : "GBP"
/// symbol : "&pound;"
/// rate : "52,713.353"
/// description : "British Pound Sterling"
/// rate_float : 52713.353

Gbp gbpFromJson(String str) => Gbp.fromJson(json.decode(str));
String gbpToJson(Gbp data) => json.encode(data.toJson());
class Gbp {
  Gbp({
      String? code, 
      String? symbol, 
      String? rate, 
      String? description, 
      num? rateFloat,}){
    _code = code;
    _symbol = symbol;
    _rate = rate;
    _description = description;
    _rateFloat = rateFloat;
}

  Gbp.fromJson(dynamic json) {
    _code = json['code'];
    _symbol = json['symbol'];
    _rate = json['rate'];
    _description = json['description'];
    _rateFloat = json['rate_float'];
  }
  String? _code;
  String? _symbol;
  String? _rate;
  String? _description;
  num? _rateFloat;
Gbp copyWith({  String? code,
  String? symbol,
  String? rate,
  String? description,
  num? rateFloat,
}) => Gbp(  code: code ?? _code,
  symbol: symbol ?? _symbol,
  rate: rate ?? _rate,
  description: description ?? _description,
  rateFloat: rateFloat ?? _rateFloat,
);
  String? get code => _code;
  String? get symbol => _symbol;
  String? get rate => _rate;
  String? get description => _description;
  num? get rateFloat => _rateFloat;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['code'] = _code;
    map['symbol'] = _symbol;
    map['rate'] = _rate;
    map['description'] = _description;
    map['rate_float'] = _rateFloat;
    return map;
  }

}

/// code : "USD"
/// symbol : "&#36;"
/// rate : "66,972.289"
/// description : "United States Dollar"
/// rate_float : 66972.2892

Usd usdFromJson(String str) => Usd.fromJson(json.decode(str));
String usdToJson(Usd data) => json.encode(data.toJson());
class Usd {
  Usd({
      String? code, 
      String? symbol, 
      String? rate, 
      String? description, 
      num? rateFloat,}){
    _code = code;
    _symbol = symbol;
    _rate = rate;
    _description = description;
    _rateFloat = rateFloat;
}

  Usd.fromJson(dynamic json) {
    _code = json['code'];
    _symbol = json['symbol'];
    _rate = json['rate'];
    _description = json['description'];
    _rateFloat = json['rate_float'];
  }
  String? _code;
  String? _symbol;
  String? _rate;
  String? _description;
  num? _rateFloat;
Usd copyWith({  String? code,
  String? symbol,
  String? rate,
  String? description,
  num? rateFloat,
}) => Usd(  code: code ?? _code,
  symbol: symbol ?? _symbol,
  rate: rate ?? _rate,
  description: description ?? _description,
  rateFloat: rateFloat ?? _rateFloat,
);
  String? get code => _code;
  String? get symbol => _symbol;
  String? get rate => _rate;
  String? get description => _description;
  num? get rateFloat => _rateFloat;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['code'] = _code;
    map['symbol'] = _symbol;
    map['rate'] = _rate;
    map['description'] = _description;
    map['rate_float'] = _rateFloat;
    return map;
  }

}

/// updated : "May 18, 2024 04:38:39 UTC"
/// updatedISO : "2024-05-18T04:38:39+00:00"
/// updateduk : "May 18, 2024 at 05:38 BST"

Time timeFromJson(String str) => Time.fromJson(json.decode(str));
String timeToJson(Time data) => json.encode(data.toJson());
class Time {
  Time({
      String? updated, 
      String? updatedISO, 
      String? updateduk,}){
    _updated = updated;
    _updatedISO = updatedISO;
    _updateduk = updateduk;
}

  Time.fromJson(dynamic json) {
    _updated = json['updated'];
    _updatedISO = json['updatedISO'];
    _updateduk = json['updateduk'];
  }
  String? _updated;
  String? _updatedISO;
  String? _updateduk;
Time copyWith({  String? updated,
  String? updatedISO,
  String? updateduk,
}) => Time(  updated: updated ?? _updated,
  updatedISO: updatedISO ?? _updatedISO,
  updateduk: updateduk ?? _updateduk,
);
  String? get updated => _updated;
  String? get updatedISO => _updatedISO;
  String? get updateduk => _updateduk;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['updated'] = _updated;
    map['updatedISO'] = _updatedISO;
    map['updateduk'] = _updateduk;
    return map;
  }

}