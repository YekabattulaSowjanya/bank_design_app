import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../custom_class/text_field_custom.dart';
import '../provider/user_detailed_register_provider.dart';
import '../sqlite/helper.dart';
import '../sqlite/user_model.dart';
import 'login_screen.dart';

class RegisterPage extends StatelessWidget {
  RegisterPage({Key? key}) : super(key: key);

  final fullNameController = TextEditingController();
  final bankAccountController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  bool isValidEmail(String value) {
    String pattern = r'\b[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Z|a-z]{2,}\b';
    RegExp regExp = RegExp(pattern);
    return regExp.hasMatch(value);
  }

  bool _isValidPassword(String password) {
    RegExp passwordRegExp = RegExp(
        r'^(?=.*[A-Z])(?=.*[a-z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{6,}$');
    return passwordRegExp.hasMatch(password);
  }

  final _formKey = GlobalKey<FormState>();

  void _showConfirmationDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Confirmation'),
          content: const Text('Do you want to proceed with the sign-up?'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
                _navigateToLoginPage(context);
              },
              child: const Text('Yes'),
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('No'),
            ),
          ],
        );
      },
    );
  }

  void _navigateToLoginPage(BuildContext context) {
    Navigator.push(
      context,
      PageRouteBuilder(
        transitionDuration: const Duration(milliseconds: 500),
        pageBuilder: (context, animation, secondaryAnimation) {
          return SlideTransition(
            position: Tween<Offset>(
              begin: const Offset(1, 0),
              end: Offset.zero,
            ).animate(animation),
            child: LogInPage(),
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Color primaryColor = Theme.of(context).primaryColor;
    Color accentColor = Theme.of(context).accentColor;
    Color secondaryHeaderColor = Theme.of(context).secondaryHeaderColor;
    return Scaffold(
        body: SingleChildScrollView(
            child: Column(children: [
      Container(
          padding:
              const EdgeInsets.only(left: 20, right: 20, top: 50, bottom: 20),
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            boxShadow: const [
              BoxShadow(
                blurRadius: 4,
                color: Colors.grey,
              )
            ],
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                primaryColor,
                const Color(0xff0f4c82)
              ], //3577b8, Color(0xff2b659e)
            ),
            // color: primaryColor,
          ),
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Icon(
                  Icons.account_balance_outlined,
                  color: Colors.white,
                  size: 90,
                ),
                Icon(
                  Icons.link_sharp,
                  color: Colors.white,
                  size: 90,
                ),
                Icon(
                  Icons.phone_android,
                  color: Colors.white,
                  size: 90,
                ),
              ],
            ),
            const SizedBox(
              height: 8,
            ),
            const Text(
              'Connect to your bank account',
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
          ])),
      Padding(
        padding: const EdgeInsets.only(right: 45, left: 45, top: 40),
        child: Form(
          key: _formKey,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CustomTextFormField(
                key: const Key('full_name_key'),
                controller: fullNameController,
                keyboardType: TextInputType.name,
                onChanged: (value) {},
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Please enter your name";
                  }
                  return null;
                },
                hintText: 'Your Name',
                labelText: 'Your Name',
              ),
              CustomTextFormField(
                key: const Key('bank_account_key'),
                controller: bankAccountController,
                keyboardType: TextInputType.text,
                onChanged: (value) {},
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Please enter your bank account";
                  }
                  return null;
                },
                hintText: 'Bank Account',
                labelText: 'Bank Account',
              ),
              CustomTextFormField(
                key: const Key('email_key'),
                controller: emailController,
                onChanged: (value) {},
                keyboardType: TextInputType.emailAddress,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Email is empty";
                  } else if (!isValidEmail(value)) {
                    return "Email is not valid";
                  }
                  return null;
                },
                hintText: 'Email',
                labelText: 'Email',
              ),
              Consumer<RegisterUserProvider>(
                  builder: (context, passwordVisibleProvider, _) {
                return CustomTextFormField(
                  key: const Key('password_key'),
                  controller: passwordController,
                  obscureText: !passwordVisibleProvider.passwordVisible, //true,
                  onChanged: (value) {},
                  keyboardType: TextInputType.visiblePassword,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Password is empty";
                    } else if (!passwordVisibleProvider.passwordVisible &&
                        !_isValidPassword(value)) {
                      return "password is not valid";
                    }
                    return null;
                  },
                  hintText: 'Password',
                  labelText: 'Password',

                  suffixIcon: IconButton(
                    icon: Icon(
                      passwordVisibleProvider.passwordVisible
                          ? Icons.visibility
                          : Icons.visibility_off,
                    ),
                    onPressed: () {
                      print('Eye icon pressed');
                      passwordVisibleProvider.togglePasswordVisibility();
                    },
                  ),
                );
              }),
              Text(
                'Use 6 characters with a mix of letters, numbers & symbols',
                style: TextStyle(color: secondaryHeaderColor, fontSize: 18),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 27.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  textBaseline: TextBaseline.alphabetic,
                  children: [
                    Consumer<RegisterUserProvider>(
                        builder: (context, registerUserProvider, child) {
                      return GestureDetector(
                        onTap: () {
                          registerUserProvider.toggleCheckBox();
                        },
                        child: Icon(
                          registerUserProvider.isCheckBoxChecked
                              ? Icons.check_box
                              : Icons.check_box_outline_blank_sharp,
                          color: registerUserProvider.isCheckBoxChecked
                              ? primaryColor
                              : Colors.black54,
                          size: 42,
                        ),
                      );
                    }),
                    const SizedBox(
                      width: 3,
                    ),
                    const Flexible(
                      child: Text(
                        'By signing up, you agree to Bank\'s Term of Use & Privacy Policy',
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(fontSize: 17),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 27, bottom: 30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Consumer<RegisterUserProvider>(
                        builder: (context, registerUserProvider, child) {
                      return ElevatedButton(
                          key: const Key('sign_up_key'),
                          onPressed: () async {
                            if (registerUserProvider.isButtonEnabled) {
                              if (_formKey.currentState!.validate() == true) {
                                String yourName = fullNameController.text;
                                String email = emailController.text;
                                String password = passwordController.text;
                                String bankAccount = bankAccountController.text;

                                User user = User(
                                  yourName: yourName,
                                  email: email,
                                  password: password,
                                  bankAccount: bankAccount,
                                );

                                DatabaseHelper databaseHelper =
                                    DatabaseHelper();
                                int? id = await databaseHelper.insertUser(user);

                                User? newUser = await databaseHelper
                                    .getUserByEmail(email, password);

                                debugPrint(
                                    'User inserted with ID: $id $yourName $email');

                                if (newUser != null) {
                                  debugPrint(
                                      'User retrieved: $id ${newUser.yourName} ${newUser.email}');

                                  print("Registration successful");

                                  _showConfirmationDialog(context);
                                } else {
                                  print('not successs');
                                }
                              }
                            } else {
                              print("Registration unsuccessful");
                            }
                          },
                          style: ElevatedButton.styleFrom(
                            minimumSize: const Size(60, 30),
                            elevation: 5,
                            backgroundColor:
                                registerUserProvider.isCheckBoxChecked
                                    ? primaryColor
                                    : Colors.grey,
                          ),
                          child: const Padding(
                            padding: EdgeInsets.only(left: 20, right: 20),
                            child: Text(
                              'SIGN UP',
                              style: TextStyle(),
                            ),
                          ));
                    }),
                    const Text(
                      'or',
                      style: TextStyle(fontSize: 20),
                    ),
                    OutlinedButton(
                        style: OutlinedButton.styleFrom(
                            minimumSize: const Size(60, 30),
                            side: BorderSide(color: primaryColor, width: 2)),
                        //elevation: MaterialStateProperty.all(1),

                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: Padding(
                          padding: const EdgeInsets.only(left: 20, right: 20),
                          child: Text(
                            'CANCEL',
                            style: TextStyle(color: primaryColor),
                          ),
                        ))
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Already signed up?",
                    style: TextStyle(fontSize: 18.0),
                  ),
                  const SizedBox(
                    width: 3,
                  ),
                  Container(
                    decoration: BoxDecoration(
                        border: Border(
                            bottom: BorderSide(
                      color: accentColor,
                      width: 1.5, // Underline thickness
                    ))),
                    padding: const EdgeInsets.only(bottom: 2),
                    child: GestureDetector(
                      key: const Key('log_in_key'),
                      onTap: () {
                        Navigator.push(
                          context,
                          PageRouteBuilder(
                            transitionDuration:
                                const Duration(milliseconds: 500),
                            pageBuilder:
                                (context, animation, secondaryAnimation) {
                              return SlideTransition(
                                position: Tween<Offset>(
                                  begin: const Offset(1, 0),
                                  end: Offset.zero,
                                ).animate(animation),
                                child: LogInPage(),
                              );
                            },
                          ),
                        );
                      },
                      child: Text(
                        "Log in",
                        style: TextStyle(
                          fontSize: 18.0,
                          color: accentColor,
                          decorationThickness: 3,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      )
    ])));
  }
}
