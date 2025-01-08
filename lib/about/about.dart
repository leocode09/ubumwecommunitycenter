import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

class AboutContent extends StatefulWidget {
  const AboutContent({super.key});

  @override
  State<AboutContent> createState() => _AboutContentState();
}

class _AboutContentState extends State<AboutContent>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late List<Animation<Offset>> _slideAnimations;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 1500),
      vsync: this,
    );

    // Create multiple slide animations with different delays
    _slideAnimations = List.generate(
      5,
      (index) => Tween<Offset>(
        begin: const Offset(0, 0.2),
        end: Offset.zero,
      ).animate(
        CurvedAnimation(
          parent: _controller,
          curve: Interval(
            index * 0.1, // Stagger the animations
            1.0,
            curve: Curves.easeOut,
          ),
        ),
      ),
    );

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final isDesktop = constraints.maxWidth > 1024;
        final isPad = constraints.maxWidth > 600 && constraints.maxWidth <= 1024;
        
        return SingleChildScrollView(
          child: Padding(
            // Adjust padding based on screen size
            padding: EdgeInsets.symmetric(
              horizontal: isDesktop ? 200.0 : isPad ? 32.0 : 16.0,
              vertical: 32.0,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                // Main content row - make it responsive
                isDesktop 
                  ? _buildDesktopLayout(context)
                  : _buildMobileLayout(context),
                
                const SizedBox(height: 60),
                
                // UCC Background Section - make it responsive
                SlideTransition(
                  position: _slideAnimations[3],
                  child: FadeTransition(
                    opacity: _controller,
                    child: _buildUCCSection(context, isDesktop),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildDesktopLayout(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Flexible(
          flex: 2,
          child: _buildMainContent(context),
        ),
        Flexible(
          flex: 1,
          child: _buildGenocideCard(context),
        ),
      ],
    );
  }

  Widget _buildMobileLayout(BuildContext context) {
    return Column(
      children: [
        _buildMainContent(context),
        _buildGenocideCard(context),
      ],
    );
  }

  Widget _buildMainContent(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Hero Image Section
        LayoutBuilder(
          builder: (context, constraints) {
            return SizedBox(
              width: constraints.maxWidth,
              child: FadeTransition(
                opacity: _controller,
                child: Stack(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(16),
                      child: SizedBox(
                        width: double.infinity,
                        height: 400,
                        child: Image.asset(
                          'assets/team.jpg',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 16,
                      left: 16,
                      child: Card(
                        color: Theme.of(context).colorScheme.secondary,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 12, vertical: 6),
                          child: Text(
                            'Building a dream',
                            style: GoogleFonts.caveat(
                              fontSize: 16,
                              fontStyle: FontStyle.italic,
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),

        // Title and Story Content
        SlideTransition(
          position: _slideAnimations[0],
          child: FadeTransition(
            opacity: _controller,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                'Frederick & Zacharie',
                style: GoogleFonts.nunito(
                  fontSize: 32,
                  fontWeight: FontWeight.w900,
                  color: const Color(0xFFFFD700),
                ),
              ),
            ),
          ),
        ),

        // Story Content
        SlideTransition(
          position: _slideAnimations[1],
          child: FadeTransition(
            opacity: _controller,
            child: const Padding(
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
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildGenocideCard(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return SizedBox(
          width: constraints.maxWidth,
          child: SlideTransition(
            position: _slideAnimations[2],
            child: FadeTransition(
              opacity: _controller,
              child: Container(
                margin: const EdgeInsets.all(16.0),
                padding: const EdgeInsets.all(32.0),
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 0, 0, 0),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'GENOCIDE - 1994',
                      style: TextStyle(
                        color: Color(0xFF008080),
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 32),
                    SizedBox(
                      width: double.infinity,
                      height: 100,
                      child: Image.asset(
                        'assets/rwanda-map.png',
                        fit: BoxFit.contain,
                      ),
                    ),
                    const SizedBox(height: 32),
                    const Text(
                      'A census carried out by the Rwandan ministry of Local Government in 2002 indicated that a total of 1,074,017 people were killed in the 100 days of the 1994 genocide. This census details names of the dead, dwelling place, age, and how they were killed.\n\n'
                      'Thousands more were maimed or mutilated as rebel attacks continued for a few years after the 1994 genocide. More than 300,000 children were separated from their families or orphaned.\n\n'
                      'Rwanda, a small, landlocked nation in Central Africa, was one of the poorest and most underdeveloped nations in the world just after the genocide.\n\n'
                      'In the new Rwanda Economic Update (REU), the World Bank projects economic growth rate of 7.4% in 2015 and 7.6% in 2016.\n\n'
                      'With the projected growth rates, the World Bank projects Rwanda\'s poverty rate to decline from 63% in 2011 to 54% in 2016, thus moving approximately one million people out of poverty.',
                      style: TextStyle(
                        color: Color(0xFFB7B7B7),
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildUCCSection(BuildContext context, bool isDesktop) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          isDesktop
              ? Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _buildImageStack(context),
                    _buildUCCContent(context),
                  ],
                )
              : Column(
                  children: [
                    _buildImageStack(context),
                    const SizedBox(height: 140),
                    _buildUCCContent(context),
                  ],
                ),
        ],
      ),
    );
  }

  Widget _buildImageStack(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final isDesktop = constraints.maxWidth > 1024;
        final stackWidth = isDesktop 
            ? MediaQuery.of(context).size.width * 0.4
            : constraints.maxWidth;
        
        // Adjust sizes based on screen width
        final imageSize = isDesktop ? 320.0 : 200.0;
        final borderWidth = isDesktop ? 300.0 : 200.0;
        final borderHeight = isDesktop ? 650.0 : 450.0;
        final spacing = isDesktop ? 200.0 : 120.0;
        
        return SizedBox(
          width: stackWidth,
          height: isDesktop ? 500 : 400,
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              // Bottom border
              Positioned(
                top: 10,
                left: isDesktop ? 100 : 50,
                child: Container(
                  width: borderWidth,
                  height: borderHeight,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(
                      color: Colors.amber,
                      width: 5,
                    ),
                  ),
                ),
              ),
              // First image
              Positioned(
                top: 80,
                left: spacing,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: SizedBox(
                    width: imageSize,
                    height: imageSize,
                    child: Image.asset(
                      'assets/about_three.jpg',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              // Second image
              Positioned(
                top: isDesktop ? 440 : 300,
                left: spacing,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: SizedBox(
                    width: imageSize,
                    height: imageSize,
                    child: Image.asset(
                      'assets/about_one.jpg',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              // Third image
              Positioned(
                top: isDesktop ? 260 : 190,
                left: isDesktop ? -20 : -10,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: SizedBox(
                    width: imageSize,
                    height: imageSize,
                    child: Image.asset(
                      'assets/main-slider-2-2.jpg',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              // Fourth image
              Positioned(
                top: isDesktop ? -100 : -50,
                left: isDesktop ? -20 : -10,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: SizedBox(
                    width: imageSize,
                    height: imageSize,
                    child: Image.asset(
                      'assets/about_two.jpg',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildUCCContent(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return ConstrainedBox(
          constraints: BoxConstraints(
            maxWidth: constraints.maxWidth > 1024
                ? MediaQuery.of(context).size.width * 0.3
                : constraints.maxWidth,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Title Section
              Text(
                'Disability is not Inability',
                style: GoogleFonts.caveat(
                  fontSize: 18,
                  color: const Color(
                      0xFF00C897), // Green accent color
                  fontStyle: FontStyle.italic,
                  fontWeight: FontWeight.w800,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                'Ubumwe Community Center Background',
                style: GoogleFonts.nunito(
                  fontSize: 32,
                  fontWeight: FontWeight.w900,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 24),

              // Additional Content
              const Text(
                'Through various skills and basic education, people with various disabilities at the Ubumwe Community Center (UCC) learn self-reliance and gain self-esteem. The Center assists over 900 people of both genders with a disability every year. Our successful programs have resulted in these numbers increasing every year. The UCC has the capacity to serve 256 individuals with disabilities each day. As the demand is still high, we conduct other programs, like home visits, to assist people in their homes, but we aren\'t able to reach everyone.\n\n'
                'In addition to the 900 people with disabilities, an additional 400 children without disabilities are enrolled at our inclusive school where they all study together in the same classes. The UCC uses this inclusive education method as a tool to integrate people with a disability into society (at both school and in the community). The Center has also expanded to serve members of the non-disabled community through both computer and literacy classes.\n\n'
                'Wildlife conservation is taught in cooperation with the Columbus Zoo. The Center is close to Rwanda\'s remaining wild mountain gorillas. Classes at the UCC emphasize the importance of protecting both the gorillas and their habitat.\n\n'
                'The Center survives on the generosity of individual donors and the income derived from the sales of its handicrafts. The goal, in time, is to become self-sustaining. Recent support to the UCC has led to the construction of a pre-school and a primary school that also provide inclusive education for both disabled and non-disabled students.',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.white70,
                  height: 1.5,
                ),
                softWrap: true,
                textAlign: TextAlign.justify,
              ),

              const SizedBox(height: 24),

              // Call to Action Button
              ElevatedButton(
                onPressed: () => context.go('/contact'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF00C897),
                  padding: const EdgeInsets.symmetric(
                      horizontal: 32, vertical: 16),
                ),
                child: const Text(
                  'Discover More',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Color(0xDDFFFFFF),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
