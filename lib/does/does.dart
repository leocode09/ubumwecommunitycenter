import 'package:flutter/material.dart';

import 'feature_card.dart';


class DoesContent extends StatelessWidget {
  const DoesContent({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final isDesktop = constraints.maxWidth > 700;
        
        return SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: isDesktop ? 208.0 : 16.0,
            ),
            child: const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SectionText(text: 'Technical & Vocational Education & Training Program'),
                FeatureCard(
                  imagePath: 'assets/tailor.jpg',
                  section: 'TVET Skills',
                  title: 'SKILLS PROGRAM',
                  skillsList: [
                    {'skill': 'Tailoring and Knitting'},
                    {'skill': 'Banana crafts/other handicrafts'},
                    {'skill': 'Sewing dolls, bags, and purses using African fabrics'},
                    {'skill': 'Bead making and other jewelry'},
                  ],
                ),
                FeatureCard(
                  imagePath: 'assets/computer_sk.jpg',
                  section: 'TVET Skills',
                  title: 'COMPUTER SKILLS PROGRAM',
                  skillsList: [
                    {'skill': 'Microsoft Office Suite'},
                    {'skill': 'Basic computer maintenance'},
                    {'skill': 'Internet protocol'},
                    {'skill': 'Digital culture'},
                  ],
                ),
                FeatureCard(
                  imagePath: 'assets/cohwi.jpg',
                  section: 'TVET Skills',
                  title: 'COOPERATIVE MARKET',
                  skillsList: [
                    {'skill': 'Marketing and sales skills'},
                    {'skill': 'Determining cost of production'},
                    {'skill': 'Leadership experience while working with others'},
                    {'skill': 'Graduates have the option to work at our cooperative, COOHWI - Cooperative Haguruka Witeze Imbere'},
                    {'skill': 'This translates to: "Stand up and improve yourself"'},
                  ],
                ),
                SectionText(text: 'Inclusive Education'),
                FeatureCard(
                  imagePath: 'assets/inclus_ed.jpg',
                  section: 'House of Children School',
                  title: 'Inclusive Education',
                  skillsList: [
                    {'skill': 'Inclusive education at House of Children School'},
                    {'skill': 'Transitional Classes to provide skills training to individuals with disabilities'},
                    {'skill': 'Consulting with Rwandan schools, partnering with Rwandan Futures, to allow students with disabilities the option to attend their local school'},
                    {'skill': 'Accessibility consulting to identify and remove barriers resulting in improved access to facilities for people with handicaps'},
                    {'skill': 'Medical assistance to enable the use of prosthetic devices'},
                  ],
                ),
                SectionText(text: 'Special Needs'),
                FeatureCard(
                  imagePath: 'assets/special_n.jpg',
                  section: 'Disability is not Inability',
                  title: 'Special Needs',
                  skillsList: [
                    {'skill': 'Music therapy'},
                    {'skill': 'Physiotherapy'},
                    {'skill': 'Occupational therapy'},
                    {'skill': 'Speech therapy'},
                    {'skill': 'Life Skills'},
                    {'skill': 'Social reintegration'},
                  ],
                ),
                SectionText(text: 'Community Based Rehabilitation'),
                FeatureCard(
                  imagePath: 'assets/cbr.jpg',
                  section: 'Disability is not Inability',
                  title: 'Community Based Rehabilitation',
                  skillsList: [
                    {'skill': 'REHABILITATION'},
                    {'skill': 'PREVENTION & HEALTH PROMOTION'},
                    {'skill': 'RESOURCE ROOM'},
                    {'skill': 'ASSISTIVE DEVICES'},
                  ],
                ),
                SectionText(text: 'Mwogo Integrated Development Program'),
                FeatureCard(
                  imagePath: 'assets/mwogo.jpg',
                  section: 'Disability is not Inability',
                  title: 'Mwogo Integrated Development Program',
                  skillsList: [
                    {'skill': 'Tailoring'},
                    {'skill': 'Hair dressing'},
                    {'skill': 'Culinary arts'},
                    {'skill': 'Literacy and numeracy program'},
                    {'skill': 'Apiary & farming'},
                  ],
                ),
                SizedBox(height: 100),
              ],
            ),
          ),
        );
      },
    );
  }
}