import 'package:flutter/material.dart';

class VisionContent extends StatelessWidget {
  const VisionContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1A2C31), // Dark green background
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header Section
              Container(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Get to know about Ubumwe Community Center',
                      style: TextStyle(
                        fontSize: 18,
                        color: Color(0xFF00C897),
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                    const SizedBox(height: 8),
                    const Text(
                      'Our Mission & Vision',
                      style: TextStyle(
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
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
                            Icons.track_changes,
                            color: Color(0xFF00C897),
                            size: 32,
                          ),
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const [
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
                            Icons.favorite,
                            color: Color(0xFF00C897),
                            size: 32,
                          ),
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const [
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
                            Icons.track_changes,
                            color: Color(0xFF00C897),
                            size: 32,
                          ),
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'Goals',
                                style: TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                              const SizedBox(height: 8),
                              // Goals List
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: const [
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
                                    '• To establish UCC branches across the country to reach out and support more persons with disabilities.',
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
                  ],
                ),
              ),

              // Images Section
              Container(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: AspectRatio(
                        aspectRatio: 16 / 9,
                        child: Image.asset(
                          'assets/images/mission_image1.jpg',
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
                                'assets/images/mission_image2.jpg',
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: AspectRatio(
                              aspectRatio: 1,
                              child: Image.asset(
                                'assets/images/mission_image3.jpg',
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
