class DisasterReport {
  String name;
  String dtype;
  String description;
  String contact;
  String location;
  String date;
  String time;
  String status;

  DisasterReport({
    required this.name,
    required this.dtype,
    required this.description,
    required this.contact,
    required this.location,
    required this.date,
    required this.time,
    required this.status,
  });

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'dtype': dtype,
      'description': description,
      'contact': contact,
      'location': location,
      'date': date,
      'time': time,
      'status': status,
    };
  }
}
