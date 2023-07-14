import 'dart:async';

mixin Validators {
  // email validator
  var emailValidator =
    StreamTransformer<String, String>.fromHandlers(handleData: (email, sink) {
      if (email.isEmpty) {
        return sink.addError('Field can not be empty');
      }
      if (email.length > 32) {
        return sink.addError('email length can not be more the 32 characters');
      }
      if (email.length < 6) {
        return sink.addError('Email can not be less then 6 characters');
      }
      if (!RegExp('[a-z0-9]+@[a-z]+\.[a-z]{2,3}').hasMatch(email)) {
        return sink.addError('Entaer a valid email');
      } else {
        sink.add(email);
      }
  });

  // password validator
  var loginpasswordValidator =
    StreamTransformer<String, String>.fromHandlers(handleData: (password, sink) {
      if (password.isEmpty) {
        return sink.addError('Field can not be empty');
      }
      if (password.length < 8) {
        return sink.addError('password can not be less then 8 characters');
      } else {
        sink.add(password);
      }
  });

  // name validator
  var nameValidator =
    StreamTransformer<String, String>.fromHandlers(handleData: (name, sink) {
      if (name.isEmpty) {
        return sink.addError('Field can not be empty');
      }
      if (name.length > 32) {
        return sink.addError('name length can not be more the 32 characters');
      }
      if (name.length < 3) {
        return sink.addError('name can not be less then 6 characters');
      }
      if (!RegExp(r"^[A-Z][-a-zA-Z]+$").hasMatch(name)) {
        return sink.addError('Entaer a valid name');
      } else {
        sink.add(name);
      }
  });

  // mobile validator
  var mobileValidator =
    StreamTransformer<String, String>.fromHandlers(handleData: (mobile, sink) {
      if (mobile.isEmpty) {
        return sink.addError('Field can not be empty');
      }
      if (mobile.length > 10) {
        return sink.addError('mobile should be of 10 digits');
      }
      if (mobile.length < 10) {
        return sink.addError('Mobile should be of 10 digits');
      }
      if (!RegExp(r"[0-9]{10}").hasMatch(mobile)) {
        return sink.addError('Entaer a valid mobile');
      } else {
        sink.add(mobile);
      }
  });

  // password validator
  var passwordValidator =
    StreamTransformer<String, String>.fromHandlers(handleData: (password, sink) {
      if (password.isEmpty) {
        return sink.addError('Field can not be empty');
      }
      if (password.length > 10) {
        return sink.addError('password should be of 10 digits');
      }
      if (password.length < 6) {
        return sink.addError('Mobile should be of 6 digits');
      }
      if (!RegExp(r"^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,}$").hasMatch(password)) {
        return sink.addError('Entaer a valid password');
      } else {
        sink.add(password);
      }
  });
}
