import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class VisionContent extends StatelessWidget {
  const VisionContent({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        // Determine if we're on a mobile device
        final isMobile = constraints.maxWidth < 800;

        return SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.all(isMobile ? 16.0 : 24.0),
                child: Wrap(
                  spacing: isMobile ? 0 : 16.0,
                  runSpacing: 32.0,
                  children: [
                    // Images section
                    Container(
                      width: isMobile 
                          ? constraints.maxWidth 
                          : constraints.maxWidth * 0.4,
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: AspectRatio(
                              aspectRatio: 8 / 7,
                              child: Image.asset(
                                'assets/about-two-img-1.jpg',
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          const SizedBox(height: 16),
                          Row(
                            children: [
                              Expanded(
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(8),
                                  child: AspectRatio(
                                    aspectRatio: 1,
                                    child: Image.asset(
                                      'assets/about-two-img-2.jpg',
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(width: 16),
                              Expanded(
                                child: LayoutBuilder(
                                  builder: (context, constraints) {
                                    final isSmallWidth = constraints.maxWidth < 200;
                                    return Flex(
                                      direction: isSmallWidth 
                                          ? Axis.vertical 
                                          : Axis.horizontal,
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          'I Can Do It!',
                                          style: GoogleFonts.caveat(
                                            fontSize: 24,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.yellow,
                                          ),
                                        ),
                                        SizedBox(
                                          width: isSmallWidth ? 0 : 8,
                                          height: isSmallWidth ? 8 : 0,
                                        ),
                                        SizedBox(
                                          width: 60,
                                          height: 70,
                                          child: ClipRRect(
                                            borderRadius: BorderRadius.circular(8),
                                            child: Image.asset(
                                              'assets/about-two-shape-3.png',
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        ),
                                      ],
                                    );
                                  },
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    
                    if (!isMobile) const SizedBox(width: 60),
                    
                    // Content section
                    Container(
                      width: isMobile 
                          ? constraints.maxWidth 
                          : constraints.maxWidth * 0.4,
                      padding: EdgeInsets.symmetric(
                        horizontal: isMobile ? 16.0 : 0,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: 10),
                          Text(
                            'Get to know about Ubumwe Community Center',
                            style: GoogleFonts.caveat(
                              fontSize: isMobile ? 20 : 24,
                              color: const Color(0xFF00C897),
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            'Our Mission & Vision',
                            style: GoogleFonts.nunito(
                              fontSize: isMobile ? 32 : 40,
                              fontWeight: FontWeight.w900,
                              color: Colors.white,
                            ),
                          ),
                          const SizedBox(height: 24),

                          // Introduction Text
                          const Text(
                            'Ubumwe Community Center (UCC) is a non-governmental local organisation founded in 2005 with a registration No 70/RGB/NGO/2016. We are located in Mbugangari Cell, Gisenyi Sector, Rubavu District, in the Western Province of Rwanda.',
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.white70,
                              height: 1.5,
                            ),
                          ),
                          const SizedBox(height: 32),

                          // Mission Section
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                padding: const EdgeInsets.all(8),
                                decoration: BoxDecoration(
                                  color: const Color(0xFF00C897).withOpacity(0.1),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: const Icon(
                                  Icons.rocket_launch,
                                  color: Color(0xFF00C897),
                                  size: 32,
                                ),
                              ),
                              const SizedBox(width: 16),
                              const Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Mission',
                                      style: TextStyle(
                                        fontSize: 24,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                      ),
                                    ),
                                    SizedBox(height: 8),
                                    Text(
                                      'To create a supportive environment for persons with disabilities which enhances knowledge, skills, engagement and independence through inclusive education, rehabilitation, community outreach and partnerships with government and other relevant organizations.',
                                      style: TextStyle(
                                        fontSize: 16,
                                        color: Colors.white70,
                                        height: 1.5,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 32),

                          // Vision Section
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                padding: const EdgeInsets.all(8),
                                decoration: BoxDecoration(
                                  color: const Color(0xFF00C897).withOpacity(0.1),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: const Icon(
                                  Icons.visibility,
                                  color: Color(0xFF00C897),
                                  size: 32,
                                ),
                              ),
                              const SizedBox(width: 16),
                              const Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Vision',
                                      style: TextStyle(
                                        fontSize: 24,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                      ),
                                    ),
                                    SizedBox(height: 8),
                                    Text(
                                      'To build a society where social inclusion, empowerment, and equal rights of persons with disabilities are guaranteed. Our approach to promoting the well-being of our members will serve as a model of removing barriers in society based on our belief that disability is not inability.',
                                      style: TextStyle(
                                        fontSize: 16,
                                        color: Colors.white70,
                                        height: 1.5,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 32),

                          // Goals Section
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                padding: const EdgeInsets.all(8),
                                decoration: BoxDecoration(
                                  color: const Color(0xFF00C897).withOpacity(0.1),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: const Icon(
                                  Icons.flag_rounded,
                                  color: Color(0xFF00C897),
                                  size: 32,
                                ),
                              ),
                              const SizedBox(width: 16),
                              const Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Goals',
                                      style: TextStyle(
                                        fontSize: 24,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                      ),
                                    ),
                                    SizedBox(height: 8),
                                    // Goals List
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          '• To improve access to inclusive education, health and livelihood opportunities for persons with disability.',
                                          style: TextStyle(
                                            fontSize: 16,
                                            color: Colors.white70,
                                            height: 1.5,
                                          ),
                                        ),
                                        SizedBox(height: 8),
                                        Text(
                                          '• To establish UCC branches across the country to reach out and provide support to people with disabilities in the community.\n• To transform disabilities into abilities by training community members in income-generating activities, and fostering self-reliance among community members.',
                                          style: TextStyle(
                                            fontSize: 16,
                                            color: Colors.white70,
                                            height: 1.5,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),

                          // Images Section

                          const SizedBox(height: 32),
                          Container(
                            padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 32),
                            decoration: BoxDecoration(
                              color: const Color(0xFF00C897),
                              borderRadius: BorderRadius.circular(100),
                            ),
                            child: const Text(
                              'DISCOVER MORE',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),

                          const SizedBox(height: 100),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
