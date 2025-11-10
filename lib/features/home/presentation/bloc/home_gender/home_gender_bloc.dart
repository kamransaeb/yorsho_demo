import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import '../../../../../entities/user_yorsho/user_yorsho_entity.dart';

part 'home_gender_event.dart';
part 'home_gender_state.dart';

class HomeGenderBloc extends Bloc<HomeGenderEvent, HomeGenderState> {
  HomeGenderBloc()
      : super(
    const HomeGenderState(
      userYorshoEntity: UserYorshoEntity.empty,
      gender: -1,
    ),
  ) {
    on<HomeGenderEventFetched>(_onHomeGenderEventFetched);
    on<HomeGenderEventGenderChanged>(_onHomeGenderEventGenderChanged);
  }

  _onHomeGenderEventGenderChanged(
      HomeGenderEventGenderChanged event, Emitter<HomeGenderState> emit) {
    emit(
      state.copyWith(
        userYorshoEntity: state.userYorshoEntity.copyWith(gender: event.gender),
        gender: event.gender,
      ),
    );
  }

  _onHomeGenderEventFetched(
      HomeGenderEventFetched event, Emitter<HomeGenderState> emit) async {
    emit(
      state.copyWith(
        userYorshoEntity: event.userYorshoEntity,
        homeGenderStatus: HomeGenderStatus.success,
        gender: event.userYorshoEntity.gender,
      ),
    );
  }
}
