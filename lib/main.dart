import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:go_router/go_router.dart';
import 'router/router.dart';
import 'topbar.dart';
import 'footer.dart';
import 'sidebar.dart';
import 'package:flutter_web_plugins/flutter_web_plugins.dart';


void main() {
  usePathUrlStrategy();
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
        fontFamily: 'sans-serif',
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFFFFD700),
          primary: const Color(0xFF212D2B),
          secondary: const Color(0xFFFFD700),
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
    final isDesktop = MediaQuery.of(context).size.width >= 1024;
    final currentPath = GoRouterState.of(context).uri.path;

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primary,
      drawer: isDesktop ? null : Sidebar(currentPath: currentPath),
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(isDesktop ? 131 : 56),
        child: TopBar(currentPath: currentPath),
      ),
      body: SingleChildScrollView(
        key: ValueKey(currentPath),
        child: Column(
          children: [
            Container(
              constraints: BoxConstraints(
                minHeight: MediaQuery.of(context).size.height,
              ),
              child: child,
            ),
            const Footer(),
          ],
        ),
      ),
    );
  }
}
