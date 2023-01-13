import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'Presentation/screen/loginscreen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: "open_sans_regular",
        inputDecorationTheme: const InputDecorationTheme(
          isDense: true,
        ),
      ),
      debugShowCheckedModeBanner: false,
      home: LoginScreen(),
    );
  }
}
