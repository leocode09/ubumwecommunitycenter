import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'dart:ui';

class Footer extends StatelessWidget {
  const Footer({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(vertical: 20.0),
          color: const Color.fromARGB(255, 255, 217, 79),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
                    // Partners/Sponsors Row

                  // Logo and Text
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Image.asset('assets/logo.png', height: 80),
                          const SizedBox(height: 20),
                          const SizedBox(
                            width: 300,
                            child: Text(
                              'Never doubt that a small group of thoughtful, committed citizens can change the world.',
                              style: TextStyle(
                                color: Colors.white70,
                                fontSize: 16,
                              ),
                            ),
                          ),
                          const SizedBox(height: 20),
                          ElevatedButton.icon(
                            onPressed: () {},
                            icon: const Icon(Icons.favorite, size: 16),
                            label: const Text('DONATE NOW'),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xFFFFD84F),
                              foregroundColor: Colors.black,
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 24, vertical: 12),
                            ),
                          ),
                        ],
                      ),
                      // Contact Information
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Contact',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 20),
                          TextButton.icon(
                            onPressed: () {},
                            icon: const Icon(Icons.email,
                                color: Color(0xFFFFD84F)),
                            label: const Text(
                              'info@ubumwecommunitycenter.rw',
                              style: TextStyle(color: Colors.white70),
                            ),
                          ),
                          TextButton.icon(
                            onPressed: () {},
                            icon: const Icon(Icons.phone,
                                color: Color(0xFFFFD84F)),
                            label: const Text(
                              '+250 788 652 294',
                              style: TextStyle(color: Colors.white70),
                            ),
                          ),
                          TextButton.icon(
                            onPressed: () {},
                            icon: const Icon(Icons.phone,
                                color: Color(0xFFFFD84F)),
                            label: const Text(
                              '+1 (614) 420-0824',
                              style: TextStyle(color: Colors.white70),
                            ),
                          ),
                          const SizedBox(height: 20),
                          Row(
                            children: [
                              IconButton(
                                icon: const FaIcon(FontAwesomeIcons.facebook,
                                    color: Colors.white70),
                                onPressed: () {},
                              ),
                              IconButton(
                                icon: const FaIcon(FontAwesomeIcons.twitter,
                                    color: Colors.white70),
                                onPressed: () {},
                              ),
                              IconButton(
                                icon: const FaIcon(FontAwesomeIcons.youtube,
                                    color: Colors.white70),
                                onPressed: () {},
                              ),
                              IconButton(
                                icon: const FaIcon(FontAwesomeIcons.instagram,
                                    color: Colors.white70),
                                onPressed: () {},
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 40),
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
                    ),
                  ),
                ],
              ),),
            ),
          ),
        ),
      ],
    );
  }
}
