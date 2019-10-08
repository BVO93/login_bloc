import 'dart:async';
import 'validators.dart';

// if extedn is needed extending Objet (which is bas bae class of dart) always works
class Bloc extends Object with Validators {
  final _email = StreamController<String>();
  final _password = StreamController<String>();

  // add data to the stream
  Stream<String> get email => _email.stream.transform(validateEmail);
  Stream<String> get password => _password.stream.transform(validataPassword);

// change data
  Function(String) get changeEmail => _email.sink.add;
  Function(String) get changePassword => _password.sink.add;


//clean sinks 
// Dart always wants a mehode where we clean sinks
dispose(){
  _email.close();
  _password.close();
}

}
