import 'package:equatable/equatable.dart';

enum FailureStatus {
  none,
  serverFailure,
  connectionFailure,
  databaseFailure,
  noContentFailure,
  isAppUpdateFailure,
  authenticationFailure,
  cannotOpenFileFailure,
}

final class Failure extends Equatable {
  final FailureStatus status;
  final String? message;

  @override
  List<Object?> get props => [message, status];

//<editor-fold desc="Data Methods">
  const Failure({this.message, this.status = FailureStatus.none});

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          (other is Failure &&
              runtimeType == other.runtimeType &&
              status == other.status &&
              message == other.message);

  @override
  int get hashCode => status.hashCode ^ message.hashCode;

  @override
  String toString() {
    return 'Failure{' + ' status: $status,' + ' message: $message,' + '}';
  }

  Failure copyWith({
    FailureStatus? status,
    String? message,
  }) {
    return Failure(
      status: status ?? this.status,
      message: message ?? this.message,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'status': this.status.index,
      'message': this.message,
    };
  }

  factory Failure.fromMap(Map<String, dynamic> map) {
    return Failure(
      status: FailureStatus.values[map['status'] as int],
      message: map['message'] as String,
    );
  }

//</editor-fold>
}
