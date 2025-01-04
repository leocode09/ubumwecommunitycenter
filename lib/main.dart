import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:go_router/go_router.dart';
import 'router/router.dart';
import 'topbar.dart';
import 'footer.dart';
import 'package:flutter_web_plugins/flutter_web_plugins.dart';

void main() {
  // Set URL strategy before running app
  setUrlStrategy(PathUrlStrategy());

  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'Ubumwe Community Center',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFFf4cf58),
          primary: const Color(0xFF283734),
          secondary: const Color(0xFFFFD966),
          tertiary: const Color(0xFF00A884),
        ),
        textTheme: GoogleFonts.poppinsTextTheme(),
        useMaterial3: true,
      ),
      routerConfig: router,
    );
  }
}

class MainLayout extends StatelessWidget {
  final Widget child;

  const MainLayout({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(131),
        child: TopBar(
          currentPath: GoRouterState.of(context).uri.path,
        ),
      ),
      body: SingleChildScrollView(
        key: ValueKey(GoRouterState.of(context).uri.path),
        child: Column(
          children: [
            Container(
              color: Theme.of(context).colorScheme.primary,
              child: child,
            ),
            const Footer(),
          ],
        ),
      ),
    );
  }
}
