import 'package:bloc/bloc.dart';
import 'package:confio/services/authentication_service.dart';
import 'package:get/get.dart';
import 'package:meta/meta.dart';

part 'forgot_password_event.dart';
part 'forgot_password_state.dart';

class ForgotPasswordBloc
    extends Bloc<ForgotPasswordEvent, ForgotPasswordState> {
  ForgotPasswordBloc() : super(ForgotPasswordInitial()) {
    on<ForgotPasswordEvent>((event, emit) async {
      if (event is ForgotPassword) {
        emit.call(ForgotPasswordLoading());
        bool didSucceed =
            await authenticationService.sendPasswordResetEmail(event.email);
        if (didSucceed) {
          emit.call(ForgotPasswordSuccess());
          Get.snackbar("Email sent successfully",
              "Please check your email and reset your password");
        } else {
          emit.call(ForgotPasswordFailure());
          Get.snackbar("Email couldn't be sent", "Please try again later");
        }
      } else {
        emit.call(ForgotPasswordFailure());
      }
    });
  }
}
