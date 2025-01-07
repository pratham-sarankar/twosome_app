import 'package:equatable/equatable.dart';
import 'package:twosome_app/features/dots/domain/entities/dot.dart';

enum DotsStatus { initial, loading, success, failure }

class DotsState extends Equatable {
  final DotsStatus status;
  final List<Dot> dots;
  final String? error;

  const DotsState({
    this.status = DotsStatus.initial,
    this.dots = const [],
    this.error,
  });

  DotsState copyWith({
    DotsStatus? status,
    List<Dot>? dots,
    String? error,
  }) {
    return DotsState(
      status: status ?? this.status,
      dots: dots ?? this.dots,
      error: error ?? this.error,
    );
  }

  @override
  List<Object?> get props => [status, dots, error];
}
