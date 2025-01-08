import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class EventGalleryCard extends HookConsumerWidget {
  const EventGalleryCard({
    required this.images,
    required this.onSeeMoreTapped,
    this.maxPreviewImages = 3,
    super.key,
  });

  final List<String> images;
  final VoidCallback onSeeMoreTapped;
  final int maxPreviewImages;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    
    if (images.isEmpty) {
      return const SizedBox.shrink();
    }

    return Card(
      clipBehavior: Clip.antiAlias,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: Text(
              'Event Gallery',
              style: theme.textTheme.titleMedium,
            ),
          ),
          SizedBox(
            height: 120,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: images.length > maxPreviewImages 
                  ? maxPreviewImages + 1 
                  : images.length,
              itemBuilder: (context, index) {
                if (index == maxPreviewImages && images.length > maxPreviewImages) {
                  return _SeeMoreTile(
                    remainingCount: images.length - maxPreviewImages,
                    onTap: onSeeMoreTapped,
                  );
                }
                
                return _GalleryImageTile(
                  imageUrl: images[index],
                  onTap: onSeeMoreTapped,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class _GalleryImageTile extends StatelessWidget {
  const _GalleryImageTile({
    required this.imageUrl,
    required this.onTap,
  });

  final String imageUrl;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16, bottom: 16),
      child: GestureDetector(
        onTap: onTap,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: CachedNetworkImage(
            imageUrl: imageUrl,
            width: 120,
            height: 120,
            fit: BoxFit.cover,
            errorWidget: (context, url, error) => Container(
              width: 120,
              height: 120,
              color: Colors.grey[300],
              child: const Icon(Icons.error),
            ),
            placeholder: (context, url) => Container(
              width: 120,
              height: 120,
              color: Colors.grey[200],
              child: const Center(
                child: CircularProgressIndicator(),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _SeeMoreTile extends StatelessWidget {
  const _SeeMoreTile({
    required this.remainingCount,
    required this.onTap,
  });

  final int remainingCount;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    
    return Padding(
      padding: const EdgeInsets.only(left: 16, bottom: 16, right: 16),
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          width: 120,
          height: 120,
          decoration: BoxDecoration(
            color: theme.primaryColor.withOpacity(0.1),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.add_photo_alternate_outlined,
                size: 32,
                color: theme.primaryColor,
              ),
              const SizedBox(height: 8),
              Text(
                '+$remainingCount more',
                style: theme.textTheme.bodyMedium?.copyWith(
                  color: theme.primaryColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
