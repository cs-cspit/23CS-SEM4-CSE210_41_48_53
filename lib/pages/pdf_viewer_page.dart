import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';
import 'package:http/http.dart' as http;

class PDFViewerPage extends StatefulWidget {
  final String url;
  final String title;

  const PDFViewerPage({
    Key? key,
    required this.url,
    required this.title,
  }) : super(key: key);

  @override
  State<PDFViewerPage> createState() => _PDFViewerPageState();
}

class _PDFViewerPageState extends State<PDFViewerPage> {
  bool _isLoading = true;
  String? _errorMessage;
  late PdfViewerController _pdfViewerController;
  Key _pdfViewerKey = UniqueKey();
  String? _validatedUrl;

  @override
  void initState() {
    super.initState();
    _pdfViewerController = PdfViewerController();
    _validateUrl();
  }

  Future<void> _validateUrl() async {
    try {
      print('Original URL: ${widget.url}');
      
      // Clean the URL by removing any whitespace and line breaks
      String cleanUrl = widget.url.replaceAll(RegExp(r'\s+'), '');
      
      // Ensure the URL is properly encoded
      final uri = Uri.parse(cleanUrl);
      _validatedUrl = uri.toString();
      
      print('Cleaned URL: $cleanUrl');
      print('Validated URL: $_validatedUrl');
      
      final response = await http.head(uri);
      print('URL validation response status: ${response.statusCode}');
      
      if (response.statusCode != 200) {
        setState(() {
          _isLoading = false;
          _errorMessage = 'PDF not accessible (Status: ${response.statusCode})';
        });
      }
    } catch (e) {
      print('URL validation error: $e');
      setState(() {
        _isLoading = false;
        _errorMessage = 'Network error: $e';
      });
    }
  }

  void _refreshPdf() {
    setState(() {
      _isLoading = true;
      _errorMessage = null;
      _pdfViewerKey = UniqueKey(); // Create a new key to force widget rebuild
    });
    _validateUrl();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.title,
          style: GoogleFonts.poppins(
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
        backgroundColor: const Color(0xFF5A6BF5),
        foregroundColor: Colors.white,
        elevation: 0,
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: _refreshPdf,
          ),
        ],
      ),
      body: Stack(
        children: [
          if (_validatedUrl != null)
            SfPdfViewer.network(
              key: _pdfViewerKey,
              _validatedUrl!,
              controller: _pdfViewerController,
              onDocumentLoaded: (PdfDocumentLoadedDetails details) {
                print('PDF loaded successfully. Pages: ${details.document.pages.count}');
                setState(() {
                  _isLoading = false;
                  _errorMessage = null;
                });
              },
              onDocumentLoadFailed: (PdfDocumentLoadFailedDetails details) {
                print('PDF load failed: ${details.error}');
                setState(() {
                  _isLoading = false;
                  _errorMessage = 'Failed to load PDF: ${details.error}';
                });
              },
            ),
          if (_isLoading)
            const Center(
              child: CircularProgressIndicator(color: Color(0xFF5A6BF5)),
            ),
          if (_errorMessage != null)
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.error_outline, color: Colors.red.shade700, size: 48),
                  const SizedBox(height: 16),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 32),
                    child: Text(
                      _errorMessage!,
                      style: GoogleFonts.poppins(
                        color: Colors.red.shade700,
                        fontSize: 16,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  const SizedBox(height: 24),
                  ElevatedButton(
                    onPressed: () => Navigator.pop(context),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF5A6BF5),
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: Text(
                      'Go Back',
                      style: GoogleFonts.poppins(fontWeight: FontWeight.w500),
                    ),
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }
}
