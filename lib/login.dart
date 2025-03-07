// // import 'package:flutter/material.dart';

// // class MyLogin extends StatefulWidget {
// //   const MyLogin({super.key});

// //   @override
// //   MyLoginState createState() => MyLoginState();
// // }

// // class MyLoginState extends State<MyLogin> {
// //   @override
// //   Widget build(BuildContext context) {
// //     return Container(
// //       decoration: const BoxDecoration(
// //         image: DecorationImage(
// //           image: AssetImage('assets/login.png'),
// //           fit: BoxFit.cover,
// //         ),
// //       ),
// //       child: Scaffold(
// //         backgroundColor: Colors.transparent,
// //         body: Stack(
// //           children: [
// //             Container(),
// //             Container(
// //               padding: const EdgeInsets.only(left: 35, top: 130),
// //               child: const Text(
// //                 'Welcome\nBack',
// //                 style: TextStyle(color: Colors.white, fontSize: 33),
// //               ),
// //             ),
// //             SingleChildScrollView(
// //               child: Container(
// //                 padding: EdgeInsets.only(
// //                   top: MediaQuery.of(context).size.height * 0.5,
// //                 ),
// //                 child: Column(
// //                   crossAxisAlignment: CrossAxisAlignment.start,
// //                   children: [
// //                     Container(
// //                       margin: const EdgeInsets.only(left: 35, right: 35),
// //                       child: Column(
// //                         children: [
// //                           TextField(
// //                             style: const TextStyle(color: Colors.black),
// //                             decoration: InputDecoration(
// //                               fillColor: Colors.grey.shade100,
// //                               filled: true,
// //                               hintText: "Email",
// //                               border: OutlineInputBorder(
// //                                 borderRadius: BorderRadius.circular(10),
// //                               ),
// //                             ),
// //                           ),
// //                           const SizedBox(height: 30),
// //                           TextField(
// //                             style: const TextStyle(),
// //                             obscureText: true,
// //                             decoration: InputDecoration(
// //                               fillColor: Colors.grey.shade100,
// //                               filled: true,
// //                               hintText: "Password",
// //                               border: OutlineInputBorder(
// //                                 borderRadius: BorderRadius.circular(10),
// //                               ),
// //                             ),
// //                           ),
// //                           const SizedBox(height: 40),
// //                           Row(
// //                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
// //                             children: [
// //                               const Text(
// //                                 'Sign in',
// //                                 style: TextStyle(
// //                                   fontSize: 27,
// //                                   fontWeight: FontWeight.w700,
// //                                 ),
// //                               ),
// //                               CircleAvatar(
// //                                 radius: 30,
// //                                 backgroundColor: const Color(0xff4c505b),
// //                                 child: IconButton(
// //                                   color: Colors.white,
// //                                   onPressed: () {
// //                                     // Navigate to home screen upon successful sign-in
// //                                     Navigator.pushNamed(context, 'home');
// //                                   },
// //                                   icon: const Icon(Icons.arrow_forward),
// //                                 ),
// //                               ),
// //                             ],
// //                           ),
// //                           const SizedBox(height: 40),
// //                           Row(
// //                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
// //                             children: [
// //                               TextButton(
// //                                 onPressed: () {
// //                                   Navigator.pushNamed(context, 'register');
// //                                 },
// //                                 child: const Text(
// //                                   'Sign Up',
// //                                   textAlign: TextAlign.left,
// //                                   style: TextStyle(
// //                                     decoration: TextDecoration.underline,
// //                                     color: Color(0xff4c505b),
// //                                     fontSize: 18,
// //                                   ),
// //                                 ),
// //                               ),
// //                               TextButton(
// //                                 onPressed: () {},
// //                                 child: const Text(
// //                                   'Forgot Password',
// //                                   style: TextStyle(
// //                                     decoration: TextDecoration.underline,
// //                                     color: Color(0xff4c505b),
// //                                     fontSize: 18,
// //                                   ),
// //                                 ),
// //                               ),
// //                             ],
// //                           ),
// //                           const SizedBox(height: 20),
// //                           ElevatedButton.icon(
// //                             onPressed: () {
// //                               // Implement Google Sign-In functionality here
// //                             },
// //                             icon: Image.asset(
// //                               'assets/google_logo.png', // Ensure you have the Google logo image in your assets
// //                               height: 24,
// //                               width: 24,
// //                             ),
// //                             label: const Text('Sign In with Google'),
// //                             style: ElevatedButton.styleFrom(
// //                               backgroundColor: Colors.white,
// //                               fixedSize: const Size.fromWidth(double.infinity),
// //                               minimumSize: const Size(double.infinity, 50),
// //                               shape: RoundedRectangleBorder(
// //                                 borderRadius: BorderRadius.circular(10),
// //                               ),
// //                             ),
// //                           ),
// //                         ],
// //                       ),
// //                     ),
// //                   ],
// //                 ),
// //               ),
// //             ),
// //           ],
// //         ),
// //       ),
// //     );
// //   }
// // }

