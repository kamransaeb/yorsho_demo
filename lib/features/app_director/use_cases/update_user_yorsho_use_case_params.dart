import 'package:equatable/equatable.dart';

import '../../../entities/user_yorsho/user_yorsho_entity.dart';


class UpdateUserYorshoUseCaseParams extends Equatable {
  final UserYorshoEntity userYorshoEntity;

  const UpdateUserYorshoUseCaseParams({required this.userYorshoEntity,});

  @override
  List<Object?> get props => [userYorshoEntity];
}