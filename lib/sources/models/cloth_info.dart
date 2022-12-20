class ClothInfo {
  final String flUserId;
  final String flCategory;
  final String flImageUrl;
  final DateTime flCreateDate;

  ClothInfo({
    required this.flUserId,
    required this.flCategory,
    required this.flImageUrl,
    required this.flCreateDate
  });

  Map<String, dynamic> toJson() => {
    'flUserId': flUserId,
    'flCategory': flCategory,
    'flAvatarSrc': flImageUrl,
    'flCreateDate': flCreateDate
  };

  static ClothInfo fromJson(Map<String, dynamic> json) => ClothInfo(
      flUserId: json['flUserId'],
      flCategory: json['flCategory'],
      flImageUrl: json['flImageUrl'],
      flCreateDate: json['flCreateDate']
  );
}