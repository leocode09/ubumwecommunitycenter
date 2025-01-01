import 'package:flutter/material.dart';
// import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';
// Or import 'package:flutter_pdfview/flutter_pdfview.dart';

class TendersContent extends StatelessWidget {
  const TendersContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1A2C31), // Dark green background
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header Section
            Container(
              padding: const EdgeInsets.all(24.0),
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Ubumwe Community Center',
                    style: TextStyle(
                      fontSize: 18,
                      color: Color(0xFFFFD700), // Golden yellow
                      fontStyle: FontStyle.italic,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 8),
                  Text(
                    'New Tender Notices',
                    style: TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),

            // PDF Viewer Section
            // Expanded(
            //   child: Container(
            //     margin: const EdgeInsets.all(16),
            //     decoration: BoxDecoration(
            //       color: Colors.grey[850],
            //       borderRadius: BorderRadius.circular(8),
            //     ),
            //     child: SfPdfViewer.asset(
            //       'assets/TenderNoticeEu2024.pdf',
            //       // Customize the appearance
            //       pageSpacing: 0,
            //       // Add toolbar
            //       canShowPaginationDialog: true,
            //       canShowScrollHead: true,
            //       enableDoubleTapZooming: true,
            //     ),
            //   ),
            // ),
            
          ],
        ),
      ),
    );
  }
}
