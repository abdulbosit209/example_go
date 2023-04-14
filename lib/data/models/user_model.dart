import 'package:equatable/equatable.dart';

class User extends Equatable {
  const User({
    required this.id,
    this.name,
    this.phone,
    this.photo,
  });

  final String id;
  final String? phone;
  final String? name;
  final String? photo;

  static const empty = User(id: "");

  bool get isEmpty => this == User.empty;

  bool get isNotEmpty => this != User.empty;

  @override
  List<Object?> get props => [id, phone, name, photo];
}
