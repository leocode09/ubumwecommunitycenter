import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Footer extends StatelessWidget {
  const Footer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 40.0),
      color: const Color(0xFF283734),
      child: Column(
        children: [
          // Partners/Sponsors Row
          Container(
            padding: const EdgeInsets.symmetric(vertical: 20.0),
            color: const Color(0xFFFFD84F),
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
          const SizedBox(height: 40),
          // Logo and Text
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
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
                      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
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
                    icon: const Icon(Icons.email, color: Color(0xFFFFD84F)),
                    label: const Text(
                      'info@ubumwecommunitycenter.rw',
                      style: TextStyle(color: Colors.white70),
                    ),
                  ),
                  TextButton.icon(
                    onPressed: () {},
                    icon: const Icon(Icons.phone, color: Color(0xFFFFD84F)),
                    label: const Text(
                      '+250 788 652 294',
                      style: TextStyle(color: Colors.white70),
                    ),
                  ),
                  TextButton.icon(
                    onPressed: () {},
                    icon: const Icon(Icons.phone, color: Color(0xFFFFD84F)),
                    label: const Text(
                      '+1 (614) 420-0824',
                      style: TextStyle(color: Colors.white70),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Row(
                    children: [
                      IconButton(
                        icon: const FaIcon(FontAwesomeIcons.facebook, color: Colors.white70),
                        onPressed: () {},
                      ),
                      IconButton(
                        icon: const FaIcon(FontAwesomeIcons.twitter, color: Colors.white70),
                        onPressed: () {},
                      ),
                      IconButton(
                        icon: const FaIcon(FontAwesomeIcons.youtube, color: Colors.white70),
                        onPressed: () {},
                      ),
                      IconButton(
                        icon: const FaIcon(FontAwesomeIcons.instagram, color: Colors.white70),
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
          const Text(
            '© All Copyright 2025 by UBUMWE COMMUNITY CENTER',
            style: TextStyle(
              color: Colors.white70,
              fontSize: 14,
            ),
          ),
        ],
      ),
    );
  }
}
