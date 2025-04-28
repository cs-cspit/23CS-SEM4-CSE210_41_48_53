import 'package:flutter/material.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'pages/pdf_viewer_page.dart';
import 'package:http/http.dart' as http;

class ChapterPage extends StatefulWidget {
  final Map<String, dynamic> subject;
  final Map<String, dynamic> chapter;

  const ChapterPage({Key? key, required this.subject, required this.chapter}) : super(key: key);

  @override
  State<ChapterPage> createState() => _ChapterPageState();
}

class _ChapterPageState extends State<ChapterPage> {
  late Future<List<String>> _materialsFuture;
  late Future<List<Map<String, dynamic>>> _gamesFuture;

  @override
  void initState() {
    super.initState();
    _materialsFuture = _fetchMaterials();
    _gamesFuture = _fetchGames();
  }

  Future<List<String>> _fetchMaterials() async {
    try {
      final formattedSubject = widget.subject['name'].toString().toUpperCase();
      final ref = FirebaseStorage.instance.ref('materials/$formattedSubject');
      final result = await ref.listAll();

      final chapterId = widget.chapter['id'].toString();
      final List<String> fileNames = result.items
          .map((item) => item.name)
          .where((name) => name.toLowerCase().contains('chapter$chapterId') ||
                           name.toLowerCase().contains('unit$chapterId'))
          .toList();

      return fileNames;
    } catch (e) {
      print('Error fetching materials: $e');
      return [];
    }
  }

  Future<String?> _getDownloadUrl(String fileName) async {
    try {
      final formattedSubject = widget.subject['name'].toString().toUpperCase();
      final ref = FirebaseStorage.instance.ref('materials/$formattedSubject/$fileName');
      return await ref.getDownloadURL();
    } catch (e) {
      print('Error getting download URL for $fileName: $e');
      return null;
    }
  }

  Future<List<Map<String, dynamic>>> _fetchGames() async {
    try {
      final formattedSubject = widget.subject['name'].toString().toUpperCase();
      final chapterId = widget.chapter['id'].toString();
      final path = 'materials/$formattedSubject/game$chapterId.txt';
      
      print('Fetching game from path: $path');
      
      final ref = FirebaseStorage.instance.ref(path);
      final url = await ref.getDownloadURL();
      
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        final content = response.body.trim();
        if (content.isEmpty) return [];

        final lines = content.split('\n');
        if (lines.isEmpty) return [];

        final title = lines.first.trim();
        final body = lines.skip(1).join('\n').trim();

        return [
          {
            'title': title,
            'description': body,
          }
        ];
      } else {
        print('Failed to load game. Status: ${response.statusCode}');
        return [];
      }
    } catch (e) {
      print('Error fetching game: $e');
      return [];
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${widget.subject['name']} - ${widget.chapter['title']}'),
        backgroundColor: const Color(0xFF5A6BF5),
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Materials Section with Card Container
            Container(
              margin: const EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.2),
                    spreadRadius: 1,
                    blurRadius: 6,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: const EdgeInsets.all(16.0),
                    decoration: const BoxDecoration(
                      color: Color(0xFF5A6BF5),
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(12),
                        topRight: Radius.circular(12),
                      ),
                    ),
                    child: Row(
                      children: [
                        const Icon(
                          Icons.book,
                          color: Colors.white,
                          size: 24,
                        ),
                        const SizedBox(width: 12),
                        Text(
                          'Study Materials',
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                  _buildMaterialsSection(),
                ],
              ),
            ),
            
