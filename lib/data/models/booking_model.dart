import 'package:bukit_vista_flutter_assessment/domain/entities/booking.dart';

class BookingModel extends Booking {
  const BookingModel(
      super.idBooking, super.place, super.dateStart, super.dateEnd);

  factory BookingModel.fromJson(Map<String, dynamic> json) => BookingModel(
      json['id_booking'], json['place'], json['dateStart'], json['dateEnd']);
}
