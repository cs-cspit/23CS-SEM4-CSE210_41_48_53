// lib/pages/subject_page.dart
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:flutter_application_1/chapter_page.dart';

class SubjectPage extends StatefulWidget {
  final Map<String, dynamic> subject;

  const SubjectPage({super.key, required this.subject});

  @override
  State<SubjectPage> createState() => _SubjectPageState();
}

class _SubjectPageState extends State<SubjectPage> {
  // Generate dummy chapters based on subject
  List<Map<String, dynamic>> _generateChapters() {
    final int chapterCount = widget.subject['chapters'] as int;
    final List<Map<String, dynamic>> chapters = [];

    for (int i = 1; i <= chapterCount; i++) {
      chapters.add({
        'id': i,
        'title': 'Chapter $i',
        'subtitle': _getChapterSubtitle(widget.subject['name'], i),
        'completion': (i / chapterCount * 100).clamp(0, 100),
        'materials': 3 + (i % 3),
        'games': 2 + (i % 4),
      });
    }

    return chapters;
  }

  String _getChapterSubtitle(String subject, int chapterNum) {
    // Custom chapter subtitles based on subject
    final Map<String, List<String>> subjectChapters = {
      'Mathematics': [
        'Numbers and Operations',
        'Algebra Fundamentals',
        'Geometry Basics',
        'Data Analysis',
        'Probability',
        'Trigonometry',
        'Calculus Introduction',
        'Matrices',
      ],
      'Physics': [
        'Mechanics',
        'Thermodynamics',
        'Waves and Optics',
        'Electricity and Magnetism',
        'Modern Physics',
        'Fluid Dynamics',
      ],
      'Computer Science': [
        'Introduction to Programming',
        'Data Structures',
        'Algorithms',
        'Object-Oriented Programming',
        'Web Development',
        'Database Systems',
        'Computer Networks',
        'Artificial Intelligence',
        'Operating Systems',
        'Software Engineering',
      ],
      'Chemistry': [
        'Atomic Structure',
        'Periodic Table',
        'Chemical Bonding',
        'States of Matter',
        'Chemical Reactions',
        'Organic Chemistry',
        'Biochemistry',
      ],
      'Literature': [
        'Poetry Analysis',
        'Fiction Techniques',
        'Drama and Plays',
        'Literary Criticism',
        'World Literature',
      ],
      'History': [
        'Ancient Civilizations',
        'Medieval Period',
        'Renaissance',
        'Industrial Revolution',
        'World Wars',
        'Cold War Era',
        'Modern History',
        'Regional Studies',
      ],
    };

    final List<String> chapters = subjectChapters[subject] ?? [];
    if (chapterNum <= chapters.length) {
      return chapters[chapterNum - 1];
    }

    return 'Advanced Topics';
  }

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> chapters = _generateChapters();
    final Color subjectColor = widget.subject['color'] as Color;