            // Games Section with Card Container
            Container(
              margin: const EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.2),
                    spreadRadius: 1,
                    blurRadius: 6,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: const EdgeInsets.all(16.0),
                    decoration: const BoxDecoration(
                      color: Color(0xFFF5A623),  // Different color for games section
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(12),
                        topRight: Radius.circular(12),
                      ),
                    ),
                    child: Row(
                      children: [
                        const Icon(
                          Icons.games,
                          color: Colors.white,
                          size: 24,
                        ),
                        const SizedBox(width: 12),
                        Text(
                          'Games & Activities',
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                  _buildGamesSection(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMaterialsSection() {
    return FutureBuilder<List<String>>(
      future: _materialsFuture,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: Padding(
              padding: EdgeInsets.all(32.0),
              child: CircularProgressIndicator(color: Color(0xFF5A6BF5)),
            ),
          );
        }
        if (snapshot.hasError) {
          return const Center(
            child: Padding(
              padding: EdgeInsets.all(32.0),
              child: Text('Error loading materials.'),
            ),
          );
        }
        final materials = snapshot.data ?? [];
        if (materials.isEmpty) {
          return const Padding(
            padding: EdgeInsets.all(24.0),
            child: Center(
              child: Column(
                children: [
                  Icon(Icons.info_outline, size: 48, color: Colors.grey),
                  SizedBox(height: 16),
                  Text(
                    'No materials found for this chapter.',
                    style: TextStyle(fontSize: 16, color: Colors.grey),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          );
        }

        return ListView.separated(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: materials.length,
          separatorBuilder: (context, index) => const Divider(height: 1),
          itemBuilder: (context, index) {
            final fileName = materials[index];
            return Material(
              color: Colors.transparent,
              child: InkWell(
                onTap: () async {
                  final url = await _getDownloadUrl(fileName);
                  if (url != null && mounted) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => PDFViewerPage(url: url, title: fileName),
                      ),
                    );
                  } else {
                    if (mounted) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Failed to load PDF'),
                          backgroundColor: Colors.red,
                        ),
                      );
                    }
                  }
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 16.0),
                  child: Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: const Color(0xFF5A6BF5).withOpacity(0.1),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: const Icon(
                          Icons.picture_as_pdf,
                          color: Color(0xFF5A6BF5),
                          size: 24,
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: Text(
                          fileName,
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      const Icon(Icons.arrow_forward_ios, size: 16, color: Colors.grey),
                    ],
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }

  Widget _buildGamesSection() {
    return FutureBuilder<List<Map<String, dynamic>>>(
      future: _gamesFuture,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: Padding(
              padding: EdgeInsets.all(32.0),
              child: CircularProgressIndicator(color: Color(0xFFF5A623)),
            ),
          );
        }
        if (snapshot.hasError) {
          return const Center(
            child: Padding(
              padding: EdgeInsets.all(32.0),
              child: Text('Error loading games.'),
            ),
          );
        }
        final games = snapshot.data ?? [];
        if (games.isEmpty) {
          return const Padding(
            padding: EdgeInsets.all(24.0),
            child: Center(
              child: Column(
                children: [
                  Icon(Icons.games_outlined, size: 48, color: Colors.grey),
                  SizedBox(height: 16),
                  Text(
                    'No games available for this chapter.',
                    style: TextStyle(fontSize: 16, color: Colors.grey),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          );
        }

        return ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: games.length,
          itemBuilder: (context, index) {
            final game = games[index];
            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: Material(
                color: Colors.transparent,
                child: ExpansionTile(
                  tilePadding: const EdgeInsets.all(16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                    side: BorderSide(color: Colors.grey.withOpacity(0.2)),
                  ),
                  collapsedShape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                    side: BorderSide(color: Colors.grey.withOpacity(0.2)),
                  ),
                  leading: const CircleAvatar(
                    backgroundColor: Color(0xFFF5A623),
                    child: Icon(Icons.extension, color: Colors.white),
                  ),
                  title: Text(
                    game['title'] ?? '',
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                  subtitle: Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: Text(
                      'Tap to view activity details',
                      style: TextStyle(color: Colors.grey[600], fontSize: 14),
                    ),
                  ),
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Container(
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: Colors.grey.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Text(
                          game['description'] ?? '',
                          style: const TextStyle(fontSize: 16, height: 1.5),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }
}
