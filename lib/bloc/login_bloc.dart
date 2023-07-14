import 'dart:async';
import 'package:abc/bloc/validators.dart';
import 'package:rxdart/rxdart.dart';

//mixin i called with keywords
class LoginBloc with Validators {
  // Controllers
  final _loginEmail = BehaviorSubject<String>();
  final _loginPassword = BehaviorSubject<String>();

  // getters for listen
  Stream<String> get loginEmail => _loginEmail.stream.transform(emailValidator);
  Stream<String> get loginPassword => _loginPassword.stream.transform(loginpasswordValidator);
  // stream for button
  Stream<bool> get isValid => Rx.combineLatest2(loginEmail, loginPassword, (a, b) => true);

  // setters for listen need getter bezc its private property
  Function(String) get changeLoginEmail => _loginEmail.sink.add;
  Function(String) get changeLoginPassword => _loginPassword.sink.add;
  //Transformers (validator)


  // controllers dispose
  void dispose() {
    _loginEmail.close();
    _loginPassword.close();
  }
}