    return Scaffold(
      backgroundColor: const Color(0xFFF5F7FA),
      body: CustomScrollView(
        slivers: [
          // Custom App Bar with Subject Details
          SliverAppBar(
            expandedHeight: 180.0,
            pinned: true,
            backgroundColor: subjectColor,
            flexibleSpace: FlexibleSpaceBar(
              background: Stack(
                children: [
                  // Background pattern
                  Positioned.fill(
                    child: Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: [subjectColor, subjectColor.withOpacity(0.8)],
                        ),
                      ),
                      child: Opacity(
                        opacity: 0.2,
                        child: CustomPaint(
                          painter: PatternPainter(),
                          size: Size.infinite,
                        ),
                      ),
                    ),
                  ),
                  // Subject info
                  Positioned(
                    left: 20,
                    bottom: 20,
                    right: 20,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Container(
                              padding: const EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                color: Colors.white.withOpacity(0.3),
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Icon(
                                widget.subject['icon'] as IconData,
                                color: Colors.white,
                                size: 32,
                              ),
                            ),
                            const SizedBox(width: 16),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  widget.subject['name'] as String,
                                  style: GoogleFonts.poppins(
                                    fontSize: 24,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                                Text(
                                  '${widget.subject['chapters']} chapters • ${widget.subject['games']} games',
                                  style: GoogleFonts.poppins(
                                    fontSize: 14,
                                    color: Colors.white.withOpacity(0.9),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              title: null,
            ),
            leading: IconButton(
              icon: const Icon(Icons.arrow_back, color: Colors.white),
              onPressed: () => Navigator.pop(context),
            ),
            actions: [
              IconButton(
                icon: const Icon(Icons.info_outline, color: Colors.white),
                onPressed: () {
                  // Show subject info dialog
                  showDialog(
                    context: context,
                    builder:
                        (context) => AlertDialog(
                          title: Text(
                            widget.subject['name'] as String,
                            style: GoogleFonts.poppins(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          content: Text(
                            'This subject contains ${widget.subject['chapters']} chapters with study materials and interactive games to help you master the content.',
                          ),
                          actions: [
                            TextButton(
                              onPressed: () => Navigator.pop(context),
                              child: const Text('OK'),
                            ),
                          ],
                        ),
                  );
                },
              ),
            ],
          ),

          // Chapters List
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(16.0, 24.0, 16.0, 0.0),
              child: Row(
                children: [
                  Text(
                    'Chapters',
                    style: GoogleFonts.poppins(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: const Color(0xFF2D3748),
                    ),
                  ),
                  const SizedBox(width: 8),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 5,
                    ),
                    decoration: BoxDecoration(
                      color: subjectColor.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Text(
                      '${chapters.length} total',
                      style: GoogleFonts.poppins(
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        color: subjectColor,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),

          // Chapters animated list
          SliverPadding(
            padding: const EdgeInsets.all(16.0),
            sliver: SliverAnimatedList(
              initialItemCount: chapters.length,
              itemBuilder: (context, index, animation) {
                final chapter = chapters[index];
                return SlideAnimation(
                  verticalOffset: 50.0,
                  child: FadeInAnimation(
                    child: GestureDetector(
                      onTap: () {
                        // Navigate to chapter details
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder:
                                (context) => ChapterPage(
                                  subject: widget.subject,
                                  chapter: chapter,
                                ),
                          ),
                        );
                      },
                      child: Container(
                        margin: const EdgeInsets.only(bottom: 12),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(16),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.1),
                              spreadRadius: 0,
                              blurRadius: 8,
                              offset: const Offset(0, 2),
                            ),
                          ],
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  // Chapter number indicator
                                  Container(
                                    padding: const EdgeInsets.all(8),
                                    decoration: BoxDecoration(
                                      color: subjectColor.withOpacity(0.1),
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    child: Text(
                                      '${chapter['id']}',
                                      style: GoogleFonts.poppins(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                        color: subjectColor,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(width: 16),
                                  // Chapter title and subtitle
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          chapter['title'] as String,
                                          style: GoogleFonts.poppins(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w600,
                                            color: const Color(0xFF2D3748),
                                          ),
                                        ),
                                        Text(
                                          chapter['subtitle'] as String,
                                          style: GoogleFonts.poppins(
                                            fontSize: 13,
                                            color: const Color(0xFF718096),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  // Chevron indicator
                                  Icon(
                                    Icons.chevron_right,
                                    color: subjectColor,
                                  ),
                                ],
                              ),
                              const SizedBox(height: 12),
                              // Progress indicator
                              LinearProgressIndicator(
                                value: (chapter['completion'] as double) / 100,
                                backgroundColor: const Color(0xFFE2E8F0),
                                color: subjectColor,
                                borderRadius: BorderRadius.circular(10),
                                minHeight: 6,
                              ),
                              const SizedBox(height: 12),
                              // Materials and games count
                              Row(
                                children: [
                                  Icon(
                                    Icons.book_outlined,
                                    size: 16,
                                    color: const Color(0xFF718096),
                                  ),
                                  const SizedBox(width: 4),
                                  Text(
                                    '${chapter['materials']} materials',
                                    style: GoogleFonts.poppins(
                                      fontSize: 12,
                                      color: const Color(0xFF718096),
                                    ),
                                  ),
                                  const SizedBox(width: 16),
                                  Icon(
                                    Icons.videogame_asset_outlined,
                                    size: 16,
                                    color: const Color(0xFF718096),
                                  ),
                                  const SizedBox(width: 4),
                                  Text(
                                    '${chapter['games']} games',
                                    style: GoogleFonts.poppins(
                                      fontSize: 12,
                                      color: const Color(0xFF718096),
                                    ),
                                  ),
                                  const Spacer(),
                                  Text(
                                    '${chapter['completion'].toInt()}% Complete',
                                    style: GoogleFonts.poppins(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w500,
                                      color: subjectColor,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

// Background pattern painter
class PatternPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint =
        Paint()
          ..color = Colors.white.withOpacity(0.2)
          ..style = PaintingStyle.stroke
          ..strokeWidth = 1.0;

    final double spacing = 20.0;

    // Draw grid lines
    for (double i = 0; i < size.width; i += spacing) {
      canvas.drawLine(Offset(i, 0), Offset(i, size.height), paint);
    }

    for (double i = 0; i < size.height; i += spacing) {
      canvas.drawLine(Offset(0, i), Offset(size.width, i), paint);
    }

    // Draw random circles
    final circlePaint =
        Paint()
          ..color = Colors.white.withOpacity(0.15)
          ..style = PaintingStyle.fill;

    final random = DateTime.now().millisecondsSinceEpoch;
    for (int i = 0; i < 10; i++) {
      final x = ((random + i * 7) % size.width.toInt()).toDouble();
      final y = ((random + i * 13) % size.height.toInt()).toDouble();
      final radius = 5.0 + (i * 3);
      canvas.drawCircle(Offset(x, y), radius, circlePaint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
