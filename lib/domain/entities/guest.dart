import 'package:bukit_vista_flutter_assessment/domain/entities/booking.dart';
import 'package:equatable/equatable.dart';

class Guest extends Equatable {
  final String name;
  final String urlImg;
  final String origin;
  final List<Booking> bookHistory;
  const Guest(this.name, this.urlImg, this.origin, this.bookHistory);

  @override
  List<Object?> get props => [name, urlImg, origin, bookHistory];
}
