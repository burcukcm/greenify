class Plant {
  final String id;
  final String name;
  final DateTime? lastWatered;
  final int wateringInterval;
  final String? photoUrl;

  Plant({
    required this.id,
    required this.name,
    this.lastWatered,
    required this.wateringInterval,
    this.photoUrl,
  });

  // Firebase'den gelen Map (JSON) verisini Plant nesnesine çevirir
  factory Plant.fromMap(Map<String, dynamic> data, String documentId) {
    return Plant(
      id: documentId,
      name: data['name'] ?? '',
      lastWatered: data['lastWatered'] != null
          ? DateTime.parse(data['lastWatered'])
          : null,
      wateringInterval: data['wateringInterval'] ?? 7,
      photoUrl: data['photoUrl'],
    );
  }

  // Plant nesnesini Firebase'e yollanacak Map formatına çevirir
  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'lastWatered': lastWatered?.toIso8601String(),
      'wateringInterval': wateringInterval,
      'photoUrl': photoUrl,
    };
  }
}
