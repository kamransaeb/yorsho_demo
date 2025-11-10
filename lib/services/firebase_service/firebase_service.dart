import 'dart:typed_data';

import '../../data/authentication/models/my_user.dart';

abstract class FirebaseService {
  Future<String?> uploadImageForUser(MyUser myUser, String fileName, Uint8List imageBytes);
  }
