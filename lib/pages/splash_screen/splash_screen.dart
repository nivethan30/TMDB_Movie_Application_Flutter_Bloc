import 'package:flutter/material.dart';
import '../../utils/assets.dart';
import '../home_page/home_page.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  /// This method is called when the object is inserted into the tree.
  ///
  /// It override the [State.initState] method and is used to initialize the
  /// objects that need to be initialized when the widget is inserted in the
  /// tree.
  ///
  /// In this case, it is used to schedule a callback that will be called after
  /// a 3 seconds delay. This callback will navigate to the [HomePage].
  ///
  /// This is used to implement a splash screen that will be displayed for 3
  /// seconds before navigating to the [HomePage].
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3), () {
      _navigateToHomePage();
    });
  }

  /// This method navigates to the [HomePage] using the [Navigator.pushReplacement]
  /// method.
  ///
  /// It is used by the [initState] method to navigate to the [HomePage] after a 3
  /// seconds delay.
  void _navigateToHomePage() {
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => const HomePage()));
  }

  @override
  /// This method builds a [Scaffold] that displays a [Container] with a dark blue
  /// color and a centered [Image] of the TMDB logo.
  ///
  /// The [Container] is used to set the background color of the screen, and the
  /// [Image] is used to display the TMDB logo at the center of the screen.
  ///
  /// The [Image.asset] constructor is used to load the TMDB logo from the
  /// `assets` folder. The `Assets.tmdbLogo` constant is used to specify the
  /// location of the logo in the `assets` folder.
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: const Color.fromARGB(255, 13, 37, 63),
        child: Center(
          child: Image.asset(Assets.tmdbLogo),
        ),
      ),
    );
  }
}
