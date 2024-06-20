class CoinsModel {
  String? id;
  String? symbol;
  String? name;
  String? image;
  num? currentPrice;
  num? marketCap;
  num? marketCapRank;
  num? fullyDilutedValuation;
  num? totalVolume;
  num? high24H;
  num? low24H;
  num? priceChange24H;
  num? priceChangePercentage24H;
  num? marketCapChange24H;
  num? marketCapChangePercentage24H;
  num? circulatingSupply;
  num? totalSupply;
  num? maxSupply;
  num? ath;
  num? athChangePercentage;
  String? athDate;
  num? atl;
  num? atlChangePercentage;
  String? atlDate;
  String? lastUpdated;

  CoinsModel({
    this.id,
    this.symbol,
    this.name,
    this.image,
    this.currentPrice,
    this.marketCap,
    this.marketCapRank,
    this.fullyDilutedValuation,
    this.totalVolume,
    this.high24H,
    this.low24H,
    this.priceChange24H,
    this.priceChangePercentage24H,
    this.marketCapChange24H,
    this.marketCapChangePercentage24H,
    this.circulatingSupply,
    this.totalSupply,
    this.maxSupply,
    this.ath,
    this.athChangePercentage,
    this.athDate,
    this.atl,
    this.atlChangePercentage,
    this.atlDate,
    this.lastUpdated,
  });

  CoinsModel copyWith({
    String? id,
    String? symbol,
    String? name,
    String? image,
    num? currentPrice,
    num? marketCap,
    num? marketCapRank,
    num? fullyDilutedValuation,
    num? totalVolume,
    num? high24H,
    num? low24H,
    num? priceChange24H,
    num? priceChangePercentage24H,
    num? marketCapChange24H,
    num? marketCapChangePercentage24H,
    num? circulatingSupply,
    num? totalSupply,
    num? maxSupply,
    num? ath,
    num? athChangePercentage,
    String? athDate,
    num? atl,
    num? atlChangePercentage,
    String? atlDate,
    String? lastUpdated,
  }) =>
      CoinsModel(
        id: id ?? this.id,
        symbol: symbol ?? this.symbol,
        name: name ?? this.name,
        image: image ?? this.image,
        currentPrice: currentPrice ?? this.currentPrice,
        marketCap: marketCap ?? this.marketCap,
        marketCapRank: marketCapRank ?? this.marketCapRank,
        fullyDilutedValuation:
            fullyDilutedValuation ?? this.fullyDilutedValuation,
        totalVolume: totalVolume ?? this.totalVolume,
        high24H: high24H ?? this.high24H,
        low24H: low24H ?? this.low24H,
        priceChange24H: priceChange24H ?? this.priceChange24H,
        priceChangePercentage24H:
            priceChangePercentage24H ?? this.priceChangePercentage24H,
        marketCapChange24H: marketCapChange24H ?? this.marketCapChange24H,
        marketCapChangePercentage24H:
            marketCapChangePercentage24H ?? this.marketCapChangePercentage24H,
        circulatingSupply: circulatingSupply ?? this.circulatingSupply,
        totalSupply: totalSupply ?? this.totalSupply,
        maxSupply: maxSupply ?? this.maxSupply,
        ath: ath ?? this.ath,
        athChangePercentage: athChangePercentage ?? this.athChangePercentage,
        athDate: athDate ?? this.athDate,
        atl: atl ?? this.atl,
        atlChangePercentage: atlChangePercentage ?? this.atlChangePercentage,
        atlDate: atlDate ?? this.atlDate,
        lastUpdated: lastUpdated ?? this.lastUpdated,
      );

  factory CoinsModel.fromJson(Map<String, dynamic> json) => CoinsModel(
        id: json["id"],
        symbol: json["symbol"],
        name: json["name"],
        image: json["image"],
        currentPrice: json["current_price"],
        marketCap: json["market_cap"],
        marketCapRank: json["market_cap_rank"],
        fullyDilutedValuation: json["fully_diluted_valuation"],
        totalVolume: json["total_volume"],
        high24H: json["high_24h"],
        low24H: json["low_24h"],
        priceChange24H: json["price_change_24h"],
        priceChangePercentage24H: json["price_change_percentage_24h"],
        marketCapChange24H: json["market_cap_change_24h"],
        marketCapChangePercentage24H: json["market_cap_change_percentage_24h"],
        circulatingSupply: json["circulating_supply"],
        totalSupply: json["total_supply"],
        maxSupply: json["max_supply"],
        ath: json["ath"],
        athChangePercentage: json["ath_change_percentage"],
        athDate: json["ath_date"],
        atl: json["atl"].toDouble(),
        atlChangePercentage: json["atl_change_percentage"],
        atlDate: json["atl_date"],
        lastUpdated: json["last_updated"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "symbol": symbol,
        "name": name,
        "image": image,
        "current_price": currentPrice,
        "market_cap": marketCap,
        "market_cap_rank": marketCapRank,
        "fully_diluted_valuation": fullyDilutedValuation,
        "total_volume": totalVolume,
        "high_24h": high24H,
        "low_24h": low24H,
        "price_change_24h": priceChange24H,
        "price_change_percentage_24h": priceChangePercentage24H,
        "market_cap_change_24h": marketCapChange24H,
        "market_cap_change_percentage_24h": marketCapChangePercentage24H,
        "circulating_supply": circulatingSupply,
        "total_supply": totalSupply,
        "max_supply": maxSupply,
        "ath": ath,
        "ath_change_percentage": athChangePercentage,
        "ath_date": athDate,
        "atl": atl,
        "atl_change_percentage": atlChangePercentage,
        "atl_date": atlDate,
        "last_updated": lastUpdated,
      };
}
