import 'package:equatable/equatable.dart';

class Booking extends Equatable {
  final String idBooking;
  final String place;
  final DateTime dateStart;
  final DateTime dateEnd;
  const Booking(this.idBooking, this.place, this.dateStart, this.dateEnd);

  @override
  List<Object?> get props => [idBooking, place, dateStart, dateEnd];
}