// // /2 code
// import 'package:flutter/material.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:google_sign_in/google_sign_in.dart';

// class MyLogin extends StatefulWidget {
//   const MyLogin({super.key});

//   @override
//   MyLoginState createState() => MyLoginState();
// }

// class MyLoginState extends State<MyLogin> {
//   final TextEditingController _emailController = TextEditingController();
//   final TextEditingController _passwordController = TextEditingController();

//   @override
//   void dispose() {
//     _emailController.dispose();
//     _passwordController.dispose();
//     super.dispose();
//   }

//   void _signIn() {
//     String email = _emailController.text.trim();
//     if (email.endsWith('.edu.in')) {
//       Navigator.pushNamed(context, 'student_home');
//     } else if (email.endsWith('.ac.in')) {
//       Navigator.pushNamed(context, 'faculty_home');
//     } else {
//       ScaffoldMessenger.of(
//         context,
//       ).showSnackBar(const SnackBar(content: Text('Invalid email domain')));
//     }
//   }

//   Future<void> _signInWithGoogle() async {
//     try {
//       final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
//       if (googleUser == null) {
//         // The user canceled the sign-in
//         return;
//       }

//       final GoogleSignInAuthentication googleAuth =
//           await googleUser.authentication;
//       final AuthCredential credential = GoogleAuthProvider.credential(
//         accessToken: googleAuth.accessToken,
//         idToken: googleAuth.idToken,
//       );

//       final UserCredential userCredential = await FirebaseAuth.instance
//           .signInWithCredential(credential);
//       final User? user = userCredential.user;

