import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:portfolio/model/app_routes.dart';
import 'package:provider/provider.dart';
import 'Controllers/contact_controller.dart';
import 'Controllers/contactformcontroller.dart';
import 'Controllers/education_controller.dart';
import 'Controllers/experience_controller.dart';
import 'Controllers/mywork_controller.dart';
import 'Controllers/skill_controller.dart';
import 'firebase_options.dart';

void main()async{
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const MyApp());
}
  final GoRouter _router = GoRouter(
    routes: appRoutes
  );


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => Skill_controller()),
          ChangeNotifierProvider(create: (_) => MyworkController()),
          ChangeNotifierProvider(create: (_) => Contact_controller()),
          ChangeNotifierProvider(create: (_) => Experience_Controller()),
          ChangeNotifierProvider(create: (_) => Education_controller()),
          ChangeNotifierProvider(create: (_) => Contactformcontroller()),

        ],
        child: MaterialApp.router(
          routerConfig: _router,
          debugShowCheckedModeBanner: false,
        title: 'Who is Satish?',
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

            ),
      );
  }
}


