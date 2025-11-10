import 'package:equatable/equatable.dart';

class MyUser extends Equatable {
  /// {@macro user}
  const MyUser({
    required this.uid,
    this.tenantId,
    this.email,
    this.name,
    this.role,
  });

  /// The current user's email address.
  final String? email;

  /// The current user's id.
  final String uid;

  /// The current user's tenant_id.
  final String? tenantId;

  /// The current user's name (display name).
  final String? name;

  final String? role;

  /// Empty user which represents an unauthenticated user.
  static const empty = MyUser(uid: '',);

  /// Convenience getter to determine whether the current user is empty.
  bool get isEmpty => this == MyUser.empty;

  /// Convenience getter to determine whether the current user is not empty.
  bool get isNotEmpty => this != MyUser.empty;

  @override
  List<Object?> get props => [email, uid, name, tenantId, role,];
}