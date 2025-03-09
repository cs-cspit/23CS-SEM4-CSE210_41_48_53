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
library;

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
//                 style: TextStyle(
//                   color: Colors.white,
//                   fontSize: 33,
//                   fontWeight: FontWeight.bold,
//                 ),
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
//                       margin: const EdgeInsets.symmetric(horizontal: 35),
//                       child: Column(
//                         children: [
//                           TextField(
//                             controller: _emailController,
//                             style: const TextStyle(color: Colors.black),
//                             decoration: InputDecoration(
//                               fillColor: Colors.grey.shade100,
//                               filled: true,
//                               hintText: "Email",
//                               prefixIcon: const Icon(Icons.email),
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
//                               prefixIcon: const Icon(Icons.lock),
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

import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:google_fonts/google_fonts.dart';

class MyLogin extends StatefulWidget {
  const MyLogin({super.key});

  @override
  MyLoginState createState() => MyLoginState();
}

class MyLoginState extends State<MyLogin> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _obscurePassword = true;
  bool _isLoading = false;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _signIn() {
    setState(() => _isLoading = true);

    // Simulate network delay
    Future.delayed(const Duration(seconds: 1), () {
      String email = _emailController.text.trim();

      setState(() => _isLoading = false);

      if (email.endsWith('.edu.in')) {
        Navigator.pushNamed(context, 'student_home');
      } else if (email.endsWith('.ac.in')) {
        Navigator.pushNamed(context, 'faculty_home');
      } else {
        _showErrorSnackbar(
          'Invalid email domain. Please use .edu.in or .ac.in',
        );
      }
    });
  }

  Future<void> _signInWithGoogle() async {
    setState(() => _isLoading = true);

    try {
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
      if (googleUser == null) {
        // The user canceled the sign-in
        setState(() => _isLoading = false);
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

      setState(() => _isLoading = false);

      if (user != null) {
        String email = user.email!;
        if (email.endsWith('.edu.in')) {
          Navigator.pushNamed(context, 'student_home');
        } else if (email.endsWith('.ac.in')) {
          Navigator.pushNamed(context, 'faculty_home');
        } else {
          _showErrorSnackbar(
            'Invalid email domain. Please use .edu.in or .ac.in',
          );
        }
      }
    } catch (e) {
      setState(() => _isLoading = false);
      _showErrorSnackbar('Failed to sign in with Google: $e');
    }
  }

  void _showErrorSnackbar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: Colors.red.shade700,
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        margin: const EdgeInsets.all(16),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F7FA),
      body: Stack(
        children: [
          // Background decoration
          Positioned(
            top: -100,
            right: -100,
            child: Container(
              width: 300,
              height: 300,
              decoration: BoxDecoration(
                color: const Color(0xFF5A6BF5).withOpacity(0.2),
                shape: BoxShape.circle,
              ),
            ),
          ),
          Positioned(
            bottom: -80,
            left: -80,
            child: Container(
              width: 200,
              height: 200,
              decoration: BoxDecoration(
                color: const Color(0xFF3498DB).withOpacity(0.15),
                shape: BoxShape.circle,
              ),
            ),
          ),

          // Main content
          SafeArea(
            child: Center(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      // App logo
                      Container(
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: const Color(0xFF5A6BF5),
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: [
                            BoxShadow(
                              color: const Color(0xFF5A6BF5).withOpacity(0.3),
                              blurRadius: 20,
                              offset: const Offset(0, 10),
                            ),
                          ],
                        ),
                        child: const Icon(
                          Icons.school_rounded,
                          size: 56,
                          color: Colors.white,
                        ),
                      ),

                      const SizedBox(height: 32),

                      // Welcome text
                      Text(
                        'Welcome Back',
                        style: GoogleFonts.poppins(
                          fontSize: 26,
                          fontWeight: FontWeight.bold,
                          color: const Color(0xFF2D3748),
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        'Sign in to continue your learning journey',
                        style: GoogleFonts.poppins(
                          fontSize: 14,
                          color: const Color(0xFF718096),
                        ),
                        textAlign: TextAlign.center,
                      ),

                      const SizedBox(height: 48),

                      // Email field
                      _buildTextField(
                        controller: _emailController,
                        hintText: 'Email Address',
                        prefixIcon: Icons.email_outlined,
                        keyboardType: TextInputType.emailAddress,
                      ),

                      const SizedBox(height: 16),

                      // Password field
                      _buildTextField(
                        controller: _passwordController,
                        hintText: 'Password',
                        prefixIcon: Icons.lock_outline,
                        obscureText: _obscurePassword,
                        suffixIcon: IconButton(
                          icon: Icon(
                            _obscurePassword
                                ? Icons.visibility_outlined
                                : Icons.visibility_off_outlined,
                            color: const Color(0xFF718096),
                          ),
                          onPressed: () {
                            setState(() {
                              _obscurePassword = !_obscurePassword;
                            });
                          },
                        ),
                      ),

                      // Forgot password
                      Align(
                        alignment: Alignment.centerRight,
                        child: TextButton(
                          onPressed: () {
                            // Forgot password functionality
                          },
                          style: TextButton.styleFrom(
                            foregroundColor: const Color(0xFF5A6BF5),
                            padding: const EdgeInsets.symmetric(vertical: 8),
                          ),
                          child: Text(
                            'Forgot Password?',
                            style: GoogleFonts.poppins(
                              fontWeight: FontWeight.w500,
                              fontSize: 13,
                            ),
                          ),
                        ),
                      ),

                      const SizedBox(height: 24),

                      // Sign in button
                      _buildPrimaryButton(
                        onPressed: _signIn,
                        text: 'Sign In',
                        isLoading: _isLoading,
                      ),

                      const SizedBox(height: 24),

                      // Divider
                      Row(
                        children: [
                          Expanded(
                            child: Divider(
                              color: Colors.grey.shade300,
                              thickness: 1,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 16),
                            child: Text(
                              'OR',
                              style: GoogleFonts.poppins(
                                fontSize: 12,
                                color: const Color(0xFF718096),
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                          Expanded(
                            child: Divider(
                              color: Colors.grey.shade300,
                              thickness: 1,
                            ),
                          ),
                        ],
                      ),

                      const SizedBox(height: 24),

                      // Google sign-in button
                      _buildSocialButton(
                        onPressed: _signInWithGoogle,
                        text: 'Continue with Google',
                        icon: Image.asset(
                          'assets/google_logo.png',
                          height: 24,
                          width: 24,
                        ),
                      ),

                      const SizedBox(height: 32),

                      // Sign up option
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Don\'t have an account?',
                            style: GoogleFonts.poppins(
                              fontSize: 14,
                              color: const Color(0xFF718096),
                            ),
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.pushNamed(context, 'register');
                            },
                            style: TextButton.styleFrom(
                              foregroundColor: const Color(0xFF5A6BF5),
                            ),
                            child: Text(
                              'Sign Up',
                              style: GoogleFonts.poppins(
                                fontWeight: FontWeight.w600,
                                fontSize: 14,
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

          // Loading overlay
          if (_isLoading)
            Container(
              color: Colors.black.withOpacity(0.3),
              child: const Center(
                child: CircularProgressIndicator(color: Color(0xFF5A6BF5)),
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String hintText,
    required IconData prefixIcon,
    TextInputType keyboardType = TextInputType.text,
    bool obscureText = false,
    Widget? suffixIcon,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
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
        controller: controller,
        obscureText: obscureText,
        keyboardType: keyboardType,
        style: GoogleFonts.poppins(
          fontSize: 14,
          color: const Color(0xFF2D3748),
        ),
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: GoogleFonts.poppins(
            color: const Color(0xFFA0AEC0),
            fontSize: 14,
          ),
          prefixIcon: Icon(
            prefixIcon,
            color: const Color(0xFF718096),
            size: 18,
          ),
          suffixIcon: suffixIcon,
          border: InputBorder.none,
          contentPadding: const EdgeInsets.symmetric(vertical: 16),
        ),
      ),
    );
  }

  Widget _buildPrimaryButton({
    required VoidCallback onPressed,
    required String text,
    bool isLoading = false,
  }) {
    return SizedBox(
      width: double.infinity,
      height: 56,
      child: ElevatedButton(
        onPressed: isLoading ? null : onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFF5A6BF5),
          foregroundColor: Colors.white,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          shadowColor: const Color(0xFF5A6BF5).withOpacity(0.5),
        ),
        child: Text(
          text,
          style: GoogleFonts.poppins(fontSize: 16, fontWeight: FontWeight.w600),
        ),
      ),
    );
  }

  Widget _buildSocialButton({
    required VoidCallback onPressed,
    required String text,
    required Widget icon,
  }) {
    return SizedBox(
      width: double.infinity,
      height: 56,
      child: OutlinedButton.icon(
        onPressed: onPressed,
        icon: icon,
        label: Text(
          text,
          style: GoogleFonts.poppins(
            fontSize: 15,
            fontWeight: FontWeight.w500,
            color: const Color(0xFF2D3748),
          ),
        ),
        style: OutlinedButton.styleFrom(
          backgroundColor: Colors.white,
          side: BorderSide(color: Colors.grey.shade300),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
      ),
    );
  }
}
