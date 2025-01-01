import 'package:flutter/material.dart';

class AboutContent extends StatelessWidget {
  const AboutContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Hero Image Section
                Stack(
                  children: [
                    Image.asset(
                      'assets/images/frederick_zacharie.jpg',
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                    const Positioned(
                      bottom: 16,
                      left: 16,
                      child: Card(
                        color: Color(0xFFFFE17D),
                        child: Padding(
                          padding:
                              EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                          child: Text(
                            'Building a dream',
                            style: TextStyle(
                              fontSize: 16,
                              fontStyle: FontStyle.italic,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),

                // Title Section
                const Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Text(
                    'Frederick & Zacharie',
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFFFFD700), // Golden color
                    ),
                  ),
                ),

                // Story Content
                const Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'The Rwandan genocide ended in 1994, but pockets of resistance still lingered for years. '
                        'In 1999, a fifteen-year-old Rwandan boy, Frederick Ndabaramiye, was dragged from a bus '
                        'and brutally attacked by Interahamwe rebels. When he refused to kill 18 fellow passengers, '
                        'the rebels hacked off Frederick\'s hands with machetes and left him for dead.\n\n'
                        'After a year in the hospital, Frederick was placed at the Imbabazi, an orphanage started '
                        'by American expatriate Rosamond Carr in the aftermath of the genocide. Most of Frederick\'s '
                        'family had been slaughtered and his mother, who survived, did not have the resources to '
                        'care for him after he lost both of his hands. Frederick met Zacharie Dusingizimana, a '
                        'young teacher, at the orphanage.\n\n'
                        'Not willing to remain captive to hate and anger, Frederick and Zacharie turned toward '
                        'forgiveness and action. Feeling lucky to be alive, they wanted to help those like themselves. '
                        'Partially due to the genocide, Rwanda has a disproportionate number of physically and mentally '
                        'disabled people and most are only able to beg in the street.\n\n'
                        'With the support of the Columbus Zoo\'s Partners In Conservation and Jack Hanna, Frederick '
                        'and Zacharie founded the Ubumwe Community Center as a place where these people are given '
                        'alternatives, where they can be educated, receive skills training, and ultimately generate '
                        'a sustainable income for themselves and their families.\n\n'
                        'Today Frederick and Zacharie speak internationally and are mentors to young people everywhere. '
                        'They teach that a disability of spirit is far worse than a disability of the body. Frederick '
                        'models his triumph over physical limitations through his painting, his love of life, and his '
                        'fearlessness.',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.white70,
                          height: 1.5,
                        ),
                        textAlign: TextAlign.justify,
                      ),
                      SizedBox(height: 16),
                      Text(
                        'After a year in the hospital, Frederick was placed at the Imbabazi, an orphanage started '
                        'by American expatriate Rosamond Carr in the aftermath of the genocide. Most of Frederick\'s'
                        'family had been slaughtered and his mother, who survived, did not have the resources to '
                        'care for him after he lost both hands.',
                        style: TextStyle(fontSize: 16, color: Colors.white70),
                      ),
                    ],
                  ),
                ),

                // Genocide Information Card
                Container(
                  margin: const EdgeInsets.all(16.0),
                  padding: const EdgeInsets.all(16.0),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'GENOCIDE - 1994',
                        style: TextStyle(
                          color: Color(0xFF008080), // Teal color
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 16),
                      Row(
                        children: [
                          Image.asset(
                            'assets/images/rwanda_map.png',
                            height: 100,
                          ),
                          const SizedBox(width: 16),
                          Image.asset(
                            'assets/images/globe.png',
                            height: 100,
                          ),
                        ],
                      ),
                      const SizedBox(height: 16),
                      Text(
                        'A census carried out by the Rwandan ministry of Local Government in 2002 indicated that '
                        'a total of 1,074,017 people were killed in the 100 days of the 1994 genocide. This '
                        'census details names of the dead, dwelling place, age, and how they were killed. '
                        'Thousands more were maimed or mutilated as rebel attacks continued for a few years '
                        'after the 1994 genocide. More than 300,000 children were separated from their '
                        'families or orphaned. Rwanda, a small, landlocked nation in Central Africa, was '
                        'one of the poorest and most underdeveloped nations in the world just after the genocide.',
                        style: TextStyle(color: Colors.grey[600]),
                      ),
                    ],
                  ),
                ),

                // UCC Background Section
                Container(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Title Section
                      const Text(
                        'Disability is not Inability',
                        style: TextStyle(
                          fontSize: 18,
                          color: Color(0xFF00C897), // Green accent color
                          fontStyle: FontStyle.italic,
                        ),
                      ),
                      const SizedBox(height: 8),
                      const Text(
                        'Ubumwe Community Center Background',
                        style: TextStyle(
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(height: 24),
                      
                      // Content Paragraphs
                      const Text(
                        'Through various skills and basic education, people with various disabilities at the Ubumwe Community Center (UCC) learn self-reliance and gain self-esteem. The Center assists over 900 people of both genders with a disability every year. Our successful programs have resulted in these numbers increasing every year. The UCC has the capacity to serve 256 individuals with disabilities each day. As the demand is still high, we conduct other programs, like home visits, to assist people in their homes, but we aren\'t able to reach everyone.',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.white70,
                          height: 1.5,
                        ),
                      ),
                      const SizedBox(height: 16),
                      
                      // Image Grid
                      GridView.count(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        crossAxisCount: 2,
                        mainAxisSpacing: 16,
                        crossAxisSpacing: 16,
                        children: const [
                          ClipRRect(
                            borderRadius: BorderRadius.all(Radius.circular(8)),
                            child: Image(
                              image: AssetImage('assets/images/ucc_photo/about_three.jpg'),
                              fit: BoxFit.cover,
                            ),
                          ),
                          ClipRRect(
                            borderRadius: BorderRadius.all(Radius.circular(8)),
                            child: Image(
                              image: AssetImage('assets/images/ucc_photo/about_one.jpg'),
                              fit: BoxFit.cover,
                            ),
                          ),
                          ClipRRect(
                            borderRadius: BorderRadius.all(Radius.circular(8)),
                            child: Image(
                              image: AssetImage('assets/images/ucc_photo/about_two.jpg'),
                              fit: BoxFit.cover,
                            ),
                          ),
                          ClipRRect(
                            borderRadius: BorderRadius.all(Radius.circular(8)),
                            child: Image(
                              image: AssetImage('assets/images/ucc_photo/about_four.jpg'),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 24),
                      
                      // Additional Content
                      const Text(
                        'Through various skills and basic education, people with various disabilities at the Ubumwe Community Center (UCC) learn self-reliance and gain self-esteem. The Center assists over 900 people of both genders with a disability every year. Our successful programs have resulted in these numbers increasing every year. The UCC has the capacity to serve 256 individuals with disabilities each day. As the demand is still high, we conduct other programs, like home visits, to assist people in their homes, but we aren’t able to reach everyone.'
                        'In addition to the 900 people with disabilities, an additional 400 children without disabilities are enrolled at our inclusive school where they all study together in the same classes. The UCC uses this inclusive education method as a tool to integrate people with a disability into society (at both school and in the community). The Center has also expanded to serve members of the non-disabled community through both computer and literacy classes.\n\n'
                        'Wildlife conservation is taught in cooperation with the Columbus Zoo. The Center is close to Rwanda\'s remaining wild mountain gorillas. Classes at the UCC emphasize the importance of protecting both the gorillas and their habitat.\n\n'
                        'The Center survives on the generosity of individual donors and the income derived from the sales of its handicrafts. The goal, in time, is to become self-sustaining. Recent support to the UCC has led to the construction of a pre-school and a primary school that also provide inclusive education for both disabled and non-disabled students.',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.white70,
                          height: 1.5,
                        ),
                      ),
                      const SizedBox(height: 24),
                      
                      // Call to Action Button
                      ElevatedButton(
                        onPressed: () {
                          // Add navigation to contact page
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF00C897),
                          padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                        ),
                        child: const Text(
                          'Discover More',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Column(
              
            ),
          ],
        ),
      ),
    );
  }
}