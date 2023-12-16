part of 'home_screen_bloc.dart';

@immutable
abstract class HomeState {}

class InitialState extends HomeState {}

class PaymentsLoading extends HomeState {}

class PaymentsLoaded extends HomeState {
  final List<Payment> first7DaysPayments;
  final List<Payment> restOfPayments;

  PaymentsLoaded(
      {required this.first7DaysPayments, required this.restOfPayments});
}

class PaymentsFailed extends HomeState {}
