part of 'forgot_password_bloc.dart';

@immutable
abstract class ForgotPasswordEvent {}

class ForgotPassword extends ForgotPasswordEvent {
  final String email;

  ForgotPassword({
    required this.email,
  });
}
