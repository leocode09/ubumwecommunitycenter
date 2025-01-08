import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class EventGalleryCard extends HookConsumerWidget {
  const EventGalleryCard({
    required this.title,
    required this.images,
    required this.onSeeMoreTapped,
    super.key,
  });

  final String title;
  final List<String> images;
  final VoidCallback onSeeMoreTapped;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    if (images.isEmpty) return const SizedBox.shrink();

    return Material(
      color: Colors.transparent,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: Text(
              title,
              style: Theme.of(context).textTheme.titleMedium,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Wrap(
              spacing: 8,
              runSpacing: 8,
              children: [
                for (final image in images)
                  GestureDetector(
                    onTap: onSeeMoreTapped,
                    child: SizedBox(
                      width: 300,
                      height: 200,
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
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Center(
              child: TextButton.icon(
                onPressed: onSeeMoreTapped,
                icon: const Icon(Icons.launch),
                label: const Text('View Gallery'),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
