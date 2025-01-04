import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../about/about.dart';
import '../contact/contact.dart';
import '../does/does.dart';
import '../home/home.dart';
import '../partners/partners.dart';
import '../tenders/tenders.dart';
import '../vision/vision.dart';
import '../main.dart';

final GlobalKey<NavigatorState> _rootNavigatorKey = GlobalKey<NavigatorState>();

final router = GoRouter(
  navigatorKey: _rootNavigatorKey,
  initialLocation: '/',
  debugLogDiagnostics: true, // Disable in production
  routes: [
    ShellRoute(
      builder: (context, state, child) {
        return MainLayout(child: child);
      },
      routes: [
        GoRoute(
          path: '/',
          name: 'home',
          builder: (context, state) => const HomeContent(),
        ),
        GoRoute(
          path: '/about',
          name: 'about',
          builder: (context, state) => const AboutContent(),
        ),
        GoRoute(
          path: '/vision',
          name: 'vision',
          builder: (context, state) => const VisionContent(),
        ),
        GoRoute(
          path: '/does',
          name: 'does',
          builder: (context, state) => const DoesContent(),
        ),
        GoRoute(
          path: '/partners',
          name: 'partners',
          builder: (context, state) => const PartnersContent(),
        ),
        GoRoute(
          path: '/contact',
          name: 'contact',
          builder: (context, state) => const ContactContent(),
        ),
        GoRoute(
          path: '/tenders',
          name: 'tenders',
          builder: (context, state) => const TendersContent(),
        ),
      ],
    ),
  ],
); 