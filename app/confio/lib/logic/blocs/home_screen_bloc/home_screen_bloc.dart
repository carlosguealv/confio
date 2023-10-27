import 'package:bloc/bloc.dart';
import 'package:confio/models/overall_payment.dart';
import 'package:confio/models/payment.dart';
import 'package:confio/services/authentication_service.dart';
import 'package:confio/services/firebase_service.dart';
import 'package:get/route_manager.dart';
import 'package:meta/meta.dart';

part 'home_screen_state.dart';
part 'home_screen_event.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(InitialState()) {
    on<HomeEvent>((event, emit) async {
      if (event is PaymentLoad) {
        emit.call(PaymentsLoading());

        List<OverallPayment>? listOfPayments = await firebaseService
            .getPaymentsByUid(authenticationService.currentUser!.uid);

        if (listOfPayments == null) {
          emit.call(PaymentsFailed());
          Get.snackbar(
              "Error al cargar los pagos", "No se pudieron cargar los pagos");
        } else {
          List<Payment> listOfFirst7DaysPayments = listOfPayments
              .where((payment) => payment.due.any((element) =>
                  element.toDate().isAfter(
                      DateTime.now().subtract(const Duration(days: 1))) &&
                  element
                      .toDate()
                      .isBefore(DateTime.now().add(const Duration(days: 7)))))
              .toList()
              .fold(
                List<Payment>.empty(),
                (prevList, overallPayment) =>
                    prevList +
                    Payment.fromOverallPayment(overallPayment)
                        .map((e) => e!)
                        .toList(),
              )
              .where((payment) =>
                  payment.due.toDate().isAfter(
                      DateTime.now().subtract(const Duration(days: 1))) &&
                  payment.due
                      .toDate()
                      .isBefore(DateTime.now().add(const Duration(days: 7))))
              .toList();

          List<Payment> listOfRestOfPayments = listOfPayments
              .where((payment) => payment.due.every((element) => !element
                  .toDate()
                  .isAfter(DateTime.now().add(const Duration(days: 30)))))
              .toList()
              .fold(
                List<Payment>.empty(),
                (prevList, overallPayment) =>
                    prevList +
                    Payment.fromOverallPayment(overallPayment)
                        .map((e) => e!)
                        .toList(),
              )
              .where(
                (payment) =>
                    payment.due.toDate().isBefore(
                        DateTime.now().add(const Duration(days: 30))) &&
                    payment.due.toDate().isAfter(
                          DateTime.now().add(const Duration(days: 7)),
                        ),
              )
              .toList();
          emit.call(
            PaymentsLoaded(
              first7DaysPayments: listOfFirst7DaysPayments,
              restOfPayments: listOfRestOfPayments,
            ),
          );
        }
      }
    });
  }
}
