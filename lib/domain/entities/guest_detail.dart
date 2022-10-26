import 'package:bukit_vista_flutter_assessment/domain/entities/booking.dart';
import 'package:equatable/equatable.dart';

class GuestDetail extends Equatable {
  final String id;
  final String name;
  final String image;
  final String origin;
  final String email;
  final String phoneNumber;
  final List<Booking> booking;

  const GuestDetail(this.id, this.name, this.image, this.origin, this.email,
      this.phoneNumber, this.booking);
  @override
  List<Object?> get props =>
      [id, name, image, origin, email, phoneNumber, booking];
}
