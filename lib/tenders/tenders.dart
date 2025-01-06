import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pdfx/pdfx.dart';

// Create a separate widget for the PDF viewer
class PdfViewerWidget extends StatefulWidget {
  const PdfViewerWidget({super.key});

  @override
  State<PdfViewerWidget> createState() => _PdfViewerWidgetState();
}

class _PdfViewerWidgetState extends State<PdfViewerWidget> {
  PdfControllerPinch? _pdfPinchController;
  bool _isDisposed = false;

  @override
  void initState() {
    super.initState();
    _loadPdf();
  }

  Future<void> _loadPdf() async {
    if (_isDisposed) return;
    
    try {
      final doc = await PdfDocument.openAsset('assets/TenderNoticeEu2024.pdf');
      if (!_isDisposed && mounted) {
        setState(() {
          _pdfPinchController = PdfControllerPinch(
            document: Future.value(doc),
          );
        });
      }
    } catch (e) {
      if (mounted) {
        print('Error loading PDF: $e');
      }
    }
  }

  @override
  void dispose() {
    _isDisposed = true;
    if (_pdfPinchController != null) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        _pdfPinchController?.dispose();
      });
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (_pdfPinchController == null) {
      return const Center(child: CircularProgressIndicator());
    }

    return LayoutBuilder(
      builder: (context, constraints) {
        return SizedBox(
          width: constraints.maxWidth,
          height: constraints.maxHeight,
          child: PdfViewPinch(
            controller: _pdfPinchController!,
            onDocumentError: (error) {
              print('Error loading PDF: $error');
            },
            builders: PdfViewPinchBuilders<DefaultBuilderOptions>(
              options: const DefaultBuilderOptions(),
              documentLoaderBuilder: (_) => const Center(
                child: CircularProgressIndicator(),
              ),
              errorBuilder: (_, error) => Center(
                child: Text(error.toString()),
              ),
            ),
          ),
        );
      },
    );
  }
}

// Main TendersContent widget
class TendersContent extends StatelessWidget {
  const TendersContent({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
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
            child: const PdfViewerWidget(),
          ),
        ],
      ),
    );
  }
}
