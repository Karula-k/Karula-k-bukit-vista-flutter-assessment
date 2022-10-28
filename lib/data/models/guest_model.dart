import 'package:bukit_vista_flutter_assessment/domain/entities/guest.dart';

class GuestModel extends Guest {
  const GuestModel(super.id, super.name, super.urlImg, super.origin);

  factory GuestModel.fromJson(Map<String, dynamic> json) =>
      GuestModel(json['id'], json['name'], json['image'], json['origin']);
}
