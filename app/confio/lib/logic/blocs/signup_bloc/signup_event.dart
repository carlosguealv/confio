part of 'signup_bloc.dart';

@immutable
abstract class SignupEvent {}

class Signup extends SignupEvent {
  final String email;
  final String password;

  Signup({
    required this.email,
    required this.password,
  });
}
