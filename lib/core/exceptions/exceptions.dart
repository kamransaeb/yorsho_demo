class RestApiException implements Exception {
  final int? statusCode;
  final String? message;
  const RestApiException({this.statusCode, this.message});}

class EmptyException implements Exception {
}

class ConnectionException implements Exception {
}

class LogOutException implements Exception {
  final String message;
  LogOutException([this.message = 'exception_log_out_default']);
}

class SignUpWithEmailAndPasswordException implements Exception {
  final String message;

  const SignUpWithEmailAndPasswordException([
    this.message = 'exception_sign_up_with_email_and_password_default',
  ]);
}

class SendPasswordResetEmailException implements Exception {
  final String message;

  const SendPasswordResetEmailException(
      [this.message = 'exception_send_password_reset_email_default']);
}

class UpdateFirebaseUserDisplayNameException implements Exception {
  final String message;

  const UpdateFirebaseUserDisplayNameException(
      [this.message = 'exception_update_firebase_user_display_name_default']);
}

class UpdateProfileException implements Exception {
  final String message;

  const UpdateProfileException(
      [this.message = 'exception_update_profile_default']);
}

class UpdateEventsGroupException implements Exception {
  final String message;

  const UpdateEventsGroupException(
      [this.message = 'exception_update_events_group_default']);
}

class DeleteEventsGroupException implements Exception {
  final String message;

  const DeleteEventsGroupException(
      [this.message = 'exception_delete_events_group_default']);
}

class CreateEventsGroupListException implements Exception {
  final String message;

  const CreateEventsGroupListException(
      [this.message = 'exception_create_events_group_list_default']);
}

class UpdateClinicException implements Exception {
  final String message;

  const UpdateClinicException(
      [this.message = 'exception_update_clinic_default']);
}

class DeleteClinicException implements Exception {
  final String message;

  const DeleteClinicException(
      [this.message = 'exception_delete_clinic_default']);
}

class CreateCopyClinicException implements Exception {
  final String message;

  const CreateCopyClinicException(
      [this.message = 'exception_create_copy_clinic_default']);
}

class CreateClinicListException implements Exception {
  final String message;

  const CreateClinicListException(
      [this.message = 'exception_create_clinic_list_default']);
}

class UpdateDoctorException implements Exception {
  final String message;

  const UpdateDoctorException(
      [this.message = 'exception_update_doctor_default']);
}

class DeleteDoctorException implements Exception {
  final String message;

  const DeleteDoctorException(
      [this.message = 'exception_delete_doctor_default']);
}

class CreateCopyDoctorException implements Exception {
  final String message;

  const CreateCopyDoctorException(
      [this.message = 'exception_create_copy_doctor_default']);
}

class CreateDoctorListException implements Exception {
  final String message;

  const CreateDoctorListException(
      [this.message = 'exception_create_doctor_list_default']);
}

class UpdateClinicTreatmentException implements Exception {
  final String message;

  const UpdateClinicTreatmentException(
      [this.message = 'exception_update_clinic_treatment_default']);
}

class DeleteClinicTreatmentException implements Exception {
  final String message;

  const DeleteClinicTreatmentException(
      [this.message = 'exception_delete_clinic_treatment_default']);
}

class CreateCopyTreatmentException implements Exception {
  final String message;

  const CreateCopyTreatmentException(
      [this.message = 'exception_create_copy_treatment_default']);
}

class CreateClinicTreatmentListException implements Exception {
  final String message;

  const CreateClinicTreatmentListException(
      [this.message = 'exception_create_clinic_treatment_list_default']);
}

class UpdateClinicTreatmentDoctorException implements Exception {
  final String message;

  const UpdateClinicTreatmentDoctorException(
      [this.message = 'exception_update_clinic_treatment_doctor_default']);
}

class DeleteClinicTreatmentDoctorException implements Exception {
  final String message;

  const DeleteClinicTreatmentDoctorException(
      [this.message = 'exception_delete_clinic_treatment_doctor_default']);
}

class CreateClinicTreatmentDoctorListException implements Exception {
  final String message;

  const CreateClinicTreatmentDoctorListException(
      [this.message = 'exception_create_clinic_treatment_doctor_list_default']);
}

class UpdateTreatmentException implements Exception {
  final String message;

  const UpdateTreatmentException(
      [this.message = 'exception_update_treatment_default']);
}

class DeleteTreatmentException implements Exception {
  final String message;

  const DeleteTreatmentException(
      [this.message = 'exception_delete_treatment_default']);
}

class CreateTreatmentListException implements Exception {
  final String message;

  const CreateTreatmentListException(
      [this.message = 'exception_create_treatment_list_default']);
}

class UpdateEventsException implements Exception {
  final String message;

  const UpdateEventsException(
      [this.message = 'exception_update_events_default']);
}

class DeleteEventsException implements Exception {
  final String message;

  const DeleteEventsException(
      [this.message = 'exception_delete_events_default']);
}

class CreateEventsListException implements Exception {
  final String message;

  const CreateEventsListException(
      [this.message = 'exception_create_events_list_default']);
}

class UpdateYogaStyleGroupException implements Exception {
  final String message;

  const UpdateYogaStyleGroupException(
      [this.message = 'exception_update_yoga_style_group_default']);
}

class DeleteYogaStyleGroupException implements Exception {
  final String message;

  const DeleteYogaStyleGroupException(
      [this.message = 'exception_delete_yoga_style_group_default']);
}

class CreateYogaStyleGroupListException implements Exception {
  final String message;

  const CreateYogaStyleGroupListException(
      [this.message = 'exception_create_yoga_style_group_list_default']);
}

class UpdateYogaStyleException implements Exception {
  final String message;

  const UpdateYogaStyleException(
      [this.message = 'exception_update_yoga_style_default']);
}

class DeleteYogaStyleException implements Exception {
  final String message;

  const DeleteYogaStyleException(
      [this.message = 'exception_delete_yoga_style_default']);
}

class CreateYogaStyleListException implements Exception {
  final String message;

  const CreateYogaStyleListException(
      [this.message = 'exception_create_yoga_style_list_default']);
}

class UpdateExpertException implements Exception {
  final String message;

  const UpdateExpertException(
      [this.message = 'exception_update_expert_default']);
}

class DeleteExpertException implements Exception {
  final String message;

  const DeleteExpertException(
      [this.message = 'exception_delete_expert_default']);
}

class CreateExpertListException implements Exception {
  final String message;

  const CreateExpertListException(
      [this.message = 'exception_create_expert_list_default']);
}

class UpdateMembershipException implements Exception {
  final String message;

  const UpdateMembershipException(
      [this.message = 'exception_update_membership_default']);
}

class DeleteMembershipException implements Exception {
  final String message;

  const DeleteMembershipException(
      [this.message = 'exception_delete_membership_default']);
}

class CreateMembershipListException implements Exception {
  final String message;

  const CreateMembershipListException(
      [this.message = 'exception_create_membership_list_default']);
}

class UpdateMembershipNoteException implements Exception {
  final String message;

  const UpdateMembershipNoteException(
      [this.message = 'exception_update_membership_note_default']);
}

class DeleteMembershipNoteException implements Exception {
  final String message;

  const DeleteMembershipNoteException(
      [this.message = 'exception_delete_membership_note_default']);
}

class CreateMembershipNoteListException implements Exception {
  final String message;

  const CreateMembershipNoteListException(
      [this.message = 'exception_create_membership_note_list_default']);
}

class LogInWithEmailAndPasswordException implements Exception {
  final String message;

  const LogInWithEmailAndPasswordException([
    this.message = 'exception_log_in_with_email_and_password_default',
  ]);
}