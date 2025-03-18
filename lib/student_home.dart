// // previous code

// import 'package:flutter/material.dart';

// class StudentHome extends StatelessWidget {
//   const StudentHome({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Student Home'),
//         backgroundColor: const Color.fromARGB(255, 134, 201, 232),
//         actions: [
//           IconButton(
//             icon: const Icon(Icons.account_circle),
//             iconSize: 32.0,
//             color: const Color.fromARGB(255, 255, 255, 255),
//             onPressed: () {
//               Navigator.pushNamed(context, 'student_profile');
//             },
//           ),
//         ],
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: <Widget>[
//             TextField(
//               decoration: InputDecoration(
//                 prefixIcon: const Icon(Icons.search),
//                 hintText: 'Search subject, game, or anything...',
//                 border: OutlineInputBorder(
//                   borderRadius: BorderRadius.circular(8.0),
//                 ),
//               ),
//             ),
//             const SizedBox(height: 16.0),
//             ElevatedButton(
//               style: ElevatedButton.styleFrom(
//                 backgroundColor: const Color.fromARGB(235, 134, 201, 232),
//                 foregroundColor: const Color.fromARGB(255, 255, 255, 255),
//               ),
//               onPressed: () {
//                 // Navigate to all subjects screen
//               },
//               child: const Text('Show All Subjects'),
//             ),
//             const SizedBox(height: 16.0),
//             const Text(
//               'Trending Games',
//               style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//             ),
//             const SizedBox(height: 8.0),
//             // Carousel code removed
//           ],
//         ),
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: () {
//           Navigator.pushNamed(context, '/chatbot');
//         },
//         tooltip: 'Chatbot',
//         backgroundColor: const Color.fromARGB(255, 134, 201, 232),
//         child: const Icon(Icons.chat),
//       ),
//     );
//   }
// }

//updated code
// import 'package:flutter/material.dart';
// import 'package:carousel_slider/carousel_slider.dart';

// class StudentHome extends StatefulWidget {
//   const StudentHome({super.key});

//   @override
//   State<StudentHome> createState() => _StudentHomeState();
// }

// class _StudentHomeState extends State<StudentHome> {
//   // Dummy data for trending games
//   final List<Map<String, dynamic>> _trendingGames = [
//     {
//       'title': 'Physics Quiz Challenge',
//       'description': 'Test your knowledge of mechanics and electricity',
//       'image': 'assets/physics_quiz.png',
//       'participants': 234,
//     },
//     {
//       'title': 'Math Puzzle Race',
//       'description': 'Solve equations faster than your classmates',
//       'image': 'assets/math_puzzle.png',
//       'participants': 189,
//     },
//     {
//       'title': 'Programming Trivia',
//       'description': 'Fun questions about coding and computer science',
//       'image': 'assets/programming_trivia.png',
//       'participants': 156,
//     },
//     {
//       'title': 'History Timeline Challenge',
//       'description': 'Place historical events in the correct order',
//       'image': 'assets/history_timeline.png',
//       'participants': 122,
//     },
//   ];

//   // Dummy data for subjects
//   final List<Map<String, dynamic>> _subjects = [
//     {
//       'name': 'Mathematics',
//       'icon': Icons.calculate,
//       'color': Colors.blue,
//       'games': 12,
//     },
//     {
//       'name': 'Physics',
//       'icon': Icons.science,
//       'color': Colors.green,
//       'games': 8,
//     },
//     {
//       'name': 'Computer Science',
//       'icon': Icons.computer,
//       'color': Colors.purple,
//       'games': 15,
//     },
//     {
//       'name': 'Chemistry',
//       'icon': Icons.biotech,
//       'color': Colors.orange,
//       'games': 7,
//     },
//     {'name': 'Literature', 'icon': Icons.book, 'color': Colors.red, 'games': 9},
//     {
//       'name': 'History',
//       'icon': Icons.history_edu,
//       'color': Colors.brown,
//       'games': 6,
//     },
//   ];

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Student Home'),
//         backgroundColor: const Color.fromARGB(255, 134, 201, 232),
//         actions: [
//           IconButton(
//             icon: const Icon(Icons.notifications),
//             iconSize: 28.0,
//             color: Colors.white,
//             onPressed: () {
//               // Add notification functionality
//             },
//           ),
//           IconButton(
//             icon: const Icon(Icons.account_circle),
//             iconSize: 32.0,
//             color: Colors.white,
//             onPressed: () {
//               Navigator.pushNamed(context, 'student_profile');
//             },
//           ),
//         ],
//       ),
//       body: SingleChildScrollView(
//         child: Padding(
//           padding: const EdgeInsets.all(16.0),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: <Widget>[
//               // Search bar
//               TextField(
//                 decoration: InputDecoration(
//                   prefixIcon: const Icon(Icons.search),
//                   hintText: 'Search subject, game, or anything...',
//                   border: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(8.0),
//                   ),
//                 ),
//               ),
//               const SizedBox(height: 24.0),

//               // Welcome message with personalization
//               const Text(
//                 'Welcome back, Student!',
//                 style: TextStyle(
//                   fontSize: 24,
//                   fontWeight: FontWeight.bold,
//                   color: Color.fromARGB(255, 51, 51, 51),
//                 ),
//               ),
//               const SizedBox(height: 8.0),
//               const Text(
//                 'Continue your learning journey today',
//                 style: TextStyle(fontSize: 16, color: Colors.grey),
//               ),
//               const SizedBox(height: 24.0),

//               // Trending Games section
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   const Text(
//                     'Trending Games',
//                     style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
//                   ),
//                   TextButton(
//                     onPressed: () {
//                       // Navigate to all games screen
//                     },
//                     child: const Text('See All'),
//                   ),
//                 ],
//               ),
//               const SizedBox(height: 8.0),

//               // Carousel for trending games
//               CarouselSlider(
//                 options: CarouselOptions(
//                   height: 180.0,
//                   enlargeCenterPage: true,
//                   autoPlay: true,
//                   aspectRatio: 16 / 9,
//                   autoPlayCurve: Curves.fastOutSlowIn,
//                   enableInfiniteScroll: true,
//                   autoPlayAnimationDuration: const Duration(milliseconds: 800),
//                   viewportFraction: 0.8,
//                 ),
//                 items:
//                     _trendingGames.map((game) {
//                       return Builder(
//                         builder: (BuildContext context) {
//                           return GestureDetector(
//                             onTap: () {
//                               // Navigate to game details
//                             },
//                             child: Container(
//                               width: MediaQuery.of(context).size.width,
//                               margin: const EdgeInsets.symmetric(
//                                 horizontal: 5.0,
//                               ),
//                               decoration: BoxDecoration(
//                                 color: Colors.white,
//                                 borderRadius: BorderRadius.circular(10.0),
//                                 boxShadow: [
//                                   BoxShadow(
//                                     color: Colors.grey.withOpacity(0.3),
//                                     spreadRadius: 2,
//                                     blurRadius: 5,
//                                     offset: const Offset(0, 3),
//                                   ),
//                                 ],
//                               ),
//                               child: Stack(
//                                 children: [
//                                   ClipRRect(
//                                     borderRadius: BorderRadius.circular(10.0),
//                                     child: Image.asset(
//                                       game['image'],
//                                       fit: BoxFit.cover,
//                                       height: 180,
//                                       width: double.infinity,
//                                       errorBuilder: (
//                                         context,
//                                         error,
//                                         stackTrace,
//                                       ) {
//                                         return Container(
//                                           height: 180,
//                                           color: Colors.grey[300],
//                                           child: const Icon(
//                                             Icons.videogame_asset,
//                                             size: 64,
//                                           ),
//                                         );
//                                       },
//                                     ),
//                                   ),
//                                   Container(
//                                     decoration: BoxDecoration(
//                                       borderRadius: BorderRadius.circular(10.0),
//                                       gradient: LinearGradient(
//                                         begin: Alignment.topCenter,
//                                         end: Alignment.bottomCenter,
//                                         colors: [
//                                           Colors.transparent,
//                                           Colors.black.withOpacity(0.7),
//                                         ],
//                                       ),
//                                     ),
//                                   ),
//                                   Positioned(
//                                     bottom: 0,
//                                     left: 0,
//                                     right: 0,
//                                     child: Padding(
//                                       padding: const EdgeInsets.all(12.0),
//                                       child: Column(
//                                         crossAxisAlignment:
//                                             CrossAxisAlignment.start,
//                                         children: [
//                                           Text(
//                                             game['title'],
//                                             style: const TextStyle(
//                                               fontSize: 18,
//                                               fontWeight: FontWeight.bold,
//                                               color: Colors.white,
//                                             ),
//                                           ),
//                                           const SizedBox(height: 4.0),
//                                           Text(
//                                             game['description'],
//                                             style: const TextStyle(
//                                               fontSize: 14,
//                                               color: Colors.white70,
//                                             ),
//                                           ),
//                                           const SizedBox(height: 4.0),
//                                           Row(
//                                             children: [
//                                               const Icon(
//                                                 Icons.people,
//                                                 color: Colors.white70,
//                                                 size: 14,
//                                               ),
//                                               const SizedBox(width: 4.0),
//                                               Text(
//                                                 '${game['participants']} participants',
//                                                 style: const TextStyle(
//                                                   fontSize: 12,
//                                                   color: Colors.white70,
//                                                 ),
//                                               ),
//                                             ],
//                                           ),
//                                         ],
//                                       ),
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                             ),
//                           );
//                         },
//                       );
//                     }).toList(),
//               ),

//               const SizedBox(height: 24.0),

//               // Subjects section
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   const Text(
//                     'Subjects',
//                     style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
//                   ),
//                   TextButton(
//                     onPressed: () {
//                       // Navigate to all subjects screen
//                     },
//                     child: const Text('See All'),
//                   ),
//                 ],
//               ),
//               const SizedBox(height: 8.0),

//               // Grid view for subjects
//               GridView.builder(
//                 shrinkWrap: true,
//                 physics: const NeverScrollableScrollPhysics(),
//                 gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//                   crossAxisCount: 2,
//                   crossAxisSpacing: 16.0,
//                   mainAxisSpacing: 16.0,
//                   childAspectRatio: 1.4,
//                 ),
//                 itemCount: _subjects.length,
//                 itemBuilder: (context, index) {
//                   final subject = _subjects[index];
//                   return GestureDetector(
//                     onTap: () {
//                       // Navigate to subject details
//                     },
//                     child: Container(
//                       decoration: BoxDecoration(
//                         color: subject['color'].withOpacity(0.1),
//                         borderRadius: BorderRadius.circular(10.0),
//                         border: Border.all(
//                           color: subject['color'].withOpacity(0.3),
//                           width: 1.0,
//                         ),
//                       ),
//                       child: Padding(
//                         padding: const EdgeInsets.all(12.0),
//                         child: Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           mainAxisAlignment: MainAxisAlignment.center,
//                           children: [
//                             Icon(
//                               subject['icon'],
//                               color: subject['color'],
//                               size: 32,
//                             ),
//                             const SizedBox(height: 8.0),
//                             Text(
//                               subject['name'],
//                               style: const TextStyle(
//                                 fontSize: 16,
//                                 fontWeight: FontWeight.bold,
//                               ),
//                             ),
//                             const SizedBox(height: 4.0),
//                             Text(
//                               '${subject['games']} games',
//                               style: TextStyle(
//                                 fontSize: 12,
//                                 color: Colors.grey[600],
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                     ),
//                   );
//                 },
//               ),

//               const SizedBox(height: 24.0),

//               // Recent activity section
//               const Text(
//                 'Recent Activity',
//                 style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
//               ),
//               const SizedBox(height: 8.0),

//               // List of recent activities
//               ListView.builder(
//                 shrinkWrap: true,
//                 physics: const NeverScrollableScrollPhysics(),
//                 itemCount: 3, // Limit to 3 recent activities
//                 itemBuilder: (context, index) {
//                   return Card(
//                     margin: const EdgeInsets.only(bottom: 8.0),
//                     child: ListTile(
//                       leading: CircleAvatar(
//                         backgroundColor:
//                             Colors.primaries[index % Colors.primaries.length],
//                         child: Icon(
//                           [Icons.quiz, Icons.emoji_events, Icons.school][index],
//                           color: Colors.white,
//                         ),
//                       ),
//                       title: Text(
//                         [
//                           'Completed Physics Quiz',
//                           'Won Math Challenge',
//                           'Started CS Course',
//                         ][index],
//                         style: const TextStyle(fontWeight: FontWeight.bold),
//                       ),
//                       subtitle: Text(
//                         [
//                           'Score: 85/100',
//                           '1st place among 24 students',
//                           'Progress: 15%',
//                         ][index],
//                       ),
//                       trailing: Text(
//                         ['2h ago', 'Yesterday', '3d ago'][index],
//                         style: TextStyle(color: Colors.grey[600], fontSize: 12),
//                       ),
//                     ),
//                   );
//                 },
//               ),
//             ],
//           ),
//         ),
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: () {
//           // Implement chatbot functionality
//           showDialog(
//             context: context,
//             builder:
//                 (context) => AlertDialog(
//                   title: const Text('Chatbot Coming Soon'),
//                   content: const Text(
//                     'The AI chatbot assistant is under development.',
//                   ),
//                   actions: [
//                     TextButton(
//                       onPressed: () => Navigator.pop(context),
//                       child: const Text('OK'),
//                     ),
//                   ],
//                 ),
//           );
//         },
//         tooltip: 'Chatbot',
//         backgroundColor: const Color.fromARGB(255, 134, 201, 232),
//         child: const Icon(Icons.chat),
//       ),
//     );
//   }
// }

// lib/pages/student_home.dart
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'all_subjects_page.dart';
// import 'subject_page.dart';
import 'subject_details_page.dart'; // Add this line

class StudentHome extends StatefulWidget {
  const StudentHome({super.key});

  @override
  State<StudentHome> createState() => _StudentHomeState();
}

class _StudentHomeState extends State<StudentHome> {
  int _currentCarouselIndex = 0;

  // Dummy data for trending games
  final List<Map<String, dynamic>> _trendingGames = [
    {
      'title': 'DAA Quiz Challenge',
      'description': 'Test your knowledge of algorithms and data structures',
      'image': 'assets/physics_quiz.png',
      'participants': 234,
      'color': const Color(0xFF3498DB),
    },
    {
      'title': 'DAA Puzzle Race',
      'description': 'Solve Coding problems faster than your classmates',
      'image': 'assets/math_puzzle.png',
      'participants': 189,
      'color': const Color(0xFF9B59B6),
    },
    {
      'title': 'Programming Trivia',
      'description': 'Fun questions about coding and computer science',
      'image': 'assets/programming_trivia.png',
      'participants': 156,
      'color': const Color(0xFF2ECC71),
    },
    {
      'title': 'Python Timeline Challenge',
      'description': 'Test your knowledge of Python programming',
      'image': 'assets/history_timeline.png',
      'participants': 122,
      'color': const Color(0xFFE74C3C),
    },
  ];

  // Dummy data for subjects
  final List<Map<String, dynamic>> _subjects = [
    {
      'name': 'DAA',
      'icon': Icons.calculate,
      'color': const Color(0xFF3498DB),
      'games': 12,
      'chapters': 8,
    },
    {
      'name': 'DCN',
      'icon': Icons.science,
      'color': const Color(0xFF2ECC71),
      'games': 8,
      'chapters': 6,
    },
    {
      'name': 'Python',
      'icon': Icons.computer,
      'color': const Color(0xFF9B59B6),
      'games': 15,
      'chapters': 10,
    },
    {
      'name': 'DBMS',
      'icon': Icons.biotech,
      'color': const Color(0xFFE67E22),
      'games': 7,
      'chapters': 7,
    },
    {
      'name': 'SE',
      'icon': Icons.book,
      'color': const Color(0xFFE74C3C),
      'games': 9,
      'chapters': 5,
    },
    {
      'name': 'DSA',
      'icon': Icons.history_edu,
      'color': const Color(0xFF795548),
      'games': 6,
      'chapters': 8,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F7FA),
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            // App Bar
            SliverAppBar(
              expandedHeight: 120.0,
              floating: true,
              pinned: true,
              backgroundColor: Colors.white,
              elevation: 0,
              flexibleSpace: FlexibleSpaceBar(
                background: Container(
                  padding: const EdgeInsets.fromLTRB(16.0, 60.0, 16.0, 0.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Hello, Alex! 👋',
                        style: GoogleFonts.poppins(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: const Color(0xFF2D3748),
                        ),
                      ),
                      Text(
                        'Ready to learn something new today?',
                        style: GoogleFonts.poppins(
                          fontSize: 14,
                          color: const Color(0xFF718096),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              actions: [
                IconButton(
                  icon: Stack(
                    children: [
                      const Icon(Icons.notifications_none_rounded, size: 28),
                      Positioned(
                        right: 0,
                        top: 0,
                        child: Container(
                          padding: const EdgeInsets.all(2),
                          decoration: BoxDecoration(
                            color: Colors.red,
                            borderRadius: BorderRadius.circular(6),
                          ),
                          constraints: const BoxConstraints(
                            minWidth: 14,
                            minHeight: 14,
                          ),
                          child: const Text(
                            '3',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 8,
                              fontWeight: FontWeight.bold,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    ],
                  ),
                  color: const Color(0xFF2D3748),
                  onPressed: () {
                    // Add notification functionality
                  },
                ),
                const SizedBox(width: 8),
                Padding(
                  padding: const EdgeInsets.only(right: 16.0),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, 'student_profile');
                    },
                    child: CircleAvatar(
                      radius: 18,
                      backgroundColor: Colors.grey[200],
                      backgroundImage: const AssetImage(
                        'assets/profile_pic.jpg',
                      ),
                      onBackgroundImageError: (_, __) {},
                    ),
                  ),
                ),
              ],
            ),

            // Body Content
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    // Search bar
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12.0),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.1),
                            spreadRadius: 0,
                            blurRadius: 10,
                            offset: const Offset(0, 2),
                          ),
                        ],
                      ),
                      child: TextField(
                        decoration: InputDecoration(
                          prefixIcon: const Icon(
                            Icons.search,
                            color: Color(0xFF718096),
                          ),
                          hintText: 'Search for games, subjects...',
                          hintStyle: GoogleFonts.poppins(
                            color: const Color(0xFFA0AEC0),
                            fontSize: 14,
                          ),
                          border: InputBorder.none,
                          contentPadding: const EdgeInsets.symmetric(
                            vertical: 15,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 24.0),

                    // Trending Games section
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Trending Games',
                          style: GoogleFonts.poppins(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: const Color(0xFF2D3748),
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            // Navigate to all games screen
                          },
                          style: TextButton.styleFrom(
                            foregroundColor: const Color(0xFF5A6BF5),
                          ),
                          child: Text(
                            'See All',
                            style: GoogleFonts.poppins(
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 12.0),

                    // Carousel for trending games
                    Column(
                      children: [
                        CarouselSlider(
                          options: CarouselOptions(
                            height: 200.0,
                            enlargeCenterPage: true,
                            autoPlay: true,
                            aspectRatio: 16 / 9,
                            autoPlayCurve: Curves.fastOutSlowIn,
                            enableInfiniteScroll: true,
                            autoPlayAnimationDuration: const Duration(
                              milliseconds: 800,
                            ),
                            viewportFraction: 0.8,
                            onPageChanged: (index, reason) {
                              setState(() {
                                _currentCarouselIndex = index;
                              });
                            },
                          ),
                          items:
                              _trendingGames.map((game) {
                                return Builder(
                                  builder: (BuildContext context) {
                                    return GestureDetector(
                                      onTap: () {
                                        // Navigate to game details
                                      },
                                      child: Container(
                                        width:
                                            MediaQuery.of(context).size.width,
                                        margin: const EdgeInsets.symmetric(
                                          horizontal: 5.0,
                                        ),
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius: BorderRadius.circular(
                                            16.0,
                                          ),
                                          boxShadow: [
                                            BoxShadow(
                                              color: Colors.grey.withOpacity(
                                                0.15,
                                              ),
                                              spreadRadius: 0,
                                              blurRadius: 10,
                                              offset: const Offset(0, 4),
                                            ),
                                          ],
                                        ),
                                        child: ClipRRect(
                                          borderRadius: BorderRadius.circular(
                                            16.0,
                                          ),
                                          child: Stack(
                                            children: [
                                              // Image with fallback
                                              Positioned.fill(
                                                child: Image.asset(
                                                  game['image'],
                                                  fit: BoxFit.cover,
                                                  errorBuilder: (
                                                    context,
                                                    error,
                                                    stackTrace,
                                                  ) {
                                                    return Container(
                                                      color: game['color'],
                                                      child: Center(
                                                        child: Icon(
                                                          Icons.videogame_asset,
                                                          size: 64,
                                                          color: Colors.white
                                                              .withOpacity(0.6),
                                                        ),
                                                      ),
                                                    );
                                                  },
                                                ),
                                              ),
                                              // Gradient overlay
                                              Positioned.fill(
                                                child: Container(
                                                  decoration: BoxDecoration(
                                                    gradient: LinearGradient(
                                                      begin:
                                                          Alignment.topCenter,
                                                      end:
                                                          Alignment
                                                              .bottomCenter,
                                                      colors: [
                                                        Colors.transparent,
                                                        Colors.black
                                                            .withOpacity(0.8),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              // Game info
                                              Positioned(
                                                bottom: 0,
                                                left: 0,
                                                right: 0,
                                                child: Padding(
                                                  padding: const EdgeInsets.all(
                                                    16.0,
                                                  ),
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Text(
                                                        game['title'],
                                                        style:
                                                            GoogleFonts.poppins(
                                                              fontSize: 18,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                              color:
                                                                  Colors.white,
                                                            ),
                                                      ),
                                                      const SizedBox(
                                                        height: 4.0,
                                                      ),
                                                      Text(
                                                        game['description'],
                                                        style:
                                                            GoogleFonts.poppins(
                                                              fontSize: 13,
                                                              color: Colors
                                                                  .white
                                                                  .withOpacity(
                                                                    0.9,
                                                                  ),
                                                            ),
                                                        maxLines: 2,
                                                        overflow:
                                                            TextOverflow
                                                                .ellipsis,
                                                      ),
                                                      const SizedBox(
                                                        height: 8.0,
                                                      ),
                                                      Row(
                                                        children: [
                                                          const Icon(
                                                            Icons.people,
                                                            color: Colors.white,
                                                            size: 16,
                                                          ),
                                                          const SizedBox(
                                                            width: 4.0,
                                                          ),
                                                          Text(
                                                            '${game['participants']} participants',
                                                            style:
                                                                GoogleFonts.poppins(
                                                                  fontSize: 12,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500,
                                                                  color:
                                                                      Colors
                                                                          .white,
                                                                ),
                                                          ),
                                                          const Spacer(),
                                                          Container(
                                                            padding:
                                                                const EdgeInsets.symmetric(
                                                                  horizontal:
                                                                      12,
                                                                  vertical: 6,
                                                                ),
                                                            decoration: BoxDecoration(
                                                              color: Colors
                                                                  .white
                                                                  .withOpacity(
                                                                    0.25,
                                                                  ),
                                                              borderRadius:
                                                                  BorderRadius.circular(
                                                                    20,
                                                                  ),
                                                            ),
                                                            child: Text(
                                                              'Play Now',
                                                              style: GoogleFonts.poppins(
                                                                fontSize: 12,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600,
                                                                color:
                                                                    Colors
                                                                        .white,
                                                              ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    );
                                  },
                                );
                              }).toList(),
                        ),
                        const SizedBox(height: 12),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children:
                              _trendingGames.asMap().entries.map((entry) {
                                return Container(
                                  width: 8.0,
                                  height: 8.0,
                                  margin: const EdgeInsets.symmetric(
                                    horizontal: 4.0,
                                  ),
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color:
                                        _currentCarouselIndex == entry.key
                                            ? const Color(0xFF5A6BF5)
                                            : const Color(0xFFD1D5DB),
                                  ),
                                );
                              }).toList(),
                        ),
                      ],
                    ),

                    const SizedBox(height: 24.0),

                    // Subjects section - with animation
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Subjects',
                          style: GoogleFonts.poppins(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: const Color(0xFF2D3748),
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            // Navigate to all subjects screen
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder:
                                    (context) =>
                                        AllSubjectsPage(subjects: _subjects),
                              ),
                            );
                          },
                          style: TextButton.styleFrom(
                            foregroundColor: const Color(0xFF5A6BF5),
                          ),
                          child: Text(
                            'See All',
                            style: GoogleFonts.poppins(
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 12.0),

                    // Grid view for subjects with enhanced design and animation
                    AnimationLimiter(
                      child: GridView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              crossAxisSpacing: 16.0,
                              mainAxisSpacing: 16.0,
                              childAspectRatio: 1.4,
                            ),
                        itemCount: _subjects.length,
                        itemBuilder: (context, index) {
                          final subject = _subjects[index];
                          return AnimationConfiguration.staggeredGrid(
                            position: index,
                            duration: const Duration(milliseconds: 375),
                            columnCount: 2,
                            child: SlideAnimation(
                              child: FadeInAnimation(
                                child: GestureDetector(
                                  onTap: () {
                                    // Navigate to subject page
                                    // Navigator.push(
                                    //   context,
                                    //   MaterialPageRoute(
                                    //     builder:
                                    //         (context) =>
                                    //             SubjectPage(subject: subject),
                                    //   ),
                                    // );
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder:
                                            (context) => SubjectDetailsPage(
                                              subject: subject,
                                            ),
                                      ),
                                    );
                                  },
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(16.0),
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.grey.withOpacity(0.1),
                                          spreadRadius: 0,
                                          blurRadius: 10,
                                          offset: const Offset(0, 2),
                                        ),
                                      ],
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(16.0),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Container(
                                            padding: const EdgeInsets.all(10),
                                            decoration: BoxDecoration(
                                              color: subject['color']
                                                  .withOpacity(0.1),
                                              borderRadius:
                                                  BorderRadius.circular(12),
                                            ),
                                            child: Icon(
                                              subject['icon'],
                                              color: subject['color'],
                                              size: 24,
                                            ),
                                          ),
                                          const SizedBox(height: 12.0),
                                          Text(
                                            subject['name'],
                                            style: GoogleFonts.poppins(
                                              fontSize: 15,
                                              fontWeight: FontWeight.w600,
                                              color: const Color(0xFF2D3748),
                                            ),
                                          ),
                                          const SizedBox(height: 4.0),
                                          Row(
                                            children: [
                                              Text(
                                                '${subject['chapters']} chapters',
                                                style: GoogleFonts.poppins(
                                                  fontSize: 12,
                                                  color: const Color(
                                                    0xFF718096,
                                                  ),
                                                ),
                                              ),
                                              const SizedBox(width: 8),
                                              Container(
                                                width: 4,
                                                height: 4,
                                                decoration: const BoxDecoration(
                                                  shape: BoxShape.circle,
                                                  color: Color(0xFF718096),
                                                ),
                                              ),
                                              const SizedBox(width: 8),
                                              Text(
                                                '${subject['games']} games',
                                                style: GoogleFonts.poppins(
                                                  fontSize: 12,
                                                  color: const Color(
                                                    0xFF718096,
                                                  ),
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
                            ),
                          );
                        },
                      ),
                    ),
                    const SizedBox(height: 80.0), // Extra space for FAB
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          // Implement chatbot functionality
          showDialog(
            context: context,
            builder:
                (context) => AlertDialog(
                  title: Text(
                    'AI Study Assistant',
                    style: GoogleFonts.poppins(fontWeight: FontWeight.bold),
                  ),
                  content: const Text(
                    'The AI chatbot assistant is under development. It will help you with your studies soon!',
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
        icon: const Icon(Icons.psychology_alt),
        label: Text(
          'Study Assistant',
          style: GoogleFonts.poppins(fontWeight: FontWeight.w500),
        ),
        backgroundColor: const Color(0xFF5A6BF5),
        elevation: 4,
      ),
    );
  }
}
