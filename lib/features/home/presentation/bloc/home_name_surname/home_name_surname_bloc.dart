import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:formz/formz.dart';
import 'package:meta/meta.dart';
import '../../../../../entities/user_yorsho/user_yorsho_entity.dart';
import '../../../../../widgets/inputs/name_input.dart';

part 'home_name_surname_event.dart';
part 'home_name_surname_state.dart';

class HomeNameSurnameBloc extends Bloc<HomeNameSurnameEvent, HomeNameSurnameState> {
  HomeNameSurnameBloc()
      : super(
    const HomeNameSurnameState(
      userYorshoEntity: UserYorshoEntity.empty,
    ),
  ) {
    on<HomeNameSurnameEventFetched>(_onHomeNameSurnameEventFetched);
    on<HomeNameSurnameEventNameChanged>(_onHomeNameSurnameEventNameChanged);
    on<HomeNameSurnameEventSurnameChanged>(_onHomeNameSurnameEventSurnameChanged);
  }

  _onHomeNameSurnameEventNameChanged(
      HomeNameSurnameEventNameChanged event, Emitter<HomeNameSurnameState> emit) {
    final userYorshoNameInput = NameInput.dirty(event.name);
    emit(
      state.copyWith(
        userYorshoNameInput: userYorshoNameInput,
        userYorshoEntity: state.userYorshoEntity.copyWith(name: event.name),
        isValid: Formz.validate([
          userYorshoNameInput,
          state.userYorshoSurnameInput,
        ]),
      ),
    );
  }

  _onHomeNameSurnameEventSurnameChanged(
      HomeNameSurnameEventSurnameChanged event, Emitter<HomeNameSurnameState> emit) {

    final userYorshoSurnameInput = NameInput.dirty(event.surname);
    emit(
      state.copyWith(
        userYorshoSurnameInput: userYorshoSurnameInput,
        userYorshoEntity: state.userYorshoEntity.copyWith(surname: event.surname),
        isValid: Formz.validate([
          userYorshoSurnameInput,
          state.userYorshoNameInput,
        ]),
      ),
    );
  }

  _onHomeNameSurnameEventFetched(
      HomeNameSurnameEventFetched event, Emitter<HomeNameSurnameState> emit) async {

    // final userYorshoNameInput = NameInput.dirty(event.userYorshoEntity.name);
    // final userYorshoSurnameInput = NameInput.dirty(event.userYorshoEntity.surname);

    emit(
      state.copyWith(
        userYorshoEntity: event.userYorshoEntity,
        homeNameSurnameStatus: HomeNameSurnameStatus.success,
        // userYorshoNameInput: userYorshoNameInput,
        // userYorshoSurnameInput: userYorshoSurnameInput,
        // isValid: Formz.validate([
        //   userYorshoNameInput,
        //   userYorshoSurnameInput,
        // ]),
      ),
    );
  }
}
