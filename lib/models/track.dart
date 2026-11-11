/// A track of the tracks table: name, artist and cover.
class Track {
  static const defaultImageUrl = 'https://picsum.photos/400';

  final String id;
  final String name;
  final String artistName;
  final String imageUrl;

  const Track({
    required this.id,
    required this.name,
    required this.artistName,
    this.imageUrl = defaultImageUrl,
  });

  factory Track.fromMap(Map<String, dynamic> map) {
    return Track(
      id: map['id'] as String,
      name: map['name'] as String,
      artistName: map['artist_name'] as String,
      imageUrl: map['image_url'] as String? ?? defaultImageUrl,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'artist_name': artistName,
      'image_url': imageUrl,
    };
  }

  Track copyWith({
    String? id,
    String? name,
    String? artistName,
    String? imageUrl,
  }) {
    return Track(
      id: id ?? this.id,
      name: name ?? this.name,
      artistName: artistName ?? this.artistName,
      imageUrl: imageUrl ?? this.imageUrl,
    );
  }
}
