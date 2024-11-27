class School {
  final String name;
  final String location;
  final int totalStudents;
  School(
      {required this.name,
      required this.location,
      required this.totalStudents});

  School copyWith({String? name, String? location, int? totalStudents}) {
    return School(
        name: name ?? this.name,
        location: location ?? this.location,
        totalStudents: totalStudents ?? this.totalStudents);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is School &&
        name == other.name &&
        location == other.location &&
        totalStudents == other.totalStudents;
  }

  @override
  int get hashCode =>
      name.hashCode ^ location.hashCode ^ totalStudents.hashCode;
}
