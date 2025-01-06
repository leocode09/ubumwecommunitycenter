import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DonateContent extends StatelessWidget {
  const DonateContent({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          // Hero Section
          Stack(
            children: [
              // Background Image with Gradient
              SizedBox(
                width: double.infinity,
                height: 600, // Reduced height
                child: Stack(
                  children: [
                    Image.asset(
                      'assets/donate.jpg',
                      fit: BoxFit.cover,
                      width: double.infinity,
                      height: 600,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          stops: const [0.0, 0.6, 1.0],
                          colors: [
                            Theme.of(context).colorScheme.primary.withOpacity(0.2),
                            Theme.of(context).colorScheme.primary.withOpacity(0.5), 
                            Theme.of(context).colorScheme.primary.withOpacity(0.8),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              // Centered Content
              Positioned(
                top: 100,
                left: 0,
                right: 0,
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: Column(
                    children: [
                      // Hero Text
                      Text(
                        'Make a Difference Today',
                        style: GoogleFonts.nunito(
                          fontSize: 56,
                          fontWeight: FontWeight.w900,
                          color: Colors.white,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 24),
                      SizedBox(
                        width: 700,
                        child: Text(
                          'Your generosity transforms lives. Support our mission to empower children and adults with disabilities in Rwanda.',
                          style: GoogleFonts.nunito(
                            fontSize: 24,
                            color: Colors.white,
                            height: 1.5,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      const SizedBox(height: 48),
                      
                      // Amount Input Section - Centered and Prominent
                      Container(
                        width: 500,
                        padding: const EdgeInsets.all(32),
                        decoration: BoxDecoration(
                          color: Theme.of(context).colorScheme.primary.withOpacity(0.6),
                          borderRadius: BorderRadius.circular(24),
                          border: Border.all(
                            color: Colors.white.withOpacity(0.1),
                            width: 1,
                          ),
                        ),
                        child: Column(
                          children: [
                            Text(
                              'Donation Amount',
                              style: GoogleFonts.nunito(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                            const SizedBox(height: 24),
                            Container(
                              decoration: BoxDecoration(
                                color: Theme.of(context).colorScheme.secondary,
                                borderRadius: BorderRadius.circular(16),
                              ),
                              padding: const EdgeInsets.symmetric(
                                horizontal: 24,
                                vertical: 16,
                              ),
                              child: const Row(
                                children: [
                                  Text(
                                    '\$',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 40,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Expanded(
                                    child: TextField(
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 40,
                                      ),
                                      decoration: InputDecoration(
                                        border: InputBorder.none,
                                        hintText: '0',
                                        hintStyle: TextStyle(
                                          color: Colors.white54,
                                        ),
                                      ),
                                      keyboardType: TextInputType.number,
                                    ),
                                  ),
                                  Text(
                                    '.00',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 40,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),

          // Main Content Section
          Container(
            color: Theme.of(context).colorScheme.primary,
            padding: const EdgeInsets.symmetric(vertical: 64),
            child: Center(
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 1200),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Left Column - Payment Methods
                    Expanded(
                      flex: 1,
                      child: Container(
                        padding: const EdgeInsets.all(32),
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(24),
                          border: Border.all(
                            color: Colors.white.withOpacity(0.1),
                            width: 1,
                          ),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Payment Methods',
                              style: GoogleFonts.nunito(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                            const SizedBox(height: 24),
                            _buildPaymentOption(
                              'Local Donation (MoMo Pay)',
                              'SUSTAIN UBUMWE\nDial *182*8*1*101176#',
                              Theme.of(context).colorScheme.secondary,
                              true,
                            ),
                            const SizedBox(height: 16),
                            _buildPaymentOption(
                              'International Transfer',
                              'Bank transfer details will be provided',
                              Colors.grey[400]!,
                              false,
                            ),
                          ],
                        ),
                      ),
                    ),

                    const SizedBox(width: 32),

                    // Right Column - Personal Information
                    Expanded(
                      flex: 2,
                      child: Container(
                        padding: const EdgeInsets.all(32),
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(24),
                          border: Border.all(
                            color: Colors.white.withOpacity(0.1),
                            width: 1,
                          ),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Personal Information',
                              style: GoogleFonts.nunito(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                            const SizedBox(height: 32),
                            Row(
                              children: [
                                Expanded(child: _buildTextField('First name')),
                                const SizedBox(width: 16),
                                Expanded(child: _buildTextField('Last name')),
                              ],
                            ),
                            const SizedBox(height: 16),
                            Row(
                              children: [
                                Expanded(child: _buildTextField('Email')),
                                const SizedBox(width: 16),
                                Expanded(child: _buildTextField('Phone')),
                              ],
                            ),
                            const SizedBox(height: 16),
                            _buildTextField('Message (Optional)', maxLines: 4),
                            const SizedBox(height: 32),
                            SizedBox(
                              width: double.infinity,
                              height: 56,
                              child: ElevatedButton(
                                onPressed: () {},
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Theme.of(context).colorScheme.secondary,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(16),
                                  ),
                                ),
                                child: Text(
                                  'Complete Donation',
                                  style: GoogleFonts.nunito(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTextField(String hint, {int maxLines = 1}) {
    return TextField(
      maxLines: maxLines,
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.white.withOpacity(0.1),
        hintText: hint,
        hintStyle: TextStyle(color: Colors.white.withOpacity(0.5)),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(color: Colors.white.withOpacity(0.1)),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(color: Colors.white.withOpacity(0.1)),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: const BorderSide(color: Colors.white),
        ),
        contentPadding: const EdgeInsets.all(16),
      ),
      style: const TextStyle(color: Colors.white),
    );
  }

  Widget _buildPaymentOption(
    String title,
    String subtitle,
    Color accentColor,
    bool isSelected,
  ) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.1),
        border: Border.all(
          color: isSelected ? accentColor : Colors.white.withOpacity(0.1),
          width: 2,
        ),
        borderRadius: BorderRadius.circular(16),
      ),
      child: RadioListTile(
        title: Text(
          title,
          style: GoogleFonts.nunito(
            fontWeight: FontWeight.bold,
            fontSize: 16,
            color: Colors.white,
          ),
        ),
        subtitle: Text(
          subtitle,
          style: GoogleFonts.nunito(
            color: Colors.white70,
          ),
        ),
        value: title,
        groupValue: isSelected ? title : null,
        onChanged: (value) {},
        activeColor: accentColor,
      ),
    );
  }
}
