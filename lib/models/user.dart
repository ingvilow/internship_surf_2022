import 'package:json_annotation/json_annotation.dart';
import 'package:test_provider_2/models/Address.dart';
import 'package:test_provider_2/models/Company.dart';

part 'user.g.dart';

@JsonSerializable()
class Users {
  final int id;
  final String name;
  final String username;
  final String email;
  final Address address;
  final String phone;
  final String website;
  final Company company;

  Users({
    required this.id,
    required this.name,
    required this.username,
    required this.email,
    required this.address,
    required this.phone,
    required this.website,
    required this.company,
  });

  factory Users.fromJson(Map<String, dynamic> json) => _$UsersFromJson(json);

  Map<String, dynamic> toJson() => _$UsersToJson(this);
}
