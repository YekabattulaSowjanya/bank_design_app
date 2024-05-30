import 'package:bank_ui_design/log_in/login_screen.dart';
import 'package:bank_ui_design/provider/user_detailed_register_provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (_) => RegisterUserProvider(),
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          theme: ThemeData(
            primaryColor: const Color(0xff184074), //Color(0xff0c4278),
            accentColor: const Color(0xFF18B5EA),
            secondaryHeaderColor: const Color(0xff1fcaca),
            colorScheme:
                ColorScheme.fromSwatch().copyWith(secondary: Colors.red),
          ),
          home: LogInPage(),
        ));
  }
}
