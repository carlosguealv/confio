import 'package:bloc/bloc.dart';
import 'package:confio/services/authentication_service.dart';
import 'package:get/route_manager.dart';
import 'package:meta/meta.dart';

part 'signup_event.dart';
part 'signup_state.dart';

class SignupBloc extends Bloc<SignupEvent, SignupState> {
  SignupBloc() : super(SignupInitial()) {
    on<SignupEvent>((event, emit) async {
      if (event is Signup) {
        emit.call(SignupLoading());
        String? failureMessage = await authenticationService
            .signUpWithEmailAndPassword(event.email, event.password);
        if (failureMessage == null) {
          emit.call(SignupSuccess());
        } else {
          emit.call(SignupFailure());
          Get.snackbar("Sign up was not successfull", failureMessage);
        }
      } else {
        emit.call(SignupFailure());
      }
    });
  }
}
