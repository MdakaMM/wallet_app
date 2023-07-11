import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final SharedPreferences sharedPreferences;

  LoginBloc(this.sharedPreferences) : super(LoginInitial());

  @override
  Stream<LoginState> mapEventToState(LoginEvent event) async* {
    if (event is LoginButtonPressed) {
      yield LoginLoading();
      try {
        // Perform login logic here (e.g., API call, validation)
        if (event.username.isNotEmpty && event.password.length >= 8) {
          // Save username to shared preferences
          await sharedPreferences.setString('username', event.username);
          yield LoginSuccess();
        } else {
          yield LoginFailure();
        }
      } catch (e) {
        yield LoginFailure();
      }
    }
  }
}