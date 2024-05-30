import 'package:flutter/cupertino.dart';

class RegisterUserProvider with ChangeNotifier{

  bool _passwordVisible = false;

  bool get passwordVisible => _passwordVisible;

  void togglePasswordVisibility() {
    print('Toggling password visibility');
    _passwordVisible = !_passwordVisible;
    notifyListeners();
  }


  bool isCheckBoxChecked = false;
  bool isButtonEnabled = false;

  void toggleCheckBox() {
    isCheckBoxChecked = !isCheckBoxChecked;
    isButtonEnabled = isCheckBoxChecked;
    notifyListeners();
  }

}