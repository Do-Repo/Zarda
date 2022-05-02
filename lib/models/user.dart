class UserData {
  String name;
  int accountType;

  UserData({
    required this.name,
    required this.accountType,
  });

  Map<String, dynamic> toJson() => {
        "name": name,
        "accountType": accountType,
      };

  UserData.fromJson(Map<String, dynamic> parsedJSON)
      : name = parsedJSON['name'],
        accountType = parsedJSON['accountType'];
}
