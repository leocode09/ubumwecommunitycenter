import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class EventGalleryCard extends HookConsumerWidget {
  const EventGalleryCard({
    required this.title,
    required this.images,
    required this.onSeeMoreTapped,
    required this.isDesktop,
    super.key,
  });

  final String title;
  final List<String> images;
  final VoidCallback onSeeMoreTapped;
  final bool isDesktop;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    if (images.isEmpty) return const SizedBox.shrink();

    return Material(
      color: Colors.transparent,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: double.infinity,
            color: Colors.black12,
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    title,
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                          color: Colors.white,
                          fontSize: isDesktop ? 24 : 18,
                        ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                TextButton.icon(
                  onPressed: onSeeMoreTapped,
                  icon: const Icon(
                    Icons.photo_library_outlined,
                    color: Colors.white,
                  ),
                  label: Text(
                    'More in Gallery',
                    style: Theme.of(context).textTheme.labelLarge?.copyWith(
                          color: Colors.white,
                        ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: isDesktop ? 24 : 16,
              vertical: 16,
            ),
            child: LayoutBuilder(
              builder: (context, constraints) {
                final imageWidth = _calculateImageWidth(
                  constraints.maxWidth,
                  isDesktop,
                );
                final imageHeight = imageWidth * 0.66; // 3:2 aspect ratio

                return Wrap(
                  spacing: isDesktop ? 16 : 8,
                  runSpacing: isDesktop ? 16 : 8,
                  children: [
                    for (final image in images)
                      GestureDetector(
                        onTap: onSeeMoreTapped,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: SizedBox(
                            width: imageWidth,
                            height: imageHeight,
                            child: Image.asset(
                              image,
                              fit: BoxFit.cover,
                              errorBuilder: (context, error, _) => Container(
                                color: Colors.grey[300],
                                child: const Icon(Icons.error),
                              ),
                            ),
                          ),
                        ),
                      ),
                  ],
                );
              },
            ),
          ),
          if (images.length > 3)
            Padding(
              padding: const EdgeInsets.only(bottom: 24),
              child: Center(
                child: TextButton.icon(
                  onPressed: onSeeMoreTapped,
                  icon: const Icon(Icons.launch),
                  label: Text(
                    'View All ${images.length} Photos',
                    style: Theme.of(context).textTheme.labelLarge,
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }

  double _calculateImageWidth(double containerWidth, bool isDesktop) {
    // Calculate number of images per row based on container width
    final spacing = isDesktop ? 16.0 : 8.0;
    int imagesPerRow;
    
    if (containerWidth > 1100) {
      imagesPerRow = 4;
    } else if (containerWidth > 800) {
      imagesPerRow = 3;
    } else if (containerWidth > 600) {
      imagesPerRow = 2;
    } else {
      imagesPerRow = 1;
    }

    // Calculate image width accounting for spacing
    final totalSpacing = spacing * (imagesPerRow - 1);
    return (containerWidth - totalSpacing) / imagesPerRow;
  }
}
