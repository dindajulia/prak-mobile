import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yummly_ui/firebase_options.dart';
import 'package:yummly_ui/notif.dart';
import 'package:yummly_ui/screen/home.dart';
import 'package:yummly_ui/screen/login.dart';
import 'package:firebase_core/firebase_core.dart';

import 'services/information_service.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await initializeNotif();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<InformationService>(
      create: (_) => InformationService(),
      child: MaterialApp(
        title: 'Resep Masakan',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        //home: Home();

        //untuk pindah hal (navigation)
        initialRoute: '/login',
        routes: {
          '/': (_) => Home(),
          '/login': (_) => Login(),
        },
      ),
    );
  }
}
