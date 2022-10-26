import 'package:bukit_vista_flutter_assessment/domain/entities/guest_detail.dart';

class GuestDetailModel extends GuestDetail {
  const GuestDetailModel(super.id, super.name, super.image, super.origin,
      super.email, super.phoneNumber, super.booking);

  factory GuestDetailModel.fromJson(Map<String, dynamic> json) =>
      GuestDetailModel(json['id'], json['name'], json['image'], json['origin'],
          json['email'], json['phone number'], json['booking history']);
}
