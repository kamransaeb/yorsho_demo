import '../models/user_yorsho_model.dart';

abstract class UserYorshoRemoteDataSource {
  Future<UserYorshoModel> getOrCreateUserYorshoOpenMobile(String firebaseToken,);
  Future<UserYorshoModel> getUserYorshoMobileClient(String firebaseToken,);
  Future<UserYorshoModel> updateUserYorshoMobileClient(String firebaseToken, UserYorshoModel userYorshoModel,);
  Future<UserYorshoModel> completeUserYorshoMobileClient(String firebaseToken, UserYorshoModel userYorshoModel,);
}