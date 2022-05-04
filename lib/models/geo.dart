import 'package:json_annotation/json_annotation.dart';

part 'geo.g.dart';

@JsonSerializable()
class Geo {
  final String lat;
  final String lng;

  Geo({
    required this.lat,
    required this.lng,
  });

  factory Geo.fromJson(Map<String, String> json) => _$GeoFromJson(json);

  Map<String, Object?> toJson() => _$GeoToJson(this);
}
