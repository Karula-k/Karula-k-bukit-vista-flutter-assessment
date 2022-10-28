import 'package:equatable/equatable.dart';

class Guest extends Equatable {
  final int id;
  final String name;
  final String urlImg;
  final String origin;
  const Guest(this.id, this.name, this.urlImg, this.origin);

  @override
  List<Object?> get props => [id, name, urlImg, origin];
}
