import 'package:flutter/material.dart';

class DoesContent extends StatelessWidget {
  const DoesContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                children: [
                  Expanded(
                    flex: 1,
                    child: ClipRRect(
                      borderRadius: const BorderRadius.only(
                        topRight: Radius.circular(24),
                        bottomRight: Radius.circular(24),
                      ),
                      child: Image.asset(
                        'assets/images/skills_program.jpg',
                        fit: BoxFit.cover,
                        height: MediaQuery.of(context).size.height,
                      ),
                    ),
                  ),
                  // Right side - Content
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.all(32.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // TVET Skills Tag
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 20,
                              vertical: 8,
                            ),
                            decoration: BoxDecoration(
                              color: const Color(0xFFFFD466),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: const Text(
                              'TVET Skills',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                fontStyle: FontStyle.italic,
                              ),
                            ),
                          ),
                          const SizedBox(height: 24),

                          // Title
                          const Text(
                            'SKILLS PROGRAM',
                            style: TextStyle(
                              fontSize: 40,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF2D3436),
                            ),
                          ),
                          const SizedBox(height: 32),

                          // Skills List
                          const Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SkillItem(
                                number: '1',
                                text: 'Tailoring and Knitting',
                              ),
                              SizedBox(height: 16),
                              SkillItem(
                                number: '2',
                                text: 'Banana crafts/other handicrafts',
                              ),
                              SizedBox(height: 16),
                              SkillItem(
                                number: '3',
                                text:
                                    'Sewing dolls, bags, and purses using African fabrics',
                              ),
                              SizedBox(height: 16),
                              SkillItem(
                                number: '4',
                                text: 'Bead making and other jewelry',
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              // Column(
              //   children: [
              //     Expanded(
              //       flex: 1,
              //       child: ClipRRect(
              //         borderRadius: const BorderRadius.only(
              //           topRight: Radius.circular(24),
              //           bottomRight: Radius.circular(24),
              //         ),
              //         child: Image.asset(
              //           'assets/images/skills_program.jpg',
              //           fit: BoxFit.cover,
              //           height: MediaQuery.of(context).size.height,
              //         ),
              //       ),
              //     ),
              //     // Right side - Content
              //     Expanded(
              //       flex: 1,
              //       child: Container(
              //         padding: const EdgeInsets.all(32.0),
              //         child: Column(
              //           crossAxisAlignment: CrossAxisAlignment.start,
              //           children: [
              //             // TVET Skills Tag
              //             Container(
              //               padding: const EdgeInsets.symmetric(
              //                 horizontal: 20,
              //                 vertical: 8,
              //               ),
              //               decoration: BoxDecoration(
              //                 color: const Color(0xFFFFD466),
              //                 borderRadius: BorderRadius.circular(20),
              //               ),
              //               child: const Text(
              //                 'TVET Skills',
              //                 style: TextStyle(
              //                   fontSize: 16,
              //                   fontWeight: FontWeight.w500,
              //                   fontStyle: FontStyle.italic,
              //                 ),
              //               ),
              //             ),
              //             const SizedBox(height: 24),

              //             // Title
              //             const Text(
              //               'SKILLS PROGRAM',
              //               style: TextStyle(
              //                 fontSize: 40,
              //                 fontWeight: FontWeight.bold,
              //                 color: Color(0xFF2D3436),
              //               ),
              //             ),
              //             const SizedBox(height: 32),

              //             // Skills List
              //             const Column(
              //               crossAxisAlignment: CrossAxisAlignment.start,
              //               children: [
              //                 SkillItem(
              //                   number: '1',
              //                   text: 'Tailoring and Knitting',
              //                 ),
              //                 SizedBox(height: 16),
              //                 SkillItem(
              //                   number: '2',
              //                   text: 'Banana crafts/other handicrafts',
              //                 ),
              //                 SizedBox(height: 16),
              //                 SkillItem(
              //                   number: '3',
              //                   text:
              //                       'Sewing dolls, bags, and purses using African fabrics',
              //                 ),
              //                 SizedBox(height: 16),
              //                 SkillItem(
              //                   number: '4',
              //                   text: 'Bead making and other jewelry',
              //                 ),
              //               ],
              //             ),
              //           ],
              //         ),
              //       ),
              //     ),
              //   ],
              // ),
              // Column(
              //   children: [
              //     Expanded(
              //       flex: 1,
              //       child: ClipRRect(
              //         borderRadius: const BorderRadius.only(
              //           topRight: Radius.circular(24),
              //           bottomRight: Radius.circular(24),
              //         ),
              //         child: Image.asset(
              //           'assets/images/skills_program.jpg',
              //           fit: BoxFit.cover,
              //           height: MediaQuery.of(context).size.height,
              //         ),
              //       ),
              //     ),
              //     // Right side - Content
              //     Expanded(
              //       flex: 1,
              //       child: Container(
              //         padding: const EdgeInsets.all(32.0),
              //         child: Column(
              //           crossAxisAlignment: CrossAxisAlignment.start,
              //           children: [
              //             // TVET Skills Tag
              //             Container(
              //               padding: const EdgeInsets.symmetric(
              //                 horizontal: 20,
              //                 vertical: 8,
              //               ),
              //               decoration: BoxDecoration(
              //                 color: const Color(0xFFFFD466),
              //                 borderRadius: BorderRadius.circular(20),
              //               ),
              //               child: const Text(
              //                 'TVET Skills',
              //                 style: TextStyle(
              //                   fontSize: 16,
              //                   fontWeight: FontWeight.w500,
              //                   fontStyle: FontStyle.italic,
              //                 ),
              //               ),
              //             ),
              //             const SizedBox(height: 24),

              //             // Title
              //             const Text(
              //               'SKILLS PROGRAM',
              //               style: TextStyle(
              //                 fontSize: 40,
              //                 fontWeight: FontWeight.bold,
              //                 color: Color(0xFF2D3436),
              //               ),
              //             ),
              //             const SizedBox(height: 32),

              //             // Skills List
              //             const Column(
              //               crossAxisAlignment: CrossAxisAlignment.start,
              //               children: [
              //                 SkillItem(
              //                   number: '1',
              //                   text: 'Tailoring and Knitting',
              //                 ),
              //                 SizedBox(height: 16),
              //                 SkillItem(
              //                   number: '2',
              //                   text: 'Banana crafts/other handicrafts',
              //                 ),
              //                 SizedBox(height: 16),
              //                 SkillItem(
              //                   number: '3',
              //                   text:
              //                       'Sewing dolls, bags, and purses using African fabrics',
              //                 ),
              //                 SizedBox(height: 16),
              //                 SkillItem(
              //                   number: '4',
              //                   text: 'Bead making and other jewelry',
              //                 ),
              //               ],
              //             ),
              //           ],
              //         ),
              //       ),
              //     ),
              //   ],
              // ),
              // // Left side - Image
            ],
          ),
        ),
      ),
    );
  }
}

class SkillItem extends StatelessWidget {
  final String number;
  final String text;

  const SkillItem({
    super.key,
    required this.number,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '$number.',
          style: const TextStyle(
            fontSize: 18,
            color: Color(0xFF95A5A6),
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(width: 8),
        Expanded(
          child: Text(
            text,
            style: const TextStyle(
              fontSize: 18,
              color: Color(0xFF95A5A6),
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ],
    );
  }
}
