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
        'event1/0E2A6183.jpg',
        'event1/DSC_0004.jpg',
        'event1/DSC_0006.jpg',
        'event1/DSC_0012.jpg',
        'event1/DSC_0014.jpg',
        'event1/DSC_0022.jpg',
      ],
    },
    "Imashini Zaahwe Abanyeshuri Basoje 2023-2024": {
      "url": "https://ubumwecc.pixieset.com/imashinizahaweabanyeshuribasoje2023-2024/",
      "images": [
        'event2/DSC_0043.jpg',
        'event2/DSC_0052.jpg',
        'event2/DSC_0083.jpg',
        'event2/DSC_0096.jpg',
        'event2/DSC_0102.jpg',
        'event2/DSC_0120.jpg',
      ],
    },
    "Day Camp": {
      "url": "https://ubumwecc.pixieset.com/daycamp/",
      "images": [
        'event3/0E2A0005.jpg',
        'event3/0E2A0174.jpg', 
        'event3/0E2A9843.jpg',
        'event3/0E2A9854.jpg',
        'event3/DSC_0038.jpg',
        'event3/DSC_0114.jpg',
        'event3/DSC_0227.jpg',
        'event3/DSC_0317.jpg',
        'event3/DSC_0324.jpg',
        'event3/DSC_0403.jpg',
        'event3/FK0A0597.jpg',
        'event3/FK0A0700.jpg',
        'event3/FK0A0757.jpg',
        'event3/FK0A0602.jpg',
      ],
    },
    "IDPD 2024": {
      "url": "https://ubumwecc.pixieset.com/seeyoulearns/idpd2024/",
      "images": [
        'event4/Screenshot_20241205-160620.png',
        'event4/WhatsAppImage2024-12-05at14.14.12(1).jpeg',
        'event4/WhatsAppImage2024-12-05at14.14.17(1).jpeg',
        'event4/WhatsAppImage2024-12-05at14.14.23.jpeg',
        'event4/WhatsAppImage2024-12-05at14.14.24.jpeg',
        'event4/WhatsAppImage2024-12-05at15.48.56.jpeg',
      ],
    },
    "UCC": {
      "url": "https://ubumwecommunitycenter18.pixieset.com/ucc/",
      "images": [
        'event5/SEE_6275.jpg',
        'event5/SEE_6286.jpg', 
        'event5/SEE_6291.jpg',
        'event5/SEE_6294.jpg',
        'event5/SEE_6304.jpg',
        'event5/SEE_6307.jpg',
        'event5/SEE_6323.jpg',
        'event5/SEE_6327.jpg',
        'event5/SEE_6333.jpg',
        'event5/SEE_6335.jpg',
      ],
    },
    // "UCC - HCS Trip to Karongi": {
    //   "url": "https://ubumwecommunitycenter.pixieset.com/ucc-hcstriptokarongi/",
    //   "images": [
    //     'event1/0E2A6183.jpg',
    //     'event1/DSC_0004.jpg',
    //     'event1/DSC_0006.jpg',
    //   ],
    // },
    "Meet Super Star in UCC": {
      "url": "https://ubumwecommunitycenter18.pixieset.com/meetsupestarinucc/",
      "images": [
        'event6/SEE_6378.jpg',
        'event6/SEE_6383.jpg',
        'event6/SEE_6384.jpg',
        'event6/SEE_6389.jpg',
        'event6/SEE_6396.jpg',
        'event6/SEE_6398.jpg',
        'event6/SEE_6408.jpg',
        'event6/SEE_6421.jpg',
        'event6/SEE_6422.jpg',
        'event6/SEE_6427.jpg',
        'event6/SEE_6460.jpg',
        'event6/SEE_6467.jpg',
        'event6/SEE_6501.jpg',
        'event6/SEE_6523.jpg',
      ],
    },
    "see you learns 2023": {
      "url": "https://ubumwecc.pixieset.com/seeyoulearns/idpd2023/",
      "images": [
        'event7/DSC_0014.jpg',
        'event7/DSC_0017.jpg',
        'event7/DSC_0018.jpg',
        'event7/DSC_0020.jpg',
        'event7/DSC_0027.jpg',
        'event7/DSC_0028.jpg',
        'event7/DSC_0029.jpg',
        'event7/DSC_0048.jpg',
      ],
    },
  };

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      color: Theme.of(context).colorScheme.primary,
      width: double.infinity,
      child: Column(
        children: [
          for (final entry in _galleryData.entries)
            EventGalleryCard(
              title: entry.key,
              images: entry.value["images"] as List<String>,
              onSeeMoreTapped: () => _launchUrl(entry.value["url"] as String),
            ),
        ],
      ),
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
