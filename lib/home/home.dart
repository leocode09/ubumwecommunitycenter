import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:ui';
import 'dart:math' show pi;
import 'package:url_launcher/url_launcher.dart';

class CircularTextPainter extends CustomPainter {
  final String text;
  final TextStyle textStyle;

  CircularTextPainter({required this.text, required this.textStyle});

  @override
  void paint(Canvas canvas, Size size) {
    final double radius = size.width / 2;
    final double centerX = size.width / 2;
    final double centerY = size.height / 2;

    canvas.translate(centerX, centerY);
    final double textAngleStep = (2 * pi) / text.length;

    for (int i = 0; i < text.length; i++) {
      canvas.save();
      double angle = i * textAngleStep;
      canvas.rotate(angle);
      TextSpan span = TextSpan(text: text[i], style: textStyle);
      TextPainter tp = TextPainter(
        text: span,
        textDirection: TextDirection.ltr,
      );
      tp.layout();
      tp.paint(canvas, Offset(-tp.width / 2, -radius));
      canvas.restore();
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}

class HomeContent extends StatelessWidget {
  const HomeContent({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        color: const Color(0xFF283734),
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.7,
              width: double.infinity,
              child: Stack(
                children: [
                  Stack(
                    children: [
                      // Original sharp image
                      SizedBox(
                        width: double.infinity,
                        height: double.infinity,
                        child: Image.asset(
                          'assets/main-slider-2-9.jpg',
                          fit: BoxFit.cover,
                        ),
                      ),
                      // Blurred overlay with radial mask
                      ClipRect(
                        child: ShaderMask(
                          shaderCallback: (Rect bounds) {
                            return RadialGradient(
                              center: Alignment.center,
                              radius: 0.8,
                              colors: [
                                Colors.white,
                                Colors.white.withOpacity(0),
                              ],
                            ).createShader(bounds);
                          },
                          blendMode: BlendMode.dstIn,
                          child: ImageFiltered(
                            imageFilter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                            child: Image.asset(
                              'assets/main-slider-2-9.jpg',
                              fit: BoxFit.cover,
                              width: double.infinity,
                              height: double.infinity,
                            ),
                          ),
                        ),
                      ),
                      // Existing gradient overlay
                      Positioned.fill(
                        child: Container(
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [
                                Colors.black.withOpacity(0.7),
                                Colors.black.withOpacity(0.3),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SafeArea(
                    child: Center(
                      child: SingleChildScrollView(
                        padding: EdgeInsets.symmetric(
                          horizontal: MediaQuery.of(context).size.width * 0.05,
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Disability is not Inability',
                              style: GoogleFonts.caveat(
                                fontSize:
                                    MediaQuery.of(context).size.width < 600
                                        ? 24
                                        : 32,
                                color: Theme.of(context).colorScheme.secondary,
                                fontWeight: FontWeight.bold,
                              ),
                              textAlign: TextAlign.center,
                            ),
                            SizedBox(
                                height: MediaQuery.of(context).size.width < 600
                                    ? 20
                                    : 30),
                            Text(
                              MediaQuery.of(context).size.width < 600
                                  ? 'WE PROVIDE A PLACE\nWHERE PEOPLE EXPLORE\nTHEIR COMMON HUMANITY'
                                  : 'WE PROVIDE A PLACE WHERE PEOPLE EXPLORE\nTHEIR COMMON HUMANITY',
                              textAlign: TextAlign.center,
                              style: GoogleFonts.nunito(
                                fontSize:
                                    MediaQuery.of(context).size.width < 600
                                        ? 24
                                        : 32,
                                color: Colors.white,
                                fontWeight: FontWeight.w800,
                              ),
                            ),
                            SizedBox(
                                height: MediaQuery.of(context).size.width < 600
                                    ? 30
                                    : 40),
                            ConstrainedBox(
                              constraints: BoxConstraints(
                                maxWidth:
                                    MediaQuery.of(context).size.width < 600
                                        ? 200
                                        : 250,
                              ),
                              child: ElevatedButton(
                                onPressed: () async {
                                  final Uri url = Uri.parse('https://www.youtube.com/@ubumwecommunitycentertv');
                                  if (await canLaunchUrl(url)) {
                                    await launchUrl(
                                      url,
                                      mode: LaunchMode.externalApplication,
                                      webOnlyWindowName: '_blank',
                                    );
                                  } else {
                                    // Handle error - optionally show an error message
                                    if (context.mounted) {
                                      ScaffoldMessenger.of(context).showSnackBar(
                                        const SnackBar(
                                          content: Text('Could not launch YouTube channel'),
                                        ),
                                      );
                                    }
                                  }
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor:
                                      Theme.of(context).colorScheme.secondary,
                                  padding: EdgeInsets.symmetric(
                                    horizontal:
                                        MediaQuery.of(context).size.width < 600
                                            ? 20
                                            : 40,
                                    vertical:
                                        MediaQuery.of(context).size.width < 600
                                            ? 15
                                            : 20,
                                  ),
                                ),
                                child: FittedBox(
                                  child: Text(
                                    'YOUTUBE CHANNEL',
                                    style: GoogleFonts.nunito(
                                      fontWeight: FontWeight.w800,
                                      fontSize:
                                          MediaQuery.of(context).size.width <
                                                  600
                                              ? 14
                                              : 16,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                                height: MediaQuery.of(context).size.width < 600
                                    ? 40
                                    : 60),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              width: double.infinity,
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
                child: LayoutBuilder(
                  builder: (context, constraints) {
                    final isDesktop = constraints.maxWidth > 900;

                    return isDesktop
                        ? _buildDesktopLayout(context)
                        : _buildMobileLayout(context);
                  },
                ),
              ),
            ),
            
            SizedBox(
              height: 500,
              width: double.infinity,
              child: Stack(
                children: [
                  SizedBox(
                    width: double.infinity,
                    height: double.infinity,
                    child: Image.asset(
                      'assets/become-volunteer-one-bg.jpg',
                      fit: BoxFit.cover,
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    left: 0,
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width,
                      child: Image.asset(
                        'assets/become-volunteer-shape-1.png',
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                  Positioned.fill(
                    child: Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            const Color(0xFF1F3B31).withOpacity(0.1),
                            const Color(0xFF1F3B31).withOpacity(0.1),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Become volunteers',
                          textAlign: TextAlign.center,
                          style: GoogleFonts.caveat(
                            fontSize: 32,
                            color: Theme.of(context).colorScheme.secondary,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 10),
                        Text(
                          'Join your hand with us for a\nbetter life and future',
                          textAlign: TextAlign.center,
                          style: GoogleFonts.nunito(
                            fontSize: 50,
                            color: Colors.white,
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                        const SizedBox(height: 30),
                        TextButton(
                          onPressed: () => context.go('/donate'),
                          style: TextButton.styleFrom(
                            backgroundColor: const Color(0xFFFFD966),
                            padding: const EdgeInsets.symmetric(
                                horizontal: 32, vertical: 16),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(25),
                            ),
                          ),
                          child: Text(
                            'SEND DONATION',
                            style: GoogleFonts.nunito(
                              color: const Color(0xFF1F3B31),
                              fontSize: 16,
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            
            SizedBox(
              width: double.infinity,
              child: Container(
                color: const Color(0xFF223931),
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
                child: LayoutBuilder(
                  builder: (context, constraints) {
                    final isDesktop = constraints.maxWidth > 900;
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        isDesktop 
                          ? _buildDesktopTestimonial(context)
                          : _buildMobileTestimonial(context),
                        const SizedBox(height: 60),
                      ],
                    );
                  },
                ),
              ),
            ),
          
          ],
        ),
      ),
    );
  }

  Widget _buildDesktopLayout(BuildContext context) {
    return Row(
      children: [
        _buildImageStack(context),
        Padding(
          padding: const EdgeInsets.only(left: 120),
          child: _buildContentSection(context),
        ),
      ],
    );
  }

  Widget _buildMobileLayout(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 700,
          child: _buildImageStack(context),
        ),
        const SizedBox(height: 40),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: _buildContentSection(context),
        ),
      ],
    );
  }

  Widget _buildImageStack(BuildContext context) {

    return Stack(
      children: [
        Image.asset(
          'assets/about-one-shape-1.png',
          fit: BoxFit.cover,
        ),
        Positioned(
          bottom: 0,
          right: 0,
          child:  ClipRRect(
              borderRadius: const BorderRadius.only(
                topRight: Radius.circular(100),
                bottomLeft: Radius.circular(335),
                bottomRight: Radius.circular(335),
              ),
              child: Image.asset(
                'assets/about-one-img-1.jpg',
                fit: BoxFit.cover,
              ),
            ),
          
        ),
        Positioned(
          bottom: 90,
          right: 60,
          child: Container(
            width: 430,
            height: 600,
            decoration: BoxDecoration(
              border: Border.all(
                color: Theme.of(context).colorScheme.secondary,
                width: 6,
              ),
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(300),
                bottomRight: Radius.circular(300),
              ),
            ),
          ),
        ),
        Positioned(
          bottom: 0,
          right: 0,
          child: Container(
            width: 200,
            height: 200,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: const Color(0xFF283734),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.3),
                  spreadRadius: 2,
                  blurRadius: 10,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: Stack(
              alignment: Alignment.center,
              children: [
                // Curved text using CustomPaint
                Padding(
                  padding: const EdgeInsets.all(12),
                  child: CustomPaint(
                    size: const Size(200, 200),
                    painter: CircularTextPainter(
                      text: "UBUMWE COMMUNITY CENTER - 20 YEARS EXPERIENCE",
                      textStyle: const TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                // Center icon
                SizedBox(
                  width: 100,
                  height: 100,
                  child: Image.asset(
                    'assets/curved-circle-icon.png',
                    fit: BoxFit.contain,
                    // color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildContentSection(BuildContext context) {
    final isDesktop = MediaQuery.of(context).size.width > 900;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Ubumwe translates to\n"unity or togetherness"',
          style: GoogleFonts.nunito(
            fontSize: isDesktop ? 50 : 28,
            color: Colors.white,
            fontWeight: FontWeight.w800,
          ),
        ),
        const SizedBox(height: 10),
        Text(
          'The Values of Ubumwe Community Center are:',
          style: GoogleFonts.caveat(
            fontSize: isDesktop ? 24 : 18,
            color: Colors.teal,
            fontWeight: FontWeight.w800,
          ),
        ),
        const SizedBox(height: 20),
        ...[
          'Commitment',
          'Inclusivity',
          'Reliability',
          'Accountability',
          'Sustainability',
          'Innovation',
          'Collaboration',
          'Dignity',
          'Respect',
          'Compassion',
        ].map((value) => Padding(
              padding: const EdgeInsets.symmetric(vertical: 4),
              child: Row(
                children: [
                  Stack(
                    children: [
                      Container(
                        width: 18,
                        height: 18,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Color.fromARGB(118, 18, 18, 18),
                        ),
                        child: Stack(clipBehavior: Clip.none, children: [
                          Positioned(
                            top: -6,
                            left: 0,
                            child: Icon(
                              Icons.check,
                              size: 25,
                              color: Theme.of(context).colorScheme.secondary,
                              weight: 2.5,
                            ),
                          ),
                        ]),
                      ),
                    ],
                  ),
                  const SizedBox(width: 10),
                  Text(
                    value,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(height: 10),
                ],
              ),
            )),
        const SizedBox(height: 30),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 30),
          child: Wrap(
            spacing: 40,
            runSpacing: 20,
            children: [
              _buildStatistic('900', 'Beneficiaries'),
              _buildStatistic('73', 'Employees'),
            ],
          ),
        ),
        Wrap(
          spacing: 40,
          runSpacing: 30,
          alignment: WrapAlignment.center,
          children: [
            _buildInfoColumn(
              Icons.people,
              'Join our team',
              'Apply for Volunteering',
            ),
            _buildInfoColumn(
              Icons.favorite,
              'Start donating',
              'Your donation is important',
            ),
          ],
        ),
        const SizedBox(height: 40),
        Center(
          child: TextButton(
            onPressed: () => context.go('/contact'),
            style: TextButton.styleFrom(
              backgroundColor: const Color(0xFFFFD966),
              padding: const EdgeInsets.symmetric(
                horizontal: 32,
                vertical: 16,
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(25),
              ),
            ),
            child: Text(
              'DISCOVER MORE',
              style: GoogleFonts.nunito(
                color: const Color(0xFF1F3B31),
                fontSize: 16,
                fontWeight: FontWeight.w800,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildInfoColumn(IconData icon, String title, String subtitle) {
    return Column(
      children: [
        Icon(icon, size: 48, color: Colors.amber),
        Text(
          title,
          style: GoogleFonts.nunito(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          subtitle,
          style: const TextStyle(
            color: Colors.white70,
            fontSize: 14,
          ),
        ),
      ],
    );
  }

  Widget _buildStatistic(String number, String label) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            const Text(
              'More than ',
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
              ),
            ),
            Text(
              number,
              style: const TextStyle(
                color: Colors.amber,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        Text(
          label,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 16,
          ),
        ),
      ],
    );
  }

  Widget _buildDesktopTestimonial(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildTestimonialHeader(context),
        _buildTestimonialCard(context),
      ],
    );
  }

  Widget _buildMobileTestimonial(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        _buildTestimonialHeader(context),
        const SizedBox(height: 40),
        _buildTestimonialCard(context),
      ],
    );
  }

  Widget _buildTestimonialHeader(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Our Testimonials',
          style: GoogleFonts.caveat(
            fontSize: 24,
            color: Theme.of(context).colorScheme.secondary,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          'Ubumwe\nCommunity Center',
          style: GoogleFonts.nunito(
            fontSize: MediaQuery.of(context).size.width < 600 ? 36 : 50,
            color: Colors.white,
            fontWeight: FontWeight.w800,
          ),
        ),
        const SizedBox(height: 60),
        TextButton(
          onPressed: () => context.go('/contact'),
          style: TextButton.styleFrom(
            backgroundColor: const Color(0xFFFFD966),
            padding: const EdgeInsets.symmetric(
              horizontal: 32,
              vertical: 16,
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(25),
            ),
          ),
          child: Text(
            'ASK ANYTHING HERE',
            style: GoogleFonts.nunito(
              color: const Color(0xFF1F3B31),
              fontSize: 16,
              fontWeight: FontWeight.w800,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildTestimonialCard(BuildContext context) {
    final isDesktop = MediaQuery.of(context).size.width > 900;
    
    return Container(
      // color: Theme.of(context).colorScheme.primary,
      constraints: BoxConstraints(
        maxWidth: isDesktop ? 600 : MediaQuery.of(context).size.width * 0.9,
      ),
      padding: const EdgeInsets.fromLTRB(30, 20, 30, 20),
      decoration: BoxDecoration(
        border: Border.all(
          color: Theme.of(context).colorScheme.secondary,
          width: 5,
        ),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        children: [
          Row(
            children: [
              Flexible(
                child: Stack(
                  children: [
                    for (var i = 0; i < 5; i++)
                      if (isDesktop || i == 2) // Only show middle image on mobile
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Transform.translate(
                            offset: Offset(
                                 [-150.0, -100.0, 0.0, 580.0, 600.0][i],
                                 [-70.0, 250.0, 0.0, 100.0, -100.0][i],
                            ),
                            child: Container(
                              width: (i == 2) ? (isDesktop ? 120 : 80) : (isDesktop ? 80 : 60),
                              height: (i == 2) ? (isDesktop ? 120 : 80) : (isDesktop ? 80 : 60),
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(
                                  width: 2,
                                  color: Theme.of(context).colorScheme.secondary,
                                ),
                              ),
                              child: ClipOval(
                                child: Opacity(
                                  opacity: (i == 2) ? 1.0 : 0.2,
                                  child: Image.asset(
                                    'assets/christine.png',
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'INGABIRE Christine',
                      style: GoogleFonts.nunito(
                        fontSize: isDesktop ? 24 : 14,
                        color: Colors.white,
                        fontStyle: FontStyle.italic,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                    Text(
                      'Mother',
                      style: GoogleFonts.caveat(
                        fontSize: isDesktop ? 20 : 18,
                        color: Theme.of(context).colorScheme.secondary,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Text(
            'Turashimira Ubumuwe Community Center Kubwo\nkwita kumwana wanjye ufite ubumuga',
            style: GoogleFonts.poppins(
              fontSize: isDesktop ? 16 : 14,
              color: Colors.white,
              fontStyle: FontStyle.italic,
            ),
          ),
        ],
      ),
    );
  }
}
