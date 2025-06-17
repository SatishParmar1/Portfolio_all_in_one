import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:protfoliowebsite/view/homepage.dart';
import 'package:provider/provider.dart';
import 'Controllers/skill_controller.dart';
import 'firebase_options.dart';

void main()async{
  WidgetsFlutterBinding.ensureInitialized();

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

/*  if (kIsWeb) {
    // Web needs options
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
  } else {
    // Mobile does not need options if configured via google-services.json or GoogleService-Info.plist
    await Firebase.initializeApp();
  }*/
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => Skill_controller())
          
        ],
        child: MaterialApp(
        title: 'Portfolio',
        theme: ThemeData(
            useMaterial3: true,
            fontFamily: 'Outfit',
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.grey),
          primaryColor:Colors.black,
            textButtonTheme: TextButtonThemeData(
            style: ButtonStyle(
            )
        ),
            listTileTheme: ListTileThemeData(

        ),
          scaffoldBackgroundColor: Colors.black,
            textTheme: TextTheme(

        )
        ),
        home: Homepage(),
            ),
      );
  }
}


