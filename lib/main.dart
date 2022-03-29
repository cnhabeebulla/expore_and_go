import 'package:explore_and_go_application/Screens/Welcome/welcome_screen.dart';
import 'package:explore_and_go_application/functions/google_sign_in.dart';
import 'package:explore_and_go_application/home_screen/home_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: const FirebaseOptions(
        apiKey: "AIzaSyATWJgBjfb7tsK6PG9Am2LqSlbzmI-NNfk",
        appId: "1:1063181653345:android:d27e4274f3ccefbcb16120",
        messagingSenderId:
            "1063181653345-nq11bh75hjq2s4nifu4kekngjor4huqq.apps.googleusercontent.com",
        projectId: "explore-and-go-project"),
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);
    return ChangeNotifierProvider(
      create: (context) => GoogleSignInMethod(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "Explore & GO",
        home: SafeArea(
          child: StreamBuilder(
              stream: FirebaseAuth.instance.authStateChanges(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (snapshot.hasData) {
                  return const HomeScreen();
                } else {
                  return const WelcomeScreen();
                }
              }),
        ),
      ),
    );
  }
}
