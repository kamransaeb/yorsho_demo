import 'package:equatable/equatable.dart';

import '../../../entities/user_yorsho/user_yorsho_entity.dart';

class CompleteUserYorshoUseCaseParams extends Equatable {
  final UserYorshoEntity userYorshoEntity;

  const CompleteUserYorshoUseCaseParams({required this.userYorshoEntity,});

  @override
  List<Object?> get props => [userYorshoEntity];
}