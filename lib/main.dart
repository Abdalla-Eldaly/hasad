import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hased/company/login_company/signin_company.dart';
import 'package:hased/const/color.dart';
import 'package:hased/pages/select.dart';
import 'package:hased/splash/splash_screen.dart';
import 'package:hased/utils/color_schemes.g.dart';
import 'package:hased/widget/curved_nav_bar.dart';
import '../screen/home_farmer.dart';
import 'package:provider/provider.dart';
import 'company/login_company/login_company.dart';
import 'company/login_company/register_company.dart';
import 'company/nav_bar.dart';
import 'company/pages/verified.dart';
import 'login_farmer/login_screen.dart';
import 'login_farmer/register_screen.dart';
import 'login_farmer/sign_screen.dart';
import 'moduls/localization_service.dart';
import 'moduls/myProvider.dart';
import 'moduls/themeProvider.dart';
import 'package:get/get.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(
        create: (context) => MyProvider(),
      ),
      ChangeNotifierProvider(
        create: (context) => ThemeProvider(),
      ),
    ],
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final localizationController = Get.put(LocalizationController());

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: localizationController,
      builder: (LocalizationController controller) {
        return Consumer<ThemeProvider>(
          builder: (ctx, value, child) {
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              localeResolutionCallback:
                  LocalizationService.localeResolutionCallBack,
              localizationsDelegates: LocalizationService.localizationsDelegate,
              supportedLocales: LocalizationService.supportedLocales,
              locale: controller.currentLanguage != ''
                  ? Locale(controller.currentLanguage, '')
                  : const Locale('ar'),
              title: 'Flutter Demo',
              theme: ThemeData(
                scaffoldBackgroundColor: backgroundColor,
                colorScheme: lightColorScheme,
                useMaterial3: true,
                appBarTheme: AppBarTheme(
                  systemOverlayStyle: SystemUiOverlayStyle(
                      statusBarColor: Theme.of(context).colorScheme.onPrimary,
                      statusBarIconBrightness: Brightness.dark),
                  shadowColor: Colors.grey,
                  backgroundColor: Theme.of(context).colorScheme.onPrimary,
                  titleTextStyle: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 17,
                    color: Theme.of(context).colorScheme.scrim,
                  ),
                ),
              ),
              darkTheme: ThemeData(
                colorScheme: darkColorScheme,
                useMaterial3: true,
                //textTheme: textTheme,
              ),
              themeMode: value.darkTheme ? ThemeMode.light : ThemeMode.dark,
              home: const SplashScreen(),
              routes: {
                '/home': (ctx)=> const HomeFarmer(),
                '/signIn': (ctx)=> const SignIn(),
                '/login': (ctx)=> const Login(),
                '/register': (ctx)=> const Register(),
                '/registerCompany': (ctx)=> const RegisterCompany(),
                '/navBar': (ctx)=> const CurvedNavBar(),
                '/navBarComp': (ctx)=> const CurvedNavBarCompany(),
                '/selected': (ctx)=> const SelectedItem(),
                '/verified': (ctx)=> const VerifiedScreen(),
                '/loginComp': (ctx)=> const LoginCompany(),
                '/signInComp': (ctx)=> const SignInCompany(),
              },
            );
          },
        );
      },
    );
  }
}
