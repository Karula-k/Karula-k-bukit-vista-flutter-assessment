import 'package:bukit_vista_flutter_assessment/domain/entities/guest.dart';

class GuestMode extends Guest {
  const GuestMode(super.name, super.urlImg, super.origin, super.bookHistory);

  factory GuestMode.fromJson(Map<String, dynamic> json) => GuestMode(
      json['name'], json['urlImg'], json['origin'], json['bookHistory']);
}
