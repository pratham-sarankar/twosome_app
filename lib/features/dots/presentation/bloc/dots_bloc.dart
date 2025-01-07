import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:twosome_app/core/usecases/usecase.dart';
import 'package:twosome_app/features/dots/domain/use_cases/get_dots.dart';
import 'package:twosome_app/features/dots/presentation/bloc/dots_event.dart';
import 'package:twosome_app/features/dots/presentation/bloc/dots_state.dart';

class DotsBloc extends Bloc<DotsEvent, DotsState> {
  final GetDots getDots;

  DotsBloc(this.getDots) : super(const DotsState()) {
    on<LoadDots>(_onLoadDots);
  }

  void _onLoadDots(LoadDots event, Emitter<DotsState> emit) async {
    emit(state.copyWith(status: DotsStatus.loading));
    final result = await getDots.call(NoParams());
    result.fold(
      (failure) => emit(
          state.copyWith(status: DotsStatus.failure, error: failure.message)),
      (dots) => emit(state.copyWith(status: DotsStatus.success, dots: dots)),
    );
  }
}
