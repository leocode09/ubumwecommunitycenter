import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'dart:math' as math;

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

    return Container(
      margin: const EdgeInsets.symmetric(vertical: 16),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.05),
        borderRadius: BorderRadius.circular(12),
      ),
      clipBehavior: Clip.antiAlias,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: double.infinity,
            color: Colors.black26,
            padding: EdgeInsets.all(isDesktop ? 16 : 12),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    title,
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                          color: Colors.white,
                          fontSize: isDesktop ? 24 : 16,
                          fontWeight: FontWeight.w500,
                        ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                TextButton.icon(
                  onPressed: onSeeMoreTapped,
                  style: TextButton.styleFrom(
                    backgroundColor: Colors.white.withOpacity(0.1),
                    padding: EdgeInsets.symmetric(
                      horizontal: isDesktop ? 16 : 12,
                      vertical: isDesktop ? 8 : 6,
                    ),
                  ),
                  icon: Icon(
                    Icons.photo_library_outlined,
                    color: Colors.white,
                    size: isDesktop ? 20 : 16,
                  ),
                  label: Text(
                    isDesktop ? 'More in Gallery' : 'Gallery',
                    style: Theme.of(context).textTheme.labelLarge?.copyWith(
                          color: Colors.white,
                          fontSize: isDesktop ? null : 12,
                        ),
                  ),
                ),
              ],
            ),
          ),
          MouseRegion(
            cursor: SystemMouseCursors.click,
            child: GestureDetector(
              onTap: onSeeMoreTapped,
              child: LayoutBuilder(
                builder: (context, constraints) {
                  final width = constraints.maxWidth;
                  final height = isDesktop ? width * 0.5 : width * 0.75; // Taller ratio for mobile
                  final thumbnailSize = isDesktop ? 80.0 : 60.0;
                  final thumbnailSpacing = isDesktop ? 8.0 : 6.0;
                  final thumbnailBorderWidth = isDesktop ? 2.0 : 1.5;
                  
                  return SizedBox(
                    height: height,
                    child: Stack(
                      fit: StackFit.expand,
                      children: [
                        // Main large image
                        if (images.isNotEmpty)
                          Positioned.fill(
                            child: Image.asset(
                              images[0],
                              fit: BoxFit.cover,
                              errorBuilder: (context, error, stackTrace) {
                                debugPrint('Error loading image: $error');
                                return Container(
                                  color: Colors.grey[800],
                                  child: const Center(
                                    child: Icon(Icons.error_outline, color: Colors.white),
                                  ),
                                );
                              },
                            ),
                          ),
                        // Overlay gradient
                        Positioned.fill(
                          child: Container(
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                begin: Alignment.centerLeft,
                                end: Alignment.centerRight,
                                colors: [
                                  Colors.black.withOpacity(0.7),
                                  Colors.black.withOpacity(0.3),
                                  Colors.transparent,
                                ],
                              ),
                            ),
                          ),
                        ),
                        // Smaller overlapping images
                        if (images.length > 1)
                          Positioned(
                            left: isDesktop ? 16 : 12,
                            bottom: isDesktop ? 16 : 12,
                            child: Row(
                              children: [
                                for (var i = 1; i < math.min(4, images.length); i++)
                                  Container(
                                    margin: EdgeInsets.only(right: thumbnailSpacing),
                                    width: thumbnailSize,
                                    height: thumbnailSize,
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                        color: Colors.white,
                                        width: thumbnailBorderWidth,
                                      ),
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.black.withOpacity(0.3),
                                          blurRadius: 8,
                                        ),
                                      ],
                                    ),
                                    child: Image.asset(
                                      images[i],
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                              ],
                            ),
                          ),
                        // Image count indicator
                        if (images.length > 4)
                          Positioned(
                            left: isDesktop ? 16 + (3 * 88) : 12 + (3 * 66),
                            bottom: isDesktop ? 16 : 12,
                            child: Container(
                              width: thumbnailSize,
                              height: thumbnailSize,
                              decoration: BoxDecoration(
                                color: Colors.black54,
                                border: Border.all(
                                  color: Colors.white,
                                  width: thumbnailBorderWidth,
                                ),
                              ),
                              child: Center(
                                child: Text(
                                  '+${images.length - 3}',
                                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: isDesktop ? null : 20,
                                      ),
                                ),
                              ),
                            ),
                          ),
                        // View gallery overlay
                        Center(
                          child: Container(
                            padding: EdgeInsets.symmetric(
                              horizontal: isDesktop ? 24 : 16,
                              vertical: isDesktop ? 12 : 8,
                            ),
                            decoration: BoxDecoration(
                              color: Colors.black87,
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Icon(
                                  Icons.photo_library_outlined,
                                  color: Colors.white,
                                  size: isDesktop ? 24 : 20,
                                ),
                                SizedBox(width: isDesktop ? 8 : 6),
                                Text(
                                  'View Gallery',
                                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                                        color: Colors.white,
                                        fontSize: isDesktop ? null : 14,
                                      ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

}
