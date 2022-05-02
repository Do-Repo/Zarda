class BusinessData {
  String name;

  BusinessData({
    required this.name,
  });

  Map<String, dynamic> toJson() => {
        "name": name,
      };
}
