import 'package:equatable/equatable.dart';

class Dot extends Equatable {
  final String id;
  final String name;
  final String profession;
  final String personality;
  final String imageUrl;

  const Dot({
    required this.id,
    required this.name,
    required this.profession,
    required this.personality,
    required this.imageUrl,
  });

  @override
  List<Object?> get props => [id];
}
