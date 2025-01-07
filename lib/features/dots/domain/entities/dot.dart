import 'package:equatable/equatable.dart';

class Dot extends Equatable {
  final String id;
  final String profession;
  final String personality;
  final String imageUrl;

  const Dot({
    required this.id,
    required this.profession,
    required this.personality,
    required this.imageUrl,
  });

  @override
  List<Object?> get props => [id, profession, personality, imageUrl];
}
