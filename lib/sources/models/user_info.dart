class KUserInfo {
  final String flUserId;
  final String flAvatarSrc;
  final String flFirstName;
  final String flLastName;
  final String flMiddleName;
  final int flGrowth;
  final int flWeight;

  KUserInfo({
    required this.flUserId,
    required this.flAvatarSrc,
    required this.flFirstName,
    required this.flLastName,
    required this.flMiddleName,
    required this.flGrowth,
    required this.flWeight
  });

  Map<String, dynamic> toJson() => {
    'flUserId': flUserId,
    'flAvatarSrc': flAvatarSrc,
    'flFirstName': flFirstName,
    'flLastName': flLastName,
    'flMiddleName': flMiddleName,
    'flGrowth': flGrowth,
    'flWeight': flWeight
  };

  static KUserInfo fromJson(Map<String, dynamic> json) => KUserInfo(
    flUserId: json['flUserId'],
    flAvatarSrc: json['flAvatarSrc'],
    flFirstName: json['flFirstName'],
    flLastName: json['flLastName'],
    flMiddleName: json['flMiddleName'],
    flGrowth: json['flGrowth'],
    flWeight: json['flWeight']
  );
}