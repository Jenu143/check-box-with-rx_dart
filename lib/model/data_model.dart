class DataModel {
  late bool status;
  late Data data;
  DataModel({
    required this.status,
    required this.data,
  });

  DataModel.fromJson(Map<String, dynamic> json) {
    status = json["status"];
    data = Data.fromJson(json["data"]);
  }
}

class Data {
  AdId? adId;
  Keyword? keyword;
  List<MoreApp>? moreApp;
  List<PlayGame>? playGame;

  Data({
    this.adId,
    this.keyword,
    this.moreApp,
    this.playGame,
  });
  Data.fromJson(Map<String, dynamic> json) {
    adId = AdId.fromJson(json["ad_id"]);
    keyword = Keyword.fromJson(json["keyword"]);

    //more app
    if (json["more_app"] != null) {
      moreApp = <MoreApp>[];

      json["more_app"].forEach((e) {
        moreApp?.add(MoreApp.fromJson(e));
      });
    }

    //play game
    if (json["play_game"] != null) {
      playGame = <PlayGame>[];

      json["play_game"].forEach((a) {
        playGame?.add(PlayGame.fromJson(a));
      });
    }
  }
}

class AdId {
  String? admobBanner;
  String? admobOpenad;
  String? adType;
  String? facebookInterstitial;
  String? admobInterstitial;
  String? facebookNative;
  String? admobNative;
  String? facebookReward;
  String? facebookBanner;
  String? admobReward;
  AdId({
    this.admobBanner,
    this.admobOpenad,
    this.adType,
    this.facebookInterstitial,
    this.admobInterstitial,
    this.facebookNative,
    this.admobNative,
    this.facebookReward,
    this.facebookBanner,
    this.admobReward,
  });
  AdId.fromJson(Map<String, dynamic> json) {
    admobBanner = json["admob_banner"];
    admobOpenad = json["admob_openad"];
    adType = json["ad_type"];
    facebookInterstitial = json["facebook_interstitial"];
    admobInterstitial = json["admob_interstitial"];
    facebookNative = json["facebook_native"];
    admobNative = json["admob_native"];
    facebookReward = json["facebook_reward"];
    facebookBanner = json["facebook_banner"];
    admobReward = json["admob_reward"];
  }
}

class Keyword {
  String? privavcy;
  String? version;
  Keyword({
    this.privavcy,
    this.version,
  });
  Keyword.fromJson(Map<String, dynamic> json) {
    privavcy = json["privacy"];
    version = json["version"];
  }
}

class MoreApp {
  bool? active;
  String? appUrl;
  String? imageUrl;
  String? appName;
  MoreApp({
    this.active,
    this.appUrl,
    this.imageUrl,
    this.appName,
  });
  MoreApp.fromJson(Map<String, dynamic> json) {
    active = json["active"];
    appUrl = json["appurl"];
    imageUrl = json["imageurl"];
    appName = json["appname"];
  }
}

class PlayGame {
  bool? active;
  String? appUrl;
  String? imageUrl;
  PlayGame({
    this.active,
    this.appUrl,
    this.imageUrl,
  });

  PlayGame.fromJson(Map<String, dynamic> json) {
    active = json["active"];
    appUrl = json["appurl"];
    imageUrl = json["imageurl"];
  }
}
