import 'package:bank_ui_design/screens/home_page.dart';
import 'package:bank_ui_design/log_in/register_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../provider/user_detailed_register_provider.dart';
import '../sqlite/helper.dart';
import '../sqlite/user_model.dart';

class LogInPage extends StatelessWidget {
  LogInPage({Key? key}) : super(key: key);

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  Future<void> _loginUser(
      String email, String password, BuildContext context) async {
    DatabaseHelper databaseHelper = DatabaseHelper();
    User? user = await databaseHelper.getUserByEmail(email, password);

    if (user == null || user.password != password) {
      /// Show an error dialog if the email and password do not match.
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            elevation: 20,
            title: const Text('Login Failed'),
            content: const Text('Invalid user credentials'),
            actions: <Widget>[
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                style: ElevatedButton.styleFrom(
                    elevation: 7, backgroundColor: const Color(0xff1d3f77)),
                child: const Text('OK'),
              ),
            ],
          );
        },
      );
    } else {
      /// Navigate to the home screen if the login is successful.
      Navigator.pushReplacement(
        context,
        PageRouteBuilder(
          transitionDuration: const Duration(milliseconds: 700),
          pageBuilder: (context, animation, secondaryAnimation) {
            const begin = Offset(-1.0, 0.0); // Animation starts from left
            const end = Offset.zero;
            const curve = Curves.easeInOut;

            var tween =
                Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
            var offsetAnimation = animation.drive(tween);

            return SlideTransition(
              position: offsetAnimation,
              child: HomePage(user: user),
            );
          },
        ),
      );
    }
  }

  Future<void> _showForgotPasswordDialog(BuildContext context) async {
    TextEditingController emailEditingController = TextEditingController();
    TextEditingController newPasswordController = TextEditingController();

    await showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Forgot Password'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text('Enter your registered email and new password:'),
              const SizedBox(height: 10),
              TextFormField(
                controller: emailEditingController,
                keyboardType: TextInputType.emailAddress,
                decoration: const InputDecoration(
                  hintText: 'Email',
                ),
              ),
              const SizedBox(height: 10),
              TextFormField(
                controller: newPasswordController,
                obscureText: true,
                decoration: const InputDecoration(
                  hintText: 'New Password',
                ),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Cancel'),
            ),
            ElevatedButton(
              onPressed: () async {
                String email = emailEditingController.text;
                String newPassword = newPasswordController.text;

                /// Update the user's password in the database
                await DatabaseHelper.instance.updatePasswordByEmail(
                  email,
                  newPassword,
                );
                Navigator.pop(context);
              },
              child: const Text('Reset Password'),
            ),
          ],
        );
      },
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
            const EdgeInsets.only(left: 20, right: 20, top: 90, bottom: 20),
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
              const Color(0xff0f5fa1)
            ], //3577b8, Color(0xff2b659e)
          ),
          //color: primaryColor,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Text(
              "WELCOME!",
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.normal,
                  fontSize: 30),
            ),
            Padding(
              padding: EdgeInsets.only(top: 40, bottom: 20),
              child: Icon(
                Icons.account_balance_outlined,
                size: 190,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
      const SizedBox(
        height: 10,
      ),
      Padding(
        padding: const EdgeInsets.only(right: 40, left: 40, top: 40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextFormField(
              key: const Key("email_key"),
              controller: emailController,
              keyboardType: TextInputType.emailAddress,
              onChanged: (value) {},
              autocorrect: true,
              //textAlign: TextAlign.center,
              decoration: InputDecoration(
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: primaryColor, width: 1.5),
                  borderRadius: BorderRadius.circular(6.0),
                ),
                enabledBorder: OutlineInputBorder(
                    borderSide:
                        const BorderSide(width: 1.3, color: Colors.black),
                    borderRadius: BorderRadius.circular(6.0)),
                contentPadding:
                    const EdgeInsets.symmetric(vertical: 17, horizontal: 16),
                hintText: 'Username or Email',
                labelText: 'Username or Email',
                alignLabelWithHint: true,
              ),
            ),
            Consumer<RegisterUserProvider>(
                builder: (context, passwordVisibleProvider, _) {
              return Padding(
                padding: const EdgeInsets.only(top: 15, bottom: 14),
                child: TextFormField(
                  key: const Key('password_key'),
                  controller: passwordController,
                  obscureText: !passwordVisibleProvider.passwordVisible,
                  keyboardType: TextInputType.visiblePassword,
                  //textAlign: TextAlign.center,
                  onChanged: (value) {},
                  decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: primaryColor, width: 1.5),
                      borderRadius: BorderRadius.circular(6.0),
                    ),
                    enabledBorder: OutlineInputBorder(
                        borderSide:
                            const BorderSide(width: 1.3, color: Colors.black),
                        borderRadius: BorderRadius.circular(6.0)),
                    contentPadding: const EdgeInsets.symmetric(
                        vertical: 17, horizontal: 16),
                    hintText: 'Password',
                    labelText: 'Password',
                    alignLabelWithHint: true,
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
                  ),
                  // style: TextStyle(fontSize: 30),
                ),
              );
            }),
            ElevatedButton(
              key: const Key('login_button_key'),
                onPressed: () async {
                  String email = '';
                  String password = '';

                  email = emailController.text;
                  password = passwordController.text;

                  await _loginUser(email, password, context);
                },
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(60, 30),
                  elevation: 5,
                  backgroundColor: primaryColor,
                ),
                child: const Padding(
                  padding: EdgeInsets.only(left: 20, right: 20),
                  child: Text(
                    'LOG IN',
                    style: TextStyle(),
                  ),
                )),
            GestureDetector(
              key: const Key('forgot_password_key'),
              onTap: () async {
                await _showForgotPasswordDialog(context);
              },
              child: Container(
                decoration: BoxDecoration(
                    border: Border(
                        bottom: BorderSide(
                  color: accentColor,
                  width: 1.5, // Underline thickness
                ))),
                padding: const EdgeInsets.only(top: 40, bottom: 2),
                margin: const EdgeInsets.only(bottom: 10),
                child: Text(
                  'Forgot Password?',
                  style: TextStyle(
                    color: accentColor,
                    fontSize: 18,
                    decorationThickness: 3,
                  ),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "New to the Bank Apps?",
                  style: TextStyle(fontSize: 18.0),
                ),
                const SizedBox(
                  width: 10,
                ),
                Container(
                  decoration: BoxDecoration(
                      border: Border(
                          bottom: BorderSide(
                    color: accentColor,
                    width: 1.5,
                  ))),
                  padding: const EdgeInsets.only(bottom: 2),
                  child: GestureDetector(
                    key: const Key('sign_up_key'),
                    onTap: () {
                      Navigator.push(
                        context,
                        PageRouteBuilder(
                          transitionDuration: const Duration(milliseconds: 500),
                          pageBuilder:
                              (context, animation, secondaryAnimation) {
                            return SlideTransition(
                              position: Tween<Offset>(
                                begin: const Offset(1, 0),
                                end: Offset.zero,
                              ).animate(animation),
                              child: RegisterPage(),
                            );
                          },
                        ),
                      );
                    },
                    child: Text(
                      "Sign Up",
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
      )
    ])));
  }
}
