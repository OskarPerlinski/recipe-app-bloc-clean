import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:recipe_app/common/bloc/button/button_state.dart';
import 'package:recipe_app/core/usecases/usecases.dart';

class ButtonStateCubit extends Cubit<ButtonState> {
  ButtonStateCubit() : super(ButtonInitialState());

  Future<void> execute({dynamic params, required Usecases usecases}) async {
    emit(ButtonLoadingState());
    try {
      Either returnedData = await usecases.call(params: params);

      returnedData.fold(
        (error) {
          emit(ButtonFailureState(errorMessage: error));
        },
        (data) {
          emit(ButtonSuccessState());
        },
      );
    } catch (e) {
      emit(
        ButtonFailureState(errorMessage: e.toString()),
      );
    }
  }
}
