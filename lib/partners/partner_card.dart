import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PartnerCard extends StatelessWidget {
  final String title;
  final String? imagePath;
  final String? year;
  final String description;

  const PartnerCard({
    super.key,
    required this.title,
    this.imagePath,
    this.year,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    // Get screen width
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 600;

    return Container(
      padding: EdgeInsets.all(isMobile ? 16.0 : 24.0),
      width: isMobile ? screenWidth : screenWidth * 0.5,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Title
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              title,
              style: GoogleFonts.nunito(
                fontSize: isMobile ? 24 : 32,
                fontWeight: FontWeight.w900,
                color: Theme.of(context).colorScheme.secondary,
                height: 1.2,
              ),
            ),
          ),
          SizedBox(height: isMobile ? 16 : 24),

          // Optional Image with year tag
          if (imagePath != null) ...[
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: Image.asset(
                    imagePath!,
                    fit: BoxFit.cover,
                  ),
                ),
                if (year != null)
                  Positioned(
                    left: 16,
                    bottom: 16,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 8,
                      ),
                      decoration: BoxDecoration(
                        color: const Color(0xFFFFD700),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Text(
                        '#$year',
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF1A2C31),
                        ),
                      ),
                    ),
                  ),
              ],
            ),
            const SizedBox(height: 24),
          ],

          // Description Text
          Text(
            description,
            style: TextStyle(
              fontSize: isMobile ? 14 : 16,
              height: 1.6,
              color: Colors.white70,
            ),
          ),
        ],
      ),
    );
  }
}
