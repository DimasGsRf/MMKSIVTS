// Declaring Entities and its property
class User {
  int? id;
  bool? isRegistered, isDataMatched, forceUpdate;
  String? change, goLive;
  Token? token;
  Profile? profile;
  Grade? grade;
  Team? team;
  Dealer? dealer;
  Analytic? analytic;

  OpenedMenu? openedMenu;

  User({
    this.openedMenu,
    this.id,
    this.isRegistered,
    this.change,
    this.isDataMatched,
    this.token,
    this.profile,
    this.grade,
    this.team,
    this.dealer,
    this.analytic,
    this.goLive,
    this.forceUpdate,
  });
}

class OpenedMenu {
  bool? pktIsOpen,
      spkTrackingIsOpen,
      pdiIsOpen,
      warrantyIsOpen,
      contactIsOpen,
      contactCustomerIsOpen;

  OpenedMenu({
    this.pdiIsOpen,
    this.pktIsOpen,
    this.spkTrackingIsOpen,
    this.warrantyIsOpen,
    this.contactIsOpen,
    this.contactCustomerIsOpen,
  });
}

class Token {
  String? accessToken;
  int? expiresAt;

  Token({this.accessToken, this.expiresAt});
}

class Profile {
  String? name,
      salesCode,
      phone,
      email,
      position,
      level,
      photo,
      salesmanPhone,
      salesmanEmail;

  Profile({
    this.name,
    this.salesCode,
    this.phone,
    this.email,
    this.position,
    this.level,
    this.photo,
    this.salesmanEmail,
    this.salesmanPhone,
  });
}

class Grade {
  String? scoreCurrent, current, scorePrev, prev;

  Grade({this.current, this.prev, this.scoreCurrent, this.scorePrev});
}

class Team {
  String? category, entryDate, supervisor;

  Team({this.category, this.entryDate, this.supervisor});
}

class Dealer {
  String? name, code, city, branch, group, area;
  int? dealerGroupId;

  Dealer({
    this.name,
    this.code,
    this.city,
    this.branch,
    this.group,
    this.area,
    this.dealerGroupId,
  });
}

class Analytic {
  int? dealerId;
  String? dealerBranchCode, jobPosition, city;

  Analytic({this.dealerId, this.dealerBranchCode, this.jobPosition, this.city});
}
