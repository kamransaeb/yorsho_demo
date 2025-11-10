import 'package:equatable/equatable.dart';

class GetVideosListEnabledByVideosCategoryIdListParams extends Equatable {
  final List<int> videosCategoryIdList;

  const GetVideosListEnabledByVideosCategoryIdListParams({
    required this.videosCategoryIdList,
  });

  @override
  List<Object> get props => [videosCategoryIdList];
}