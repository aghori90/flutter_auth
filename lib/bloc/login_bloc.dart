import 'dart:async';
import 'package:rxdart/rxdart.dart';

class LoginBloc {
  // Controllers
      final _loginEmail= BehaviorSubject<String>();
      final _loginPassword= BehaviorSubject<String>();
  // getters for listen
      Stream<String> get loginEmail => _loginEmail.stream;
      Stream<String> get loginPassword => _loginPassword.stream;
  // setters for listen need getter bezc its private property
      Function(String) get changeLoginEmail => _loginEmail.sink.add;
      Function(String) get changeLoginPassword => _loginPassword.sink.add;
  //validation

  // controllers dispose
      void dispose(){
        _loginEmail.close();
        _loginPassword.close();
      }
}