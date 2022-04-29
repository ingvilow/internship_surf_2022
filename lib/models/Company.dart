import 'package:json_annotation/json_annotation.dart';

part 'Company.g.dart';

@JsonSerializable()
class Company {
 final String name;
 final String catchPhrase;
 final String bs;

  Company({
   required this.name,
   required this.catchPhrase,
   required this.bs,
  });

  factory Company.fromJson(Map<String, String> json) => _$CompanyFromJson(json);

  Map<String, Object?> toJson() => _$CompanyToJson(this);
}
