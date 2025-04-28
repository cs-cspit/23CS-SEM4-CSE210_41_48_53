import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';
import 'package:url_launcher/url_launcher.dart';
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:http/http.dart' as http;

class StorageService {
  final FirebaseStorage _storage = FirebaseStorage.instance;

  // Get all materials for a subject
  Future<List<MaterialItem>> getMaterialsForSubject(String subject) async {
    try {
      // List all files in the subject folder
      final ListResult result = await _storage.ref(subject).listAll();
      
      List<MaterialItem> materials = [];
      
      for (var item in result.items) {
        // Only process PDF files
        if (!item.name.toLowerCase().endsWith('.pdf')) continue;

        try {
          // Get the download URL
          String url = await item.getDownloadURL();
          // Get metadata
          final metadata = await item.getMetadata();
          
          materials.add(MaterialItem(
            name: _formatFileName(item.name),
            url: url,
            size: metadata.size ?? 0,
            updatedAt: metadata.updated ?? DateTime.now(),
            contentType: 'application/pdf',
          ));
        } catch (e) {
          debugPrint('Error processing file ${item.name}: $e');
          // Continue with next file if one fails
          continue;
        }
      }
      
      // Sort by most recent
      materials.sort((a, b) => b.updatedAt.compareTo(a.updatedAt));
      
      return materials;
    } catch (e) {
      debugPrint('Error getting materials: $e');
      rethrow;
    }
  }

  // Format file name for display (remove extension and format nicely)
  String _formatFileName(String fileName) {
    // Remove .pdf extension
    String nameWithoutExt = fileName.toLowerCase().replaceAll('.pdf', '');
    
    // Split by common separators
    List<String> parts = nameWithoutExt.split(RegExp(r'[_\-.]'));
    
    // Capitalize each word
    parts = parts.map((part) {
      if (part.isEmpty) return '';
      return part[0].toUpperCase() + part.substring(1);
    }).toList();
    
    // Join with spaces
    return parts.where((part) => part.isNotEmpty).join(' ');
  }

  // Download and open PPT file
  Future<void> downloadAndOpenPPT(String url, String fileName) async {
    try {
      // Get temporary directory
      final directory = await getTemporaryDirectory();
      final filePath = '${directory.path}/$fileName';
      
      // Download file
      final response = await http.get(Uri.parse(url));
      final file = File(filePath);
      await file.writeAsBytes(response.bodyBytes);
      
      // Open file with default app
      final uri = Uri.file(filePath);
      if (await canLaunchUrl(uri)) {
        await launchUrl(uri);
      } else {
        throw 'Could not open the file';
      }
    } catch (e) {
      debugPrint('Error downloading/opening file: $e');
      rethrow;
    }
  }

  // Get download URL for a specific file
  Future<String> getDownloadURL(String path) async {
    try {
      return await _storage.ref(path).getDownloadURL();
    } catch (e) {
      debugPrint('Error getting download URL: $e');
      rethrow;
    }
  }
}

class MaterialItem {
  final String name;
  final String url;
  final int size;
  final DateTime updatedAt;
  final String contentType;

  MaterialItem({
    required this.name,
    required this.url,
    required this.size,
    required this.updatedAt,
    required this.contentType,
  });

  // Convert size to readable format
  String get readableSize {
    final kb = size / 1024;
    if (kb < 1024) {
      return '${kb.toStringAsFixed(1)} KB';
    }
    final mb = kb / 1024;
    return '${mb.toStringAsFixed(1)} MB';
  }

  // Get formatted date
  String get formattedDate {
    return '${updatedAt.day}/${updatedAt.month}/${updatedAt.year}';
  }
} 