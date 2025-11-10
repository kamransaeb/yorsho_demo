import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import '../../../../../entities/user_yorsho/user_yorsho_entity.dart';

part 'home_birth_date_event.dart';

part 'home_birth_date_state.dart';

class HomeBirthDateBloc extends Bloc<HomeBirthDateEvent, HomeBirthDateState> {
  HomeBirthDateBloc()
      : super(HomeBirthDateState(
             userYorshoEntity: UserYorshoEntity.empty,
             homeBirthDateStatus: HomeBirthDateStatus.initial,
            birthDate: DateTime(DateTime.now().year - 20, 6, 15),
          ),
        ) {
    on<HomeBirthDateEventFetched>(_onHomeBirthDateEventFetched);
    on<HomeBirthDateEventBirthDateChanged>(_onHomeBirthDateEventBirthDateChanged);
  }

  _onHomeBirthDateEventBirthDateChanged(
      HomeBirthDateEventBirthDateChanged event, Emitter<HomeBirthDateState> emit) {
    emit(
      state.copyWith(
        userYorshoEntity: state.userYorshoEntity.copyWith(birthDate: event.birthDate),
        birthDate: event.birthDate,
      ),
    );
  }

  _onHomeBirthDateEventFetched(
      HomeBirthDateEventFetched event, Emitter<HomeBirthDateState> emit) async {
    emit(
      state.copyWith(
        userYorshoEntity: event.userYorshoEntity.copyWith(birthDate: state.birthDate),
        homeBirthDateStatus: HomeBirthDateStatus.success,
      ),
    );
  }

}
