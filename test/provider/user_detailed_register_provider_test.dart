
import 'package:bank_ui_design/provider/user_detailed_register_provider.dart';
import 'package:flutter_test/flutter_test.dart';

void main(){

  test('test register user provider to find check box', () async{

    final registerUserProvider= RegisterUserProvider();
    expect(registerUserProvider.isCheckBoxChecked, false);
  });

  test('test register user provider to find toggle check box', () async{

    final registerUserProvider= RegisterUserProvider();
    registerUserProvider.toggleCheckBox();
    expect(registerUserProvider.isCheckBoxChecked, true);
    expect(registerUserProvider.isButtonEnabled, true);
  });


  test('test register user provider to find password visible', () async{

    final registerUserProvider= RegisterUserProvider();
    expect(registerUserProvider.passwordVisible, false);
  });

  test('test register user provider to find toggle password', () async{

    final registerUserProvider= RegisterUserProvider();
    registerUserProvider.togglePasswordVisibility();
    expect(registerUserProvider.passwordVisible, true);

    registerUserProvider.togglePasswordVisibility();
    expect(registerUserProvider.passwordVisible, false);
  });

}