import 'dart:convert';

Cryptocurrencies cryptocurrenciesFromJson(String str) => Cryptocurrencies.fromJson(json.decode(str));

String cryptocurrenciesToJson(Cryptocurrencies data) => json.encode(data.toJson());

class Cryptocurrencies {
    Cryptocurrencies({
        this.status,
        this.data,
    });

    String status;
    Data data;

    factory Cryptocurrencies.fromJson(Map<String, dynamic> json) => Cryptocurrencies(
        status: json["status"],
        data: Data.fromJson(json["data"]),
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "data": data.toJson(),
    };
}

class Data {
    Data({
        this.stats,
        this.base,
        this.coins,
    });

    Stats stats;
    Base base;
    List<Coin> coins;

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        stats: Stats.fromJson(json["stats"]),
        base: Base.fromJson(json["base"]),
        coins: List<Coin>.from(json["coins"].map((x) => Coin.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "stats": stats.toJson(),
        "base": base.toJson(),
        "coins": List<dynamic>.from(coins.map((x) => x.toJson())),
    };
}

class Base {
    Base({
        this.symbol,
        this.sign,
    });

    String symbol;
    String sign;

    factory Base.fromJson(Map<String, dynamic> json) => Base(
        symbol: json["symbol"],
        sign: json["sign"],
    );

    Map<String, dynamic> toJson() => {
        "symbol": symbol,
        "sign": sign,
    };
}

class Coin {
    Coin({
        this.id,
        this.uuid,
        this.slug,
        this.symbol,
        this.name,
        this.description,
        this.color,
        this.iconType,
        this.iconUrl,
        this.websiteUrl,
        this.socials,
        this.links,
        this.confirmedSupply,
        this.numberOfMarkets,
        this.numberOfExchanges,
        this.type,
        this.volume,
        this.marketCap,
        this.price,
        this.circulatingSupply,
        this.totalSupply,
        this.approvedSupply,
        this.firstSeen,
        this.change,
        this.rank,
        this.history,
        this.allTimeHigh,
        this.penalty,
    });

    int id;
    String uuid;
    String slug;
    String symbol;
    String name;
    String description;
    String color;
    IconType iconType;
    String iconUrl;
    String websiteUrl;
    List<Link> socials;
    List<Link> links;
    bool confirmedSupply;
    int numberOfMarkets;
    int numberOfExchanges;
    CoinType type;
    int volume;
    int marketCap;
    String price;
    double circulatingSupply;
    double totalSupply;
    bool approvedSupply;
    int firstSeen;
    double change;
    int rank;
    List<String> history;
    AllTimeHigh allTimeHigh;
    bool penalty;

    factory Coin.fromJson(Map<String, dynamic> json) => Coin(
        id: json["id"],
        uuid: json["uuid"],
        slug: json["slug"],
        symbol: json["symbol"],
        name: json["name"],
        description: json["description"] == null ? null : json["description"],
        color: json["color"] == null ? null : json["color"],
        iconType: iconTypeValues.map[json["iconType"]],
        iconUrl: json["iconUrl"],
        websiteUrl: json["websiteUrl"] == null ? null : json["websiteUrl"],
        socials: List<Link>.from(json["socials"].map((x) => Link.fromJson(x))),
        links: List<Link>.from(json["links"].map((x) => Link.fromJson(x))),
        confirmedSupply: json["confirmedSupply"],
        numberOfMarkets: json["numberOfMarkets"],
        numberOfExchanges: json["numberOfExchanges"],
        type: coinTypeValues.map[json["type"]],
        volume: json["volume"],
        marketCap: json["marketCap"],
        price: json["price"],
        circulatingSupply: json["circulatingSupply"].toDouble(),
        totalSupply: json["totalSupply"].toDouble(),
        approvedSupply: json["approvedSupply"],
        firstSeen: json["firstSeen"],
        change: json["change"].toDouble(),
        rank: json["rank"],
        history: List<String>.from(json["history"].map((x) => x)),
        allTimeHigh: AllTimeHigh.fromJson(json["allTimeHigh"]),
        penalty: json["penalty"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "uuid": uuid,
        "slug": slug,
        "symbol": symbol,
        "name": name,
        "description": description == null ? null : description,
        "color": color == null ? null : color,
        "iconType": iconTypeValues.reverse[iconType],
        "iconUrl": iconUrl,
        "websiteUrl": websiteUrl == null ? null : websiteUrl,
        "socials": List<dynamic>.from(socials.map((x) => x.toJson())),
        "links": List<dynamic>.from(links.map((x) => x.toJson())),
        "confirmedSupply": confirmedSupply,
        "numberOfMarkets": numberOfMarkets,
        "numberOfExchanges": numberOfExchanges,
        "type": coinTypeValues.reverse[type],
        "volume": volume,
        "marketCap": marketCap,
        "price": price,
        "circulatingSupply": circulatingSupply,
        "totalSupply": totalSupply,
        "approvedSupply": approvedSupply,
        "firstSeen": firstSeen,
        "change": change,
        "rank": rank,
        "history": List<dynamic>.from(history.map((x) => x)),
        "allTimeHigh": allTimeHigh.toJson(),
        "penalty": penalty,
    };
}

class AllTimeHigh {
    AllTimeHigh({
        this.price,
        this.timestamp,
    });

    String price;
    int timestamp;

    factory AllTimeHigh.fromJson(Map<String, dynamic> json) => AllTimeHigh(
        price: json["price"],
        timestamp: json["timestamp"],
    );

    Map<String, dynamic> toJson() => {
        "price": price,
        "timestamp": timestamp,
    };
}

enum IconType { VECTOR }

final iconTypeValues = EnumValues({
    "vector": IconType.VECTOR
});

class Link {
    Link({
        this.name,
        this.type,
        this.url,
    });

    String name;
    LinkType type;
    String url;

    factory Link.fromJson(Map<String, dynamic> json) => Link(
        name: json["name"],
        type: linkTypeValues.map[json["type"]],
        url: json["url"],
    );

    Map<String, dynamic> toJson() => {
        "name": name,
        "type": linkTypeValues.reverse[type],
        "url": url,
    };
}

enum LinkType { WEBSITE, REDDIT, GITHUB, EXPLORER, TWITTER, BITCOINTALK, YOUTUBE, FACEBOOK, TELEGRAM, INSTAGRAM, DISCORD, MEDIUM }

final linkTypeValues = EnumValues({
    "bitcointalk": LinkType.BITCOINTALK,
    "discord": LinkType.DISCORD,
    "explorer": LinkType.EXPLORER,
    "facebook": LinkType.FACEBOOK,
    "github": LinkType.GITHUB,
    "instagram": LinkType.INSTAGRAM,
    "medium": LinkType.MEDIUM,
    "reddit": LinkType.REDDIT,
    "telegram": LinkType.TELEGRAM,
    "twitter": LinkType.TWITTER,
    "website": LinkType.WEBSITE,
    "youtube": LinkType.YOUTUBE
});

enum CoinType { COIN }

final coinTypeValues = EnumValues({
    "coin": CoinType.COIN
});

class Stats {
    Stats({
        this.total,
        this.offset,
        this.limit,
        this.order,
        this.base,
        this.totalMarkets,
        this.totalExchanges,
        this.totalMarketCap,
        this.total24HVolume,
    });

    int total;
    int offset;
    int limit;
    String order;
    String base;
    int totalMarkets;
    int totalExchanges;
    double totalMarketCap;
    double total24HVolume;

    factory Stats.fromJson(Map<String, dynamic> json) => Stats(
        total: json["total"],
        offset: json["offset"],
        limit: json["limit"],
        order: json["order"],
        base: json["base"],
        totalMarkets: json["totalMarkets"],
        totalExchanges: json["totalExchanges"],
        totalMarketCap: json["totalMarketCap"].toDouble(),
        total24HVolume: json["total24hVolume"].toDouble(),
    );

    Map<String, dynamic> toJson() => {
        "total": total,
        "offset": offset,
        "limit": limit,
        "order": order,
        "base": base,
        "totalMarkets": totalMarkets,
        "totalExchanges": totalExchanges,
        "totalMarketCap": totalMarketCap,
        "total24hVolume": total24HVolume,
    };
}

class EnumValues<T> {
    Map<String, T> map;
    Map<T, String> reverseMap;

    EnumValues(this.map);

    Map<T, String> get reverse {
        if (reverseMap == null) {
            reverseMap = map.map((k, v) => new MapEntry(v, k));
        }
        return reverseMap;
    }
}
