import 'package:equatable/equatable.dart';

class Guest extends Equatable {
  final String name;
  final String urlImg;
  final String origin;
  const Guest(this.name, this.urlImg, this.origin);

  @override
  List<Object?> get props => [name, urlImg, origin];
}
