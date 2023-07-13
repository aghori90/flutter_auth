import 'dart:async';
import 'package:rxdart/rxdart.dart';

class RegisterBloc {
  // controllers
      final _registerName = BehaviorSubject<String>();
      final _registerEmail = BehaviorSubject<String>();
      final _registerMobile = BehaviorSubject<String>();
      final _registerPassword = BehaviorSubject<String>();
      final _registerCnfPassword = BehaviorSubject<String>();
  // getters
      Stream<String> get registerName => _registerName.stream;
      Stream<String> get registerEmail => _registerEmail.stream;
      Stream<String> get registerMobile => _registerMobile.stream;
      Stream<String> get registerPassword => _registerPassword.stream;
      Stream<String> get registerCnfPassword => _registerCnfPassword.stream;
  // setters for listen form papge
      Function(String) get changeRegisterName => _registerName.sink.add;
      Function(String) get changeRegisterEmail => _registerEmail.sink.add;
      Function(String) get changeRegisterMobile=> _registerMobile.sink.add;
      Function(String) get changeRegisterPassword => _registerPassword.sink.add;
      Function(String) get changeRegisterCnfPassword => _registerCnfPassword.sink.add;
  //  Validation

  //  controller dispose
    void dispose(){
      _registerName.close();
      _registerEmail.close();
      _registerMobile.close();
      _registerPassword.close();
      _registerCnfPassword.close();
    }

}