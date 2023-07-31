import 'package:bloc/bloc.dart';
import 'package:confio/services/authentication_service.dart';
import 'package:get/route_manager.dart';
import 'package:meta/meta.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginInitial()) {
    on<LoginEvent>((event, emit) async {
      if (event is Login) {
        emit.call(LoginLoading());
        String? failureMessage = await authenticationService
            .loginWithEmailAndPassword(event.email, event.password);
        if (failureMessage == null) {
          emit.call(LoginSuccess());
        } else {
          emit.call(LoginFailure());
          Get.snackbar("Login was not successfull", failureMessage);
        }
      } else {
        emit.call(LoginFailure());
      }
    });
  }
}
