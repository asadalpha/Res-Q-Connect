import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class Organization {
  String name;
  String description;
  String location;
  String OrgType;
  String lat;
  String long;
  Organization({
    required this.lat,
    required this.long,
    required this.name,
    required this.description,
    required this.location,
    required this.OrgType,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'description': description,
      'location': location,
      'OrgType': OrgType,
      'lat': lat,
      'long': long,
    };
  }
}
