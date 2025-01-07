import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'dart:ui';
import 'package:url_launcher/url_launcher.dart';

class Footer extends StatelessWidget {
  const Footer({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final isMobile = constraints.maxWidth < 800; // Breakpoint for mobile

        return Column(
          children: [
            // Partner logos container
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(vertical: 20.0),
              color: const Color.fromARGB(255, 255, 217, 79),
              child: Wrap( // Changed from Row to Wrap
                alignment: WrapAlignment.spaceEvenly,
                spacing: 20,
                runSpacing: 20,
                children: [
                  Image.asset('assets/hcs.png', height: 60),
                  Image.asset('assets/better.png', height: 60),
                  Image.asset('assets/camphillnorth.png', height: 60),
                  Image.asset('assets/cbb.png', height: 60),
                  Image.asset('assets/hope.png', height: 60),
                  Image.asset('assets/zoo.png', height: 60),
                ],
              ),
            ),
            Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: const AssetImage('assets/site-footer-bg.jpg'),
                  fit: BoxFit.cover,
                  opacity: 0.9,
                  colorFilter: ColorFilter.mode(
                    Theme.of(context).primaryColor.withOpacity(0.9),
                    BlendMode.multiply,
                  ),
                ),
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    const Color(0xFFFFD84F).withOpacity(0.1),
                    const Color(0xFFFFD84F).withOpacity(0.1),
                  ],
                ),
              ),
              child: ClipRect(
                // Add ClipRect to contain the blur effect
                child: BackdropFilter(
                  filter: ImageFilter.blur(
                    sigmaX: 3.0,
                    sigmaY: 3.0,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(top: 30.0),
                    child: Column(
                      children: [
                        // Main content area
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: isMobile
                              ? Column( // Mobile layout
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    _buildLogoSection(),
                                    const SizedBox(height: 40),
                                    _buildContactSection(),
                                  ],
                                )
                              : Row( // Desktop layout (unchanged)
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    _buildLogoSection(),
                                    _buildContactSection(),
                                  ],
                                ),
                        ),
                        const SizedBox(height: 30),
                        // Copyright Text
                        Container(
                          width: double.infinity,
                          padding: const EdgeInsets.symmetric(
                              vertical: 30, horizontal: 20),
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: Colors.black26,
                            borderRadius: BorderRadius.circular(4),
                          ),
                          child: const Text(
                            '© All Copyright 2025 by UBUMWE COMMUNITY CENTER',
                            style: TextStyle(
                              color: Colors.white70,
                              fontSize: 14,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  Widget _buildLogoSection() {
    return LayoutBuilder(
      builder: (context, constraints) {
        final isMobile = constraints.maxWidth < 800;
        return Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              'assets/logo.png',
              height: isMobile ? 60 : 80, // Smaller logo on mobile
            ),
            const SizedBox(height: 15),
            SizedBox(
              width: isMobile ? double.infinity : 300, // Full width on mobile
              child: const Text(
                'Never doubt that a small group of thoughtful, committed citizens can change the world.',
                style: TextStyle(
                  color: Colors.white70,
                  fontSize: 16,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: 15),
            ElevatedButton.icon(
              onPressed: () => context.go('/donate'),
              icon: const Icon(Icons.favorite, size: 16),
              label: const Text('DONATE NOW'),
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFFFFD84F),
                foregroundColor: Colors.black,
                padding: EdgeInsets.symmetric(
                  horizontal: isMobile ? 32 : 24,
                  vertical: isMobile ? 16 : 12,
                ),
                minimumSize: isMobile ? const Size(200, 45) : null, // Wider button on mobile
              ),
            ),
          ],
        );
      },
    );
  }

  Widget _buildContactSection() {
    return LayoutBuilder(
      builder: (context, constraints) {
        final isMobile = constraints.maxWidth < 800;
        return Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
              'Contact',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 15),
            // Contact buttons with adjusted padding and size
            ..._buildContactButtons(isMobile),
            const SizedBox(height: 15),
            // Social media icons with adjusted spacing
            _buildSocialIcons(isMobile),
          ],
        );
      },
    );
  }

  List<Widget> _buildContactButtons(bool isMobile) {
    final buttonStyle = TextButton.styleFrom(
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 16 : 8,
        vertical: isMobile ? 12 : 8,
      ),
    );

    Future<void> launchContact(String contact, bool isEmail) async {
      final uri = Uri.parse(
        isEmail ? 'mailto:$contact' : 'tel:${contact.replaceAll(RegExp(r'[^\d+]'), '')}',
      );
      
      if (!await launchUrl(uri)) {
        debugPrint('Could not launch $uri');
      }
    }

    return [
      TextButton.icon(
        style: buttonStyle,
        onPressed: () => launchContact('info@ubumwecommunitycenter.rw', true),
        icon: const Icon(Icons.email, color: Color(0xFFFFD84F)),
        label: const Text(
          'info@ubumwecommunitycenter.rw',
          style: TextStyle(color: Colors.white70),
        ),
      ),
      TextButton.icon(
        style: buttonStyle,
        onPressed: () => launchContact('+250 788 652 294', false),
        icon: const Icon(Icons.phone, color: Color(0xFFFFD84F)),
        label: const Text(
          '+250 788 652 294',
          style: TextStyle(color: Colors.white70),
        ),
      ),
      TextButton.icon(
        style: buttonStyle,
        onPressed: () => launchContact('+1 (614) 420-0824', false),
        icon: const Icon(Icons.phone, color: Color(0xFFFFD84F)),
        label: const Text(
          '+1 (614) 420-0824',
          style: TextStyle(color: Colors.white70),
        ),
      ),
    ];
  }

  Widget _buildSocialIcons(bool isMobile) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButton(
          iconSize: isMobile ? 24 : 20,
          padding: EdgeInsets.all(isMobile ? 12 : 8),
          icon: const FaIcon(FontAwesomeIcons.facebook, color: Colors.white70),
          onPressed: () {},
        ),
        IconButton(
          iconSize: isMobile ? 24 : 20,
          padding: EdgeInsets.all(isMobile ? 12 : 8),
          icon: const FaIcon(FontAwesomeIcons.twitter, color: Colors.white70),
          onPressed: () {},
        ),
        IconButton(
          iconSize: isMobile ? 24 : 20,
          padding: EdgeInsets.all(isMobile ? 12 : 8),
          icon: const FaIcon(FontAwesomeIcons.youtube, color: Colors.white70),
          onPressed: () {},
        ),
        IconButton(
          iconSize: isMobile ? 24 : 20,
          padding: EdgeInsets.all(isMobile ? 12 : 8),
          icon: const FaIcon(FontAwesomeIcons.instagram, color: Colors.white70),
          onPressed: () {},
        ),
      ],
    );
  }
}
