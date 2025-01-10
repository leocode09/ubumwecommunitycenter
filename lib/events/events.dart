import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:url_launcher/url_launcher.dart';
import 'event_card.dart';

class EventsContent extends HookConsumerWidget {
  const EventsContent({super.key});

  // Updated gallery data to include event names
  static const _galleryData = {
    "See You Learns": {
      "url": "https://ubumwecc.pixieset.com/seeyoulearns/",
      "images": [
        'assets/event1/0E2A6183.jpg',
        'assets/event1/DSC_0004.jpg',
        'assets/event1/DSC_0006.jpg',
        'assets/event1/DSC_0012.jpg',
        'assets/event1/DSC_0014.jpg',
        'assets/event1/DSC_0022.jpg',
      ],
    },
    "Imashini Zaahwe Abanyeshuri Basoje 2023-2024": {
      "url":
          "https://ubumwecc.pixieset.com/imashinizahaweabanyeshuribasoje2023-2024/",
      "images": [
        'assets/event2/DSC_0043.jpg',
        'assets/event2/DSC_0052.jpg',
        'assets/event2/DSC_0083.jpg',
        'assets/event2/DSC_0096.jpg',
        'assets/event2/DSC_0102.jpg',
        'assets/event2/DSC_0120.jpg',
      ],
    },
    "Day Camp": {
      "url": "https://ubumwecc.pixieset.com/daycamp/",
      "images": [
        'assets/event3/0E2A0005.jpg',
        'assets/event3/0E2A0174.jpg',
        'assets/event3/0E2A9843.jpg',
        'assets/event3/0E2A9854.jpg',
        'assets/event3/DSC_0038.jpg',
        'assets/event3/DSC_0114.jpg',
        'assets/event3/DSC_0227.jpg',
        'assets/event3/DSC_0317.jpg',
        'assets/event3/DSC_0324.jpg',
        'assets/event3/DSC_0403.jpg',
        'assets/event3/FK0A0597.jpg',
        'assets/event3/FK0A0700.jpg',
        'assets/event3/FK0A0757.jpg',
        'assets/event3/FK0A0602.jpg',
      ],
    },
    "IDPD 2024": {
      "url": "https://ubumwecc.pixieset.com/seeyoulearns/idpd2024/",
      "images": [
        'assets/event4/Screenshot_20241205-160620.png',
        'assets/event4/WhatsAppImage2024-12-05at14.14.12(1).jpeg',
        'assets/event4/WhatsAppImage2024-12-05at14.14.17(1).jpeg',
        'assets/event4/WhatsAppImage2024-12-05at14.14.23.jpeg',
        'assets/event4/WhatsAppImage2024-12-05at14.14.24.jpeg',
        'assets/event4/WhatsAppImage2024-12-05at15.48.56.jpeg',
      ],
    },
    "UCC": {
      "url": "https://ubumwecommunitycenter18.pixieset.com/ucc/",
      "images": [
        'assets/event5/SEE_6275.jpg',
        'assets/event5/SEE_6286.jpg',
        'assets/event5/SEE_6291.jpg',
        'assets/event5/SEE_6294.jpg',
        'assets/event5/SEE_6304.jpg',
        'assets/event5/SEE_6307.jpg',
        'assets/event5/SEE_6323.jpg',
        'assets/event5/SEE_6327.jpg',
        'assets/event5/SEE_6333.jpg',
        'assets/event5/SEE_6335.jpg',
      ],
    },
    "UCC - HCS Trip to Karongi": {
      "url": "https://ubumwecommunitycenter.pixieset.com/ucc-hcstriptokarongi/",
      "images": [
        "assets/event8/522A7190.jpg",
        "assets/event8/522A7198.jpg",
        "assets/event8/522A7256.jpg",
        "assets/event8/522A7259.jpg",
        "assets/event8/522A7267.jpg",
        "assets/event8/522A7280.jpg",
        "assets/event8/522A7297.jpg",
        "assets/event8/522A7313.jpg",
        "assets/event8/522A7331.jpg",
        "assets/event8/522A7333.jpg"
      ],
    },
    "Meet Super Star in UCC": {
      "url": "https://ubumwecommunitycenter18.pixieset.com/meetsupestarinucc/",
      "images": [
        'assets/event6/SEE_6378.jpg',
        'assets/event6/SEE_6383.jpg',
        'assets/event6/SEE_6384.jpg',
        'assets/event6/SEE_6389.jpg',
        'assets/event6/SEE_6396.jpg',
        'assets/event6/SEE_6398.jpg',
        'assets/event6/SEE_6408.jpg',
        'assets/event6/SEE_6421.jpg',
        'assets/event6/SEE_6422.jpg',
        'assets/event6/SEE_6427.jpg',
        'assets/event6/SEE_6460.jpg',
        'assets/event6/SEE_6467.jpg',
        'assets/event6/SEE_6501.jpg',
        'assets/event6/SEE_6523.jpg',
      ],
    },
    "see you learns 2023": {
      "url": "https://ubumwecc.pixieset.com/seeyoulearns/idpd2023/",
      "images": [
        'assets/event7/DSC_0014.jpg',
        'assets/event7/DSC_0017.jpg',
        'assets/event7/DSC_0018.jpg',
        'assets/event7/DSC_0020.jpg',
        'assets/event7/DSC_0027.jpg',
        'assets/event7/DSC_0028.jpg',
        'assets/event7/DSC_0029.jpg',
        'assets/event7/DSC_0048.jpg',
      ],
    },
  };

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final isDesktop = constraints.maxWidth > 900;

        return Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(
            horizontal: isDesktop ? 24 : 16,
            vertical: 24,
          ),
          child: Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 1200),
              child: Column(
                children: [
                  for (final entry in _galleryData.entries)
                    EventGalleryCard(
                      title: entry.key,
                      images: entry.value["images"] as List<String>,
                      onSeeMoreTapped: () =>
                          _launchUrl(entry.value["url"] as String),
                      isDesktop: isDesktop,
                    ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Future<void> _launchUrl(String url) async {
    try {
      await launchUrl(Uri.parse(url));
    } catch (e) {
      debugPrint('Error launching URL: $e');
    }
  }
}