//       if (user != null) {
//         String email = user.email!;
//         if (email.endsWith('.edu.in')) {
//           Navigator.pushNamed(context, 'student_home');
//         } else if (email.endsWith('.ac.in')) {
//           Navigator.pushNamed(context, 'faculty_home');
//         } else {
//           ScaffoldMessenger.of(
//             context,
//           ).showSnackBar(const SnackBar(content: Text('Invalid email domain')));
//         }
//       }
//     } catch (e) {
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text('Failed to sign in with Google: $e')),
//       );
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       decoration: const BoxDecoration(
//         image: DecorationImage(
//           image: AssetImage('assets/login.png'),
//           fit: BoxFit.cover,
//         ),
//       ),
//       child: Scaffold(
//         backgroundColor: Colors.transparent,
//         body: Stack(
//           children: [
//             Container(),
//             Container(
//               padding: const EdgeInsets.only(left: 35, top: 130),
//               child: const Text(
//                 'Welcome\nBack',
//                 style: TextStyle(color: Colors.white, fontSize: 33),
//               ),
//             ),
//             SingleChildScrollView(
//               child: Container(
//                 padding: EdgeInsets.only(
//                   top: MediaQuery.of(context).size.height * 0.5,
//                 ),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Container(
//                       margin: const EdgeInsets.only(left: 35, right: 35),
//                       child: Column(
//                         children: [
//                           TextField(
//                             controller: _emailController,
//                             style: const TextStyle(color: Colors.black),
//                             decoration: InputDecoration(
//                               fillColor: Colors.grey.shade100,
//                               filled: true,
//                               hintText: "Email",
//                               border: OutlineInputBorder(
//                                 borderRadius: BorderRadius.circular(10),
//                               ),
//                             ),
//                           ),
//                           const SizedBox(height: 30),
//                           TextField(
//                             controller: _passwordController,
//                             style: const TextStyle(),
//                             obscureText: true,
//                             decoration: InputDecoration(
//                               fillColor: Colors.grey.shade100,
//                               filled: true,
//                               hintText: "Password",
//                               border: OutlineInputBorder(
//                                 borderRadius: BorderRadius.circular(10),
//                               ),
//                             ),
//                           ),
//                           const SizedBox(height: 40),
//                           Row(
//                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                             children: [
//                               const Text(
//                                 'Sign in',
//                                 style: TextStyle(
//                                   fontSize: 27,
//                                   fontWeight: FontWeight.w700,
//                                 ),
//                               ),
//                               CircleAvatar(
//                                 radius: 30,
//                                 backgroundColor: const Color(0xff4c505b),
//                                 child: IconButton(
//                                   color: Colors.white,
//                                   onPressed: _signIn,
//                                   icon: const Icon(Icons.arrow_forward),
//                                 ),
//                               ),
//                             ],
//                           ),
//                           const SizedBox(height: 40),
//                           Row(
//                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                             children: [
//                               TextButton(
//                                 onPressed: () {
//                                   Navigator.pushNamed(context, 'register');
//                                 },
//                                 child: const Text(
//                                   'Sign Up',
//                                   textAlign: TextAlign.left,
//                                   style: TextStyle(
//                                     decoration: TextDecoration.underline,
//                                     color: Color(0xff4c505b),
//                                     fontSize: 18,
//                                   ),
//                                 ),
//                               ),
//                               TextButton(
//                                 onPressed: () {},
//                                 child: const Text(
//                                   'Forgot Password',
//                                   style: TextStyle(
//                                     decoration: TextDecoration.underline,
//                                     color: Color(0xff4c505b),
//                                     fontSize: 18,
//                                   ),
//                                 ),
//                               ),
//                             ],
//                           ),
//                           const SizedBox(height: 20),
//                           ElevatedButton.icon(
//                             onPressed: _signInWithGoogle,
//                             icon: Image.asset(
//                               'assets/google_logo.png', // Ensure you have the Google logo image in your assets
//                               height: 24,
//                               width: 24,
//                             ),
//                             label: const Text('Sign In with Google'),
//                             style: ElevatedButton.styleFrom(
//                               backgroundColor: Colors.white,
//                               fixedSize: const Size.fromWidth(double.infinity),
//                               minimumSize: const Size(double.infinity, 50),
//                               shape: RoundedRectangleBorder(
//                                 borderRadius: BorderRadius.circular(10),
//                               ),
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// 3 code
///new login code with minor changes
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class MyLogin extends StatefulWidget {
  const MyLogin({super.key});

  @override
  MyLoginState createState() => MyLoginState();
}

class MyLoginState extends State<MyLogin> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _signIn() {
    String email = _emailController.text.trim();
    if (email.endsWith('.edu.in')) {
      Navigator.pushNamed(context, 'student_home');
    } else if (email.endsWith('.ac.in')) {
      Navigator.pushNamed(context, 'faculty_home');
    } else {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('Invalid email domain')));
    }
  }

  Future<void> _signInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
      if (googleUser == null) {
        // The user canceled the sign-in
        return;
      }

      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;
      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      final UserCredential userCredential = await FirebaseAuth.instance
          .signInWithCredential(credential);
      final User? user = userCredential.user;

      if (user != null) {
        String email = user.email!;
        if (email.endsWith('.edu.in')) {
          Navigator.pushNamed(context, 'student_home');
        } else if (email.endsWith('.ac.in')) {
          Navigator.pushNamed(context, 'faculty_home');
        } else {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(const SnackBar(content: Text('Invalid email domain')));
        }
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to sign in with Google: $e')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/login.png'),
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Stack(
          children: [
            Container(),
            Container(
              padding: const EdgeInsets.only(left: 35, top: 130),
              child: const Text(
                'Welcome\nBack',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 33,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * 0.5,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: const EdgeInsets.symmetric(horizontal: 35),
                      child: Column(
                        children: [
                          TextField(
                            controller: _emailController,
                            style: const TextStyle(color: Colors.black),
                            decoration: InputDecoration(
                              fillColor: Colors.grey.shade100,
                              filled: true,
                              hintText: "Email",
                              prefixIcon: const Icon(Icons.email),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                          ),
                          const SizedBox(height: 30),
                          TextField(
                            controller: _passwordController,
                            style: const TextStyle(),
                            obscureText: true,
                            decoration: InputDecoration(
                              fillColor: Colors.grey.shade100,
                              filled: true,
                              hintText: "Password",
                              prefixIcon: const Icon(Icons.lock),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                          ),
                          const SizedBox(height: 40),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                'Sign in',
                                style: TextStyle(
                                  fontSize: 27,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              CircleAvatar(
                                radius: 30,
                                backgroundColor: const Color(0xff4c505b),
                                child: IconButton(
                                  color: Colors.white,
                                  onPressed: _signIn,
                                  icon: const Icon(Icons.arrow_forward),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 40),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              TextButton(
                                onPressed: () {
                                  Navigator.pushNamed(context, 'register');
                                },
                                child: const Text(
                                  'Sign Up',
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                    decoration: TextDecoration.underline,
                                    color: Color(0xff4c505b),
                                    fontSize: 18,
                                  ),
                                ),
                              ),
                              TextButton(
                                onPressed: () {},
                                child: const Text(
                                  'Forgot Password',
                                  style: TextStyle(
                                    decoration: TextDecoration.underline,
                                    color: Color(0xff4c505b),
                                    fontSize: 18,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 20),
                          ElevatedButton.icon(
                            onPressed: _signInWithGoogle,
                            icon: Image.asset(
                              'assets/google_logo.png', // Ensure you have the Google logo image in your assets
                              height: 24,
                              width: 24,
                            ),
                            label: const Text('Sign In with Google'),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.white,
                              fixedSize: const Size.fromWidth(double.infinity),
                              minimumSize: const Size(double.infinity, 50),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
