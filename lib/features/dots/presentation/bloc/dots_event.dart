import 'package:equatable/equatable.dart';

abstract class DotsEvent extends Equatable {
  const DotsEvent();

  @override
  List<Object> get props => [];
}

class LoadDots extends DotsEvent {}
