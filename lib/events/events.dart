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
        'event1/0E2A6183.jpg',
        'event1/DSC_0004.jpg',
        'event1/DSC_0006.jpg',
      ],
    },
    "IDPD 2024": {
      "url": "https://ubumwecc.pixieset.com/seeyoulearns/idpd2024/",
      "images": [
        'event1/0E2A6183.jpg',
        'event1/DSC_0004.jpg',
        'event1/DSC_0006.jpg',
      ],
    },
    "UCC": {
      "url": "https://ubumwecommunitycenter18.pixieset.com/ucc/",
      "images": [
        'event1/0E2A6183.jpg',
        'event1/DSC_0004.jpg',
        'event1/DSC_0006.jpg',
      ],
    },
    "UCC - HCS Trip to Karongi": {
      "url": "https://ubumwecommunitycenter.pixieset.com/ucc-hcstriptokarongi/",
      "images": [
        'event1/0E2A6183.jpg',
        'event1/DSC_0004.jpg',
        'event1/DSC_0006.jpg',
      ],
    },
    "Meet Super Star in UCC": {
      "url": "https://ubumwecommunitycenter18.pixieset.com/meetsupestarinucc/",
      "images": [
        'event1/0E2A6183.jpg',
        'event1/DSC_0004.jpg',
        'event1/DSC_0006.jpg',
      ],
    },
    "IDPD 2023": {
      "url": "https://ubumwecc.pixieset.com/seeyoulearns/idpd2023/",
      "images": [
        'event1/0E2A6183.jpg',
        'event1/DSC_0004.jpg',
        'event1/DSC_0006.jpg',
      ],
    },
    "IDPD 2022": {
      "url": "https://ubumwecc.pixieset.com/seeyoulearns/idpd2022/",
      "images": [
        'event1/0E2A6183.jpg',
        'event1/DSC_0004.jpg',
        'event1/DSC_0006.jpg',
      ],
    },
    "IDPD 2021": {
      "url": "https://ubumwecc.pixieset.com/seeyoulearns/idpd2021/",
      "images": [
        'event1/0E2A6183.jpg',
        'event1/DSC_0004.jpg',
        'event1/DSC_0006.jpg',
      ],
    },
  };

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      color: Theme.of(context).colorScheme.primary,
      width: double.infinity,
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1200),
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Wrap(
              spacing: 16,
              runSpacing: 16,
              alignment: WrapAlignment.center,
              children: [
                for (final entry in _galleryData.entries)
                  SizedBox(
                    width: 380,
                    child: EventGalleryCard(
                      title: entry.key,
                      images: entry.value["images"] as List<String>,
                      onSeeMoreTapped: () => _launchUrl(entry.value["url"] as String),
                    ),
                  ),
              ],
            ),
          ),
        ),
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
