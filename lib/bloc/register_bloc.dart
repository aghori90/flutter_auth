import 'dart:async';
import 'package:abc/bloc/validators.dart';
import 'package:rxdart/rxdart.dart';

class RegisterBloc with Validators {
  // controllers
  final _registerName = BehaviorSubject<String>();
  final _registerEmail = BehaviorSubject<String>();
  final _registerMobile = BehaviorSubject<String>();
  final _registerPassword = BehaviorSubject<String>();
  final _registerCnfPassword = BehaviorSubject<String>();

  // getters
  Stream<String> get registerName =>
      _registerName.stream.transform(nameValidator);
  Stream<String> get registerEmail =>
      _registerEmail.stream.transform(emailValidator);
  Stream<String> get registerMobile =>
      _registerMobile.stream.transform(mobileValidator);
  Stream<String> get registerPassword =>
      _registerPassword.stream.transform(passwordValidator);
  Stream<String> get registerCnfPassword =>
      _registerCnfPassword.stream.transform(passwordValidator);
  //for button
  Stream<bool> get isValid => Rx.combineLatest5(
      registerName,
      registerEmail,
      registerMobile,
      registerPassword,
      registerCnfPassword,
      (a, b, c, d, e) => true);

  // for password match
  Stream<bool> get passMatch => Rx.combineLatest2(registerPassword, registerCnfPassword, (a, b) {
    if(a != b){
      return false;
    }else{
      return true;
    }
  });

  // setters for listen form papge
  Function(String) get changeRegisterName => _registerName.sink.add;
  Function(String) get changeRegisterEmail => _registerEmail.sink.add;
  Function(String) get changeRegisterMobile => _registerMobile.sink.add;
  Function(String) get changeRegisterPassword => _registerPassword.sink.add;
  Function(String) get changeRegisterCnfPassword =>
      _registerCnfPassword.sink.add;

  //  controller dispose
  void dispose() {
    _registerName.close();
    _registerEmail.close();
    _registerMobile.close();
    _registerPassword.close();
    _registerCnfPassword.close();
  }
}
