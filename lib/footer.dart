import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'dart:ui';
import 'package:url_launcher/url_launcher.dart';
import 'dart:async';

extension IntModulo on int {
  int modulo(int n) => ((this % n) + n) % n;
}

class Footer extends StatefulWidget {
  const Footer({super.key});

  @override
  State<Footer> createState() => _FooterState();
}

class _FooterState extends State<Footer> {
  final ScrollController _scrollController = ScrollController();
  Timer? _timer;

  final List<String> _partnerLogos = const [
    'assets/partners/better.png',
    'assets/partners/camphillnorth.png',
    'assets/partners/cbb.png',
    'assets/partners/hcs.png',
    'assets/partners/hope.png',
    'assets/partners/zoo.png',
    'assets/partners/partners.png',
    'assets/partners/point_foundation.png',
    'assets/partners/rotary_international.png',
    'assets/partners/rwanda_gov.png',
    'assets/partners/ssu.png',
    'assets/partners/yara.png',
  ];

  @override
  void initState() {
    super.initState();
    _startAutoScroll();
  }

  @override
  void dispose() {
    _timer?.cancel();
    _scrollController.dispose();
    super.dispose();
  }

  void _startAutoScroll() {
    const duration = Duration(seconds: 3);
    _timer = Timer.periodic(duration, (timer) {
      if (_scrollController.hasClients) {
        final currentPosition = _scrollController.offset;
        final screenWidth = _scrollController.position.viewportDimension;
        final itemWidth = screenWidth / (MediaQuery.of(context).size.width < 800 ? 2 : 4);
        
        final nextPosition = currentPosition + itemWidth;
        
        if (nextPosition >= _scrollController.position.maxScrollExtent) {
          _scrollController.animateTo(
            0,
            duration: const Duration(milliseconds: 500),
            curve: Curves.easeInOut,
          );
        } else {
          _scrollController.animateTo(
            nextPosition,
            duration: const Duration(milliseconds: 500),
            curve: Curves.easeInOut,
          );
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Column(
          children: [
            Container(
              width: double.infinity,
              height: 120,
              padding: const EdgeInsets.symmetric(vertical: 20.0),
              color: const Color.fromARGB(255, 255, 217, 79),
              child: ShaderMask(
                shaderCallback: (Rect bounds) {
                  return LinearGradient(
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                    colors: [
                      Colors.white,
                      Colors.white.withOpacity(0.02),
                    ],
                    stops: const [0.95, 1.0],
                  ).createShader(bounds);
                },
                blendMode: BlendMode.dstIn,
                child: LayoutBuilder(
                  builder: (context, constraints) {
                    final isMobile = constraints.maxWidth < 800;
                    final itemsPerScreen = isMobile ? 2 : 4; // Show 4 items on desktop
                    return ListView.builder(
                      controller: _scrollController,
                      scrollDirection: Axis.horizontal,
                      itemCount: _partnerLogos.length * 2,
                      itemBuilder: (context, index) {
                        final actualIndex = index % _partnerLogos.length;
                        return Container(
                          width: constraints.maxWidth / itemsPerScreen,
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Opacity(
                            opacity: 0.7,
                            child: Image.asset(
                              _partnerLogos[actualIndex],
                              height: 60,
                              fit: BoxFit.contain,
                              errorBuilder: (context, error, stackTrace) {
                                debugPrint('Error loading image: ${_partnerLogos[actualIndex]} - $error');
                                return const Center(
                                  child: Icon(Icons.broken_image, color: Colors.red, size: 30),
                                );
                              },
                            ),
                          ),
                        );
                      },
                    );
                  },
                ),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: const AssetImage('assets/site-footer-bg.jpg'),
                  fit: BoxFit.cover,
                  opacity: 0.6,
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
                          child: constraints.maxWidth < 800
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
        onPressed: () => launchContact('info@uccenter.online', true),
        icon: const Icon(Icons.email, color: Color(0xFFFFD84F)),
        label: const Text(
          'info@uccenter.online',
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
    Future<void> launchSocialMedia(String url) async {
      if (!await launchUrl(Uri.parse(url))) {
        debugPrint('Could not launch $url');
      }
    }

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButton(
          iconSize: isMobile ? 24 : 20,
          padding: EdgeInsets.all(isMobile ? 12 : 8),
          icon: const FaIcon(FontAwesomeIcons.facebook, color: Colors.white70),
          onPressed: () => launchSocialMedia('https://www.facebook.com/UbumweCommunityCenter'),
        ),
        IconButton(
          iconSize: isMobile ? 24 : 20,
          padding: EdgeInsets.all(isMobile ? 12 : 8),
          icon: const FaIcon(FontAwesomeIcons.twitter, color: Colors.white70),
          onPressed: () => launchSocialMedia('https://x.com/UbumweCommunity'),
        ),
        IconButton(
          iconSize: isMobile ? 24 : 20,
          padding: EdgeInsets.all(isMobile ? 12 : 8),
          icon: const FaIcon(FontAwesomeIcons.youtube, color: Colors.white70),
          onPressed: () => launchSocialMedia('https://www.youtube.com/@ubumwecommunitycentertv'),
        ),
        IconButton(
          iconSize: isMobile ? 24 : 20,
          padding: EdgeInsets.all(isMobile ? 12 : 8),
          icon: const FaIcon(FontAwesomeIcons.instagram, color: Colors.white70),
          onPressed: () => launchSocialMedia('https://www.instagram.com/ubumwecommunitycenter'),
        ),
      ],
    );
  }
}
