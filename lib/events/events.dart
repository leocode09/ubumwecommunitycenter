import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:url_launcher/url_launcher.dart';
import 'event_card.dart';

class EventsContent extends HookConsumerWidget {
  const EventsContent({super.key});

  static const _galleryLinks = [
    "https://ubumwecc.pixieset.com/seeyoulearns/",
    "https://ubumwecc.pixieset.com/imashinizaahaweabanyeshuribasoje2023-2024/",
    "https://ubumwecc.pixieset.com/daycamp/",
    "https://galleries.page.link/Z8fSk",
    "https://ubumwecommunitycenter18.pixieset.com/ucc/",
    "https://ubumwecc.pixieset.com/seeyoulearns/",
    "https://ubumwecc.pixieset.com/seeyoulearns/idpd2024/",
    "https://ubumwecommunitycenter18.pixieset.com/meetsupestarinucc/",
    "https://ubumwecc.pixieset.com/daycamp/",
    "https://ubumwecommunitycenter.pixieset.com/ucc-hcstriptokarongi/",
  ];

  String _getPreviewImage(String galleryUrl) {
    if (galleryUrl.contains('page.link')) {
      return 'assets/images/placeholder.jpg';
    }
    final uri = Uri.parse(galleryUrl);
    return '${uri.scheme}://${uri.host}${uri.path}thumb/';
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Event Galleries'),
      ),
      body: CustomScrollView(
        slivers: [
          SliverPadding(
            padding: const EdgeInsets.all(16),
            sliver: SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index) {
                  final galleryUrl = _galleryLinks[index];
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 16),
                    child: SizedBox(
                      height: 200,
                      child: EventGalleryCard(
                        images: [_getPreviewImage(galleryUrl)],
                        onSeeMoreTapped: () => _launchUrl(galleryUrl),
                      ),
                    ),
                  );
                },
                childCount: _galleryLinks.length,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _launchUrl(String url) async {
    try {
      if (!await launchUrl(Uri.parse(url))) {
        throw Exception('Could not launch $url');
      }
    } catch (e) {
      debugPrint('Error launching URL: $e');
    }
  }
}

class EventGalleryCard extends StatelessWidget {
  const EventGalleryCard({
    super.key,
    required this.images,
    required this.onSeeMoreTapped,
  });

  final List<String> images;
  final VoidCallback onSeeMoreTapped;

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAlias,
      child: Stack(
        fit: StackFit.expand,
        children: [
          Image.network(
            images.first,
            fit: BoxFit.cover,
            errorBuilder: (context, error, stackTrace) {
              return Container(
                color: Colors.grey[200],
                child: const Center(
                  child: Icon(
                    Icons.error_outline,
                    size: 40,
                    color: Colors.grey,
                  ),
                ),
              );
            },
            loadingBuilder: (context, child, loadingProgress) {
              if (loadingProgress == null) return child;
              return Center(
                child: CircularProgressIndicator(
                  value: loadingProgress.expectedTotalBytes != null
                      ? loadingProgress.cumulativeBytesLoaded /
                          loadingProgress.expectedTotalBytes!
                      : null,
                ),
              );
            },
          ),
          Positioned.fill(
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                onTap: onSeeMoreTapped,
                child: Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Colors.transparent,
                        Colors.black.withOpacity(0.5),
                      ],
                    ),
                  ),
                  child: const Align(
                    alignment: Alignment.bottomCenter,
                    child: Padding(
                      padding: EdgeInsets.all(16),
                      child: Text(
                        'See More',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
