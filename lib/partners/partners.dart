import 'package:flutter/material.dart';


class PartnersContent extends StatelessWidget {
  const PartnersContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24.0),
      color: const Color(0xFF1A2C31), // Dark green background
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Title
          const Text(
            'Congregation B\'nai B\'rith',
            style: TextStyle(
              fontSize: 40,
              fontWeight: FontWeight.bold,
              color: Color(0xFFFFD700), // Golden yellow color
              height: 1.2,
            ),
          ),
          const SizedBox(height: 24),

          // Image with year tag
          Stack(
            children: [
              // Main Image
              ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: Image.asset(
                  'assets/images/partners/bnai_brith.jpg',
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              // Year Tag
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
                  child: const Text(
                    '#2010',
                    style: TextStyle(
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

          // Description Text
          const Text(
            'Since 2010, Congregation B\'nai B\'rith (CBB) together with the Santa Barbara community, has been the main donor and supporter for our inclusive pre-school and primary school. They have helped us realize our long-time dream to start an inclusive school. Since the construction of our pre-school facility in 2010, they continue to support our school in different ways: school supplies and other needs, especially school books, sponsoring children with special needs, supporting our school staff, and so much more.',
            style: TextStyle(
              fontSize: 16,
              height: 1.6,
              color: Colors.white70,
            ),
          ),
        ],
      ),
    );
  }
}
