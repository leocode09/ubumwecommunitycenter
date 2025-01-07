import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// Replace PdfViewerWidget with ImageDisplayWidget
class ImageDisplayWidget extends StatelessWidget {
  const ImageDisplayWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Image.asset(
            'assets/TenderNoticeEu2024-1.png',
            // Make images responsive
            width: double.infinity,
            fit: BoxFit.contain,
          ),
          const SizedBox(height: 16),
          Image.asset(
            'assets/TenderNoticeEu2024-2.png',
            width: double.infinity,
            fit: BoxFit.contain,
          ),
        ],
      ),
    );
  }
}

// Main TendersContent widget
class TendersContent extends StatelessWidget {
  const TendersContent({super.key});

  @override
  Widget build(BuildContext context) {
    // Get screen width for responsive layout
    final screenWidth = MediaQuery.of(context).size.width;
    final isDesktop = screenWidth > 600;

    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Header Section
          Container(
            width: double.infinity,
            padding: EdgeInsets.all(isDesktop ? 24.0 : 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'Ubumwe Community Center',
                  style: GoogleFonts.caveat(
                    fontSize: isDesktop ? 24 : 20,
                    color: const Color(0xFFFFD700),
                    fontWeight: FontWeight.w800,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 8),
                Text(
                  'New Tender Notices',
                  style: GoogleFonts.nunito(
                    fontSize: isDesktop ? 40 : 28,
                    fontWeight: FontWeight.w900,
                    color: Colors.white,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),

          // Content Section
          Container(
            key: const ValueKey('pdf_viewer_container'),
            width: isDesktop 
                ? MediaQuery.of(context).size.width * 0.6
                : MediaQuery.of(context).size.width * 0.9,
            alignment: Alignment.center,
            margin: EdgeInsets.all(isDesktop ? 16 : 8),
            // Remove fixed height to make it responsive
            decoration: BoxDecoration(
              color: Colors.grey[850],
              borderRadius: BorderRadius.circular(8),
            ),
            child: const ImageDisplayWidget(),
          ),
        ],
      ),
    );
  }
}
