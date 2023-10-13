part of 'home_screen_bloc.dart';

@immutable
abstract class HomeState {}

class InitialState extends HomeState {}

class PaymentsLoading extends HomeState {}

class PaymentsLoaded extends HomeState {
  List<Map<String, dynamic>> payments;

  PaymentsLoaded({required this.payments});
}

class PaymentsFailed extends HomeState {}
