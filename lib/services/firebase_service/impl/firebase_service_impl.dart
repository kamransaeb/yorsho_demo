import 'dart:io';
import 'dart:typed_data';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/services.dart';
import '../../../data/authentication/models/my_user.dart';
import '../../log_service/log_service.dart';
import '../firebase_service.dart';

class FirebaseServiceImpl implements FirebaseService {

  final LogService _logService;

  FirebaseServiceImpl({
      required LogService logService,
  }) : _logService = logService;


  @override
  Future<String?> uploadImageForUser(MyUser myUser, String fileName, Uint8List imageBytes) async {

    _logService.i('FirebaseServiceImpl uploadImageForUser url: ${myUser.tenantId}/${myUser.role}/${myUser.uid}/');
    String? downloadUrl;
    try {


      final storageRef = FirebaseStorage.instance.ref('${myUser.tenantId}/${myUser.role}/${myUser.uid}/');
      final uploadRef = storageRef.child(fileName);
      await uploadRef.putData(imageBytes);
      downloadUrl = await uploadRef.getDownloadURL();
      _logService.i('FirebaseServiceImpl uploadImageForUser downloadUrl: $downloadUrl');
      return downloadUrl.toString();

    } catch (error, stackTrace) {
      _logService.e('FirebaseServiceImpl uploadImageForUser Exception: $error', error, stackTrace);
    }
    return null;
  }
}
