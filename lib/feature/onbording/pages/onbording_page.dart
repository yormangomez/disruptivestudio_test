import 'package:disruptivestudio_test/feature/auth/page/auth_page.dart';
import 'package:disruptivestudio_test/feature/home/page/home_page.dart';
import 'package:flutter/material.dart';

class OnbordingPage extends StatefulWidget {
  const OnbordingPage({Key? key}) : super(key: key);

  @override
  OnbordingPageState createState() => OnbordingPageState();
}

class OnbordingPageState extends State<OnbordingPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: getToken(),
        builder: ((context, snapshot) {
          if (!snapshot.hasData) {
            return const Text('Espera');
          }
          if (snapshot.data == '') {
            return const AuthPage();
          } else {
            return const HomePage();
          }
        }),
      ),
    );
  }
}

Future<String> getToken() async {
  String token = '';
  return token;
}
