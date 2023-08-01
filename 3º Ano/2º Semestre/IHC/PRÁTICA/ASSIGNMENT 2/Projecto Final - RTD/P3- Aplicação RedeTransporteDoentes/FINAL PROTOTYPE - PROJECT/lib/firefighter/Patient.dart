class Patient {
  final String name;
  final String status;
  final String details;

  Patient({required this.name, required this.status, required this.details});

  Patient copyWith({String? name, String? status, String? details}) {
    return Patient(
      name: name ?? this.name,
      status: status ?? this.status,
      details: details ?? this.details,
    );
  }
}