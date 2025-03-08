// // import 'package:flutter/material.dart';

// // void main() {
// //   runApp(const MyApp());
// // }

// // class MyApp extends StatelessWidget {
// //   const MyApp({super.key});

// //   @override
// //   Widget build(BuildContext context) {
// //     return MaterialApp(
// //       title: 'Flutter Demo',
// //       theme: ThemeData(
// //         colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
// //         useMaterial3: true,
// //       ),
// //       home: const HomeScreen(),
// //     );
// //   }
// // }

// // class HomeScreen extends StatelessWidget {
// //   const HomeScreen({super.key});

// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       appBar: AppBar(
// //         title: const Text('Home Screen'),
// //         actions: [
// //           IconButton(
// //             icon: const Icon(Icons.account_circle),
// //             onPressed: () {
// //               // Navigate to profile screen
// //             },
// //           ),
// //         ],
// //       ),
// //       body: Padding(
// //         padding: const EdgeInsets.all(16.0),
// //         child: Column(
// //           crossAxisAlignment: CrossAxisAlignment.start,
// //           children: <Widget>[
// //             TextField(
// //               decoration: InputDecoration(
// //                 prefixIcon: const Icon(Icons.search),
// //                 hintText: 'Search subject, game, or anything...',
// //                 border: OutlineInputBorder(
// //                   borderRadius: BorderRadius.circular(8.0),
// //                 ),
// //               ),
// //             ),
// //             const SizedBox(height: 16.0),
// //             ElevatedButton(
// //               onPressed: () {
// //                 // Navigate to all subjects screen
// //               },
// //               child: const Text('Show All Subjects'),
// //             ),
// //             const SizedBox(height: 16.0),
// //             const Text(
// //               'Trending Games',
// //               style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
// //             ),
// //             const SizedBox(height: 8.0),
// //             // Carousel code removed
// //           ],
// //         ),
// //       ),
// //       floatingActionButton: FloatingActionButton(
// //         onPressed: () {
// //           Navigator.pushNamed(context, '/chatbot');
// //         },
// //         tooltip: 'Chatbot',
// //         child: const Icon(Icons.chat),
// //       ),
// //     );
// //   }
// // }

// ///2 code
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Assuming you have a way to determine the user's role
    // For example, you can pass the role as an argument or fetch it from a service
    const String userRole = 'student'; // or 'faculty'
    return Scaffold(
      appBar: AppBar(
        title: const Text('Hi User!'),
        backgroundColor: const Color.fromARGB(255, 134, 201, 232),
        actions: [
          IconButton(
            icon: const Icon(Icons.account_circle),
            iconSize: 32.0,
            color: const Color.fromARGB(255, 255, 255, 255),
            onPressed: () {
              // Navigate to profile screen
              if (userRole == 'student') {
                Navigator.pushNamed(context, 'student_profile');
              } else if (userRole == 'faculty') {
                Navigator.pushNamed(context, 'faculty_profile');
              }
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            TextField(
              decoration: InputDecoration(
                prefixIcon: const Icon(Icons.search),
                hintText: 'Search subject, game, or anything...',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
            ),
            const SizedBox(height: 16.0),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(235, 134, 201, 232),
                foregroundColor: const Color.fromARGB(255, 255, 255, 255),
              ),
              onPressed: () {
                // Navigate to all subjects screen
              },
              child: const Text('Show All Subjects'),
            ),
            const SizedBox(height: 16.0),
            const Text(
              'Trending Games',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8.0),
            // Carousel code removed
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, '/chatbot');
        },
        tooltip: 'Chatbot',
        backgroundColor: const Color.fromARGB(255, 134, 201, 232),
        child: const Icon(Icons.chat),
      ),
    );
  }
}
