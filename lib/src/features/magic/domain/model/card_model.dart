class CardModel {
  CardModel({this.cards});

  CardModel.fromJson(Map<String, dynamic> json) {
    if (json['cards'] != null) {
      cards = <Cards>[];
      json['cards'].forEach((v) {
        cards!.add(Cards.fromJson(v));
      });
    }
  }
  List<Cards>? cards;

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    if (cards != null) {
      data['cards'] = cards!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Cards {
  Cards({
    this.name,
    this.manaCost,
    this.cmc,
    this.colors,
    this.colorIdentity,
    this.type,
    this.types,
    this.subtypes,
    this.rarity,
    this.set,
    this.setName,
    this.text,
    this.flavor,
    this.artist,
    this.number,
    this.power,
    this.toughness,
    this.layout,
    this.multiverseid,
    this.imageUrl,
    this.variations,
    this.foreignNames,
    this.printings,
    this.originalText,
    this.originalType,
    this.legalities,
    this.id,
    this.rulings,
    this.supertypes,
  });

  Cards.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    manaCost = json['manaCost'];
    cmc = json['cmc'];
    colors = json['colors'].cast<String>();
    colorIdentity = json['colorIdentity'].cast<String>();
    type = json['type'];
    if (json['types'] != null) {
      types = <String>[];
      json['types'].forEach((v) {
        types!.add(v);
      });
    }
    if (json['subtypes'] != null) {
      subtypes = <String>[];
      json['subtypes'].forEach((v) {
        subtypes!.add(v);
      });
    }
    rarity = json['rarity'];
    set = json['set'];
    setName = json['setName'];
    text = json['text'];
    flavor = json['flavor'];
    artist = json['artist'];
    number = json['number'];
    power = json['power'];
    toughness = json['toughness'];
    layout = json['layout'];
    multiverseid = json['multiverseid'];
    imageUrl = json['imageUrl'];
    if (json['variations'] != null) {
      variations = <String>[];
      json['variations'].forEach((v) {
        variations!.add(v);
      });
    }
    if (json['foreignNames'] != null) {
      foreignNames = <ForeignNames>[];
      json['foreignNames'].forEach((v) {
        foreignNames!.add(ForeignNames.fromJson(v));
      });
    }
    if (json['printings'] != null) {
      printings = <String>[];
      json['printings'].forEach((v) {
        printings!.add(v);
      });
    }
    originalText = json['originalText'];
    originalType = json['originalType'];
    if (json['legalities'] != null) {
      legalities = <Legalities>[];
      json['legalities'].forEach((v) {
        legalities!.add(Legalities.fromJson(v));
      });
    }
    id = json['id'];
    if (json['rulings'] != null) {
      rulings = <Rulings>[];
      json['rulings'].forEach((v) {
        rulings!.add(Rulings.fromJson(v));
      });
    }
    if (json['supertypes'] != null) {
      supertypes = <String>[];
      json['supertypes'].forEach((v) {
        supertypes!.add(v);
      });
    }
  }
  String? name;
  String? manaCost;
  double? cmc;
  List<String>? colors;
  List<String>? colorIdentity;
  String? type;
  List<String>? types;
  List<String>? subtypes;
  String? rarity;
  String? set;
  String? setName;
  String? text;
  String? flavor;
  String? artist;
  String? number;
  String? power;
  String? toughness;
  String? layout;
  String? multiverseid;
  String? imageUrl;
  List<String>? variations;
  List<ForeignNames>? foreignNames;
  List<String>? printings;
  String? originalText;
  String? originalType;
  List<Legalities>? legalities;
  String? id;
  List<Rulings>? rulings;
  List<String>? supertypes;

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['name'] = name;
    data['manaCost'] = manaCost;
    data['cmc'] = cmc;
    data['colors'] = colors;
    data['colorIdentity'] = colorIdentity;
    data['type'] = type;
    data['types'] = types;
    data['subtypes'] = subtypes;
    data['rarity'] = rarity;
    data['set'] = set;
    data['setName'] = setName;
    data['text'] = text;
    data['flavor'] = flavor;
    data['artist'] = artist;
    data['number'] = number;
    data['power'] = power;
    data['toughness'] = toughness;
    data['layout'] = layout;
    data['multiverseid'] = multiverseid;
    data['imageUrl'] = imageUrl;
    data['variations'] = variations;
    if (foreignNames != null) {
      data['foreignNames'] = foreignNames!.map((v) => v.toJson()).toList();
    }
    data['printings'] = printings;
    data['originalText'] = originalText;
    data['originalType'] = originalType;
    if (legalities != null) {
      data['legalities'] = legalities!.map((v) => v.toJson()).toList();
    }
    data['id'] = id;
    if (rulings != null) {
      data['rulings'] = rulings!.map((v) => v.toJson()).toList();
    }
    data['supertypes'] = supertypes;
    return data;
  }
}

class ForeignNames {
  ForeignNames({
    this.name,
    this.text,
    this.type,
    this.flavor,
    this.imageUrl,
    this.language,
    this.identifiers,
    this.multiverseid,
  });

  ForeignNames.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    text = json['text'];
    type = json['type'];
    flavor = json['flavor'];
    imageUrl = json['imageUrl'];
    language = json['language'];
    identifiers = json['identifiers'] != null
        ? Identifiers.fromJson(json['identifiers'])
        : null;
    multiverseid = json['multiverseid'];
  }
  String? name;
  String? text;
  String? type;
  String? flavor;
  String? imageUrl;
  String? language;
  Identifiers? identifiers;
  int? multiverseid;

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['name'] = name;
    data['text'] = text;
    data['type'] = type;
    data['flavor'] = flavor;
    data['imageUrl'] = imageUrl;
    data['language'] = language;
    if (identifiers != null) {
      data['identifiers'] = identifiers!.toJson();
    }
    data['multiverseid'] = multiverseid;
    return data;
  }
}

class Identifiers {
  Identifiers({this.scryfallId, this.multiverseId});

  Identifiers.fromJson(Map<String, dynamic> json) {
    scryfallId = json['scryfallId'];
    multiverseId = json['multiverseId'];
  }
  String? scryfallId;
  int? multiverseId;

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['scryfallId'] = scryfallId;
    data['multiverseId'] = multiverseId;
    return data;
  }
}

class Legalities {
  Legalities({this.format, this.legality});

  Legalities.fromJson(Map<String, dynamic> json) {
    format = json['format'];
    legality = json['legality'];
  }
  String? format;
  String? legality;

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['format'] = format;
    data['legality'] = legality;
    return data;
  }
}

class Rulings {
  Rulings({this.date, this.text});

  Rulings.fromJson(Map<String, dynamic> json) {
    date = json['date'];
    text = json['text'];
  }
  String? date;
  String? text;

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['date'] = date;
    data['text'] = text;
    return data;
  }
}
