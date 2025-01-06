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
          Image.asset('assets/TenderNoticeEu2024-1.png'),
          const SizedBox(height: 16),
          Image.asset('assets/TenderNoticeEu2024-2.png'),
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
    return SingleChildScrollView(
      child: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Header Section
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(24.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'Ubumwe Community Center',
                      style: GoogleFonts.caveat(
                        fontSize: 24,
                        color: const Color(0xFFFFD700),
                        fontWeight: FontWeight.w800,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'New Tender Notices',
                      style: GoogleFonts.nunito(
                        fontSize: 40,
                        fontWeight: FontWeight.w900,
                        color: Colors.white,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),

              // PDF Viewer Section
              Container(
                key: const ValueKey('pdf_viewer_container'),
                width: MediaQuery.of(context).size.width * 0.6,
                alignment: Alignment.center,
                margin: const EdgeInsets.all(16),
                height: 2200,
                decoration: BoxDecoration(
                  color: Colors.grey[850],
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const ImageDisplayWidget(),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
