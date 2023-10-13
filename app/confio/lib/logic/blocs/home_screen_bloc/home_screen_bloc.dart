import 'package:bloc/bloc.dart';
import 'package:confio/models/payment.dart';
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

        List<Payment>? listOfPayments =
            await firebaseService.getPaymentsNextThirtyDays();

        if (listOfPayments == null) {
          emit.call(PaymentsFailed());
          Get.snackbar(
              "Error al cargar los pagos", "No se pudieron cargar los pagos");
        } else {
          emit.call(PaymentsLoaded(payments: listOfPayments));
        }
      }
    });
  }
}
