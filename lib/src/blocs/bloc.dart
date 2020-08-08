import "dart:async";
import 'validators.dart';
import "package:rxdart/rxdart.dart";

class Bloc extends Validators {
  final _email = BehaviorSubject<String>();
  final _password = BehaviorSubject<String>();

  //Add to stream
  Stream<String> get email => _email.stream.transform(validateEmail);
  Stream<String> get password => _password.stream.transform(validatePassword);
  Stream<bool> get submitValid =>
      Rx.combineLatest2(email, password, (e, p) => true);

  //Get from stream
  Function(String) get changeEmail => _email.sink.add;
  Function(String) get changePassword => _password.sink.add;

  submit() {
    String validEmail = _email.value;
    String validPassword = _password.value;

    print("Password is $validPassword");
    print("Email is $validEmail");
  }

  dispose() {
    _email.close();
    _password.close();
  }
}
//Singleton Method
// final bloc = Bloc();
