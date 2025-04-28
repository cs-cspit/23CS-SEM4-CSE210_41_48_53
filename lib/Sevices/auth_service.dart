// // // import 'package:firebase_auth/firebase_auth.dart';
// // // import 'package:flutter/material.dart';
// // // import 'package:fluttertoast/fluttertoast.dart';

// // // class AuthService {
// // //   Future<void> signup({
// // //     required String email,
// // //     required String password,
// // //   })
// // //   async {
// // //     try {
// // //       await FirebaseAuth.instance.createUserWithEmailAndPassword(
// // //         email: email,
// // //         password: password,
// // //       );
// // //     } on FirebaseAuthException catch (e) {
// // //       String message = '';
// // //       if (e.code == 'weak-password') {
// // //         message = 'The password provided is too weak.';
// // //         } else if (e.code == 'email-already-in-use') {
// // //           message = 'The account already exists for that email.';
// // //           } 
// // //           Fluttertoast.showToast(
// // //             msg: message,
// // //             toastLength: Toast.LENGTH_SHORT,
// // //             gravity: ToastGravity.SNACKBAR,
// // //             backgroundColor: Colors.red,
// // //             fontSize: 14.0,
// // //           );
// // //     }
// // //     catch(e){

// // //     }
// // //   }

// // //   Future<void> signin({
// // //     required String email,
// // //     required String password,
// // //   })
// // //   async {
// // //     try {
// // //       await FirebaseAuth.instance.signInWithEmailAndPassword(
// // //         email: email,
// // //         password: password,
// // //       );
// // //     } on FirebaseAuthException catch (e) {
// // //       String message = '';
// // //       if (e.code == 'user not found') {
// // //         message = 'no user found for that email';
// // //         } else if (e.code == 'wrong-password') {
// // //           message = 'Wrong password provided for that user';
// // //           } 
// // //           Fluttertoast.showToast(
// // //             msg: message,
// // //             toastLength: Toast.LENGTH_SHORT,
// // //             gravity: ToastGravity.SNACKBAR,
// // //             backgroundColor: Colors.red,
// // //             fontSize: 14.0,
// // //           );
// // //     }
// // //     catch(e){

// // //     }
// // //   }
// // // }


// // import 'package:firebase_auth/firebase_auth.dart';
// // import 'package:cloud_firestore/cloud_firestore.dart';
// // import 'package:flutter/material.dart';
// // import 'package:fluttertoast/fluttertoast.dart';

// // class AuthService {
// //   final FirebaseAuth _auth = FirebaseAuth.instance;
// //   final FirebaseFirestore _firestore = FirebaseFirestore.instance;

// //   // Sign Up Method
// //   Future<void> signup({
// //     required String email,
// //     required String password,
// //     required String name,
// //     required String role,
// //   }) async {
// //     try {
// //       // Create user in Firebase Authentication
// //       UserCredential userCredential = await _auth.createUserWithEmailAndPassword(
// //         email: email,
// //         password: password,
// //       );

// //       // Store user data in Firestore
// //       await _firestore.collection('users').doc(userCredential.user!.uid).set({
// //         'uid': userCredential.user!.uid,
// //         'name': name,
// //         'email': email,
// //         'role': role,
// //         'createdAt': FieldValue.serverTimestamp(),
// //       });

// //       Fluttertoast.showToast(
// //         msg: 'Account created successfully!',
// //         toastLength: Toast.LENGTH_SHORT,
// //         gravity: ToastGravity.BOTTOM,
// //         backgroundColor: Colors.green,
// //         fontSize: 14.0,
// //       );
// //     } on FirebaseAuthException catch (e) {
// //       String message = '';
// //       if (e.code == 'weak-password') {
// //         message = 'The password provided is too weak.';
// //       } else if (e.code == 'email-already-in-use') {
// //         message = 'The account already exists for that email.';
// //       }
// //       Fluttertoast.showToast(
// //         msg: message,
// //         toastLength: Toast.LENGTH_SHORT,
// //         gravity: ToastGravity.BOTTOM,
// //         backgroundColor: Colors.red,
// //         fontSize: 14.0,
// //       );
// //     } catch (e) {
// //       Fluttertoast.showToast(
// //         msg: 'An error occurred. Please try again.',
// //         toastLength: Toast.LENGTH_SHORT,
// //         gravity: ToastGravity.BOTTOM,
// //         backgroundColor: Colors.red,
// //         fontSize: 14.0,
// //       );
// //     }
// //   }

// //   // Sign In Method
// //   Future<void> signin({
// //     required String email,
// //     required String password,
// //   }) async {
// //     try {
// //       await _auth.signInWithEmailAndPassword(email: email, password: password);
// //       Fluttertoast.showToast(
// //         msg: 'Signed in successfully!',
// //         toastLength: Toast.LENGTH_SHORT,
// //         gravity: ToastGravity.BOTTOM,
// //         backgroundColor: Colors.green,
// //         fontSize: 14.0,
// //       );
// //     } on FirebaseAuthException catch (e) {
// //       String message = '';
// //       if (e.code == 'user-not-found') {
// //         message = 'No user found for that email.';
// //       } else if (e.code == 'wrong-password') {
// //         message = 'Wrong password provided for that user.';
// //       }
// //       Fluttertoast.showToast(
// //         msg: message,
// //         toastLength: Toast.LENGTH_SHORT,
// //         gravity: ToastGravity.BOTTOM,
// //         backgroundColor: Colors.red,
// //         fontSize: 14.0,
// //       );
// //     } catch (e) {
// //       Fluttertoast.showToast(
// //         msg: 'An error occurred. Please try again.',
// //         toastLength: Toast.LENGTH_SHORT,
// //         gravity: ToastGravity.BOTTOM,
// //         backgroundColor: Colors.red,
// //         fontSize: 14.0,
// //       );
// //     }
// //   }

// //   // Get Current User Data
// //   Future<DocumentSnapshot> getUserData() async {
// //     User? user = _auth.currentUser;
// //     if (user != null) {
// //       return await _firestore.collection('users').doc(user.uid).get();
// //     }
// //     throw Exception('No user is signed in.');
// //   }
// // }

// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:google_sign_in/google_sign_in.dart';
// import 'package:flutter/foundation.dart';

// class AuthService {
//   final FirebaseAuth _auth = FirebaseAuth.instance;
//   final FirebaseFirestore _firestore = FirebaseFirestore.instance;
//   final GoogleSignIn _googleSignIn = GoogleSignIn();

//   // Clear auth state
//   Future<void> clearAuthState() async {
//     try {
//       await _googleSignIn.signOut();
//       await _auth.signOut();
//       // Clear any persisted auth state
//       await _auth.setPersistence(Persistence.NONE);
//     } catch (e) {
//       debugPrint('❌ Error clearing auth state: $e');
//       rethrow;
//     }
//   }

//   // Initialize auth state
//   Future<void> initializeAuth() async {
//     try {
//       // Clear any existing auth state
//       await clearAuthState();
//       // Set persistence to session only
//       await _auth.setPersistence(Persistence.SESSION);
//     } catch (e) {
//       debugPrint('❌ Error initializing auth: $e');
//       rethrow;
//     }
//   }

//   // User Sign Up
//   Future<UserCredential> signup({
//     required String email,
//     required String password,
//     required String name,
//     required String role,
//   }) async {
//     try {
//       UserCredential userCredential = await _auth.createUserWithEmailAndPassword(
//         email: email,
//         password: password,
//       );

//       // Create Firestore document for the new user
//       await _firestore.collection('users').doc(userCredential.user!.uid).set({
//         'uid': userCredential.user!.uid,
//         'name': name,
//         'email': email,
//         'role': role,
//         'rollNo': 'NA',
//         'createdAt': FieldValue.serverTimestamp(),
//       });

//       debugPrint('✅ New user document created in Firestore');
//       return userCredential;
//     } catch (e) {
//       debugPrint('❌ Error during signup: $e');
//       rethrow;
//     }
//   }

//   // User Sign In with Email and Password
//   Future<UserCredential> signin({
//     required String email,
//     required String password,
//   }) async {
//     try {
//       UserCredential userCredential = await _auth.signInWithEmailAndPassword(
//         email: email,
//         password: password,
//       );
//       return userCredential;
//     } catch (e) {
//       debugPrint('❌ Error during signin: $e');
//       rethrow;
//     }
//   }

//   // Google Sign In
//   Future<UserCredential> signInWithGoogle() async {
//     try {
//       final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();

//       if (googleUser == null) {
//         throw FirebaseAuthException(
//           code: 'ERROR_ABORTED_BY_USER',
//           message: 'Sign-in aborted by user.',
//         );
//       }

//       final GoogleSignInAuthentication googleAuth = await googleUser.authentication;
//       final OAuthCredential credential = GoogleAuthProvider.credential(
//         accessToken: googleAuth.accessToken,
//         idToken: googleAuth.idToken,
//       );

//       UserCredential userCredential = await _auth.signInWithCredential(credential);

//       // Check if Firestore entry exists
//       final userDoc = await _firestore.collection('users').doc(userCredential.user!.uid).get();

//       if (!userDoc.exists) {
//         await _firestore.collection('users').doc(userCredential.user!.uid).set({
//           'uid': userCredential.user!.uid,
//           'name': userCredential.user!.displayName ?? 'No name',
//           'email': userCredential.user!.email ?? 'No email',
//           'role': 'Student',
//           'rollNo': 'NA',
//           'createdAt': FieldValue.serverTimestamp(),
//         });
//         debugPrint('✅ New Google user document created in Firestore');
//       } else {
//         debugPrint('ℹ️ Google user already exists in Firestore');
//       }

//       return userCredential;
//     } catch (e) {
//       debugPrint('❌ Error during Google sign-in: $e');
//       rethrow;
//     }
//   }

//   // Get Current User
//   User? getCurrentUser() {
//     return _auth.currentUser;
//   }

//   // User Sign Out
//   Future<void> signOut() async {
//     try {
//       await _googleSignIn.signOut();
//       await _auth.signOut();
//     } catch (e) {
//       debugPrint('❌ Error during sign out: $e');
//       rethrow;
//     }
//   }
// }

import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter/foundation.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  
  // List of valid email domains
  final List<String> _validDomains = ['.edu.in', '.ac.in'];

  // Verify if email domain is valid
  bool isValidDomain(String email) {
    return _validDomains.any((domain) => email.endsWith(domain));
  }

  // Get user role based on email domain
  String getUserRoleFromEmail(String email) {
    if (email.endsWith('.edu.in')) {
      return 'Student';
    } else if (email.endsWith('.ac.in')) {
      return 'Faculty';
    } else {
      return 'Unknown';
    }
  }

  // Clear auth state
  Future<void> clearAuthState() async {
    try {
      await _googleSignIn.signOut();
      await _auth.signOut();
      // Clear any persisted auth state
      await _auth.setPersistence(Persistence.NONE);
    } catch (e) {
      debugPrint('❌ Error clearing auth state: $e');
      rethrow;
    }
  }

  // Initialize auth state
  Future<void> initializeAuth() async {
    try {
      // Clear any existing auth state
      await clearAuthState();
      // Set persistence to session only
      await _auth.setPersistence(Persistence.SESSION);
    } catch (e) {
      debugPrint('❌ Error initializing auth: $e');
      rethrow;
    }
  }

  // User Sign Up
  Future<UserCredential> signup({
    required String email,
    required String password,
    required String name,
    required String role,
  }) async {
    try {
      // Validate email domain
      if (!isValidDomain(email)) {
        throw FirebaseAuthException(
          code: 'invalid-domain',
          message: 'Invalid email domain. Please use .edu.in or .ac.in',
        );
      }

      UserCredential userCredential = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      // Create Firestore document for the new user
      await _firestore.collection('users').doc(userCredential.user!.uid).set({
        'uid': userCredential.user!.uid,
        'name': name,
        'email': email,
        'role': role,
        'rollNo': 'NA',
        'createdAt': FieldValue.serverTimestamp(),
      });

      debugPrint('✅ New user document created in Firestore');
      return userCredential;
    } on FirebaseAuthException catch (e) {
      debugPrint('❌ Firebase Auth Exception during signup: ${e.code} - ${e.message}');
      rethrow;
    } catch (e) {
      debugPrint('❌ Error during signup: $e');
      rethrow;
    }
  }

  // User Sign In with Email and Password
  Future<UserCredential> signin({
    required String email,
    required String password,
  }) async {
    try {
      // Validate email domain
      if (!isValidDomain(email)) {
        throw FirebaseAuthException(
          code: 'invalid-domain',
          message: 'Invalid email domain. Please use .edu.in or .ac.in',
        );
      }

      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      
      // Update user's last login timestamp
      await _firestore.collection('users').doc(userCredential.user!.uid).update({
        'lastLogin': FieldValue.serverTimestamp(),
      });
      
      return userCredential;
    } on FirebaseAuthException catch (e) {
      debugPrint('❌ Firebase Auth Exception during signin: ${e.code} - ${e.message}');
      rethrow;
    } catch (e) {
      debugPrint('❌ Error during signin: $e');
      rethrow;
    }
  }

  // Google Sign In
  Future<UserCredential> signInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();

      if (googleUser == null) {
        throw FirebaseAuthException(
          code: 'ERROR_ABORTED_BY_USER',
          message: 'Sign-in aborted by user.',
        );
      }

      // Verify email domain
      if (!isValidDomain(googleUser.email)) {
        await _googleSignIn.signOut(); // Sign out since domain is invalid
        throw FirebaseAuthException(
          code: 'invalid-domain',
          message: 'Invalid email domain. Please use .edu.in or .ac.in',
        );
      }

      final GoogleSignInAuthentication googleAuth = await googleUser.authentication;
      final OAuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      UserCredential userCredential = await _auth.signInWithCredential(credential);
      User? user = userCredential.user;
      
      if (user == null) {
        throw FirebaseAuthException(
          code: 'null-user',
          message: 'Failed to retrieve user information after Google sign-in.',
        );
      }

      // Check if Firestore entry exists
      final userDoc = await _firestore.collection('users').doc(user.uid).get();

      if (!userDoc.exists) {
        // Determine role based on email domain
        String role = getUserRoleFromEmail(user.email ?? '');
        
        await _firestore.collection('users').doc(user.uid).set({
          'uid': user.uid,
          'name': user.displayName ?? 'No name',
          'email': user.email ?? 'No email',
          'role': role,
          'rollNo': 'NA',
          'createdAt': FieldValue.serverTimestamp(),
          'lastLogin': FieldValue.serverTimestamp(),
          'signInMethod': 'google',
        });
        debugPrint('✅ New Google user document created in Firestore');
      } else {
        // Update last login timestamp
        await _firestore.collection('users').doc(user.uid).update({
          'lastLogin': FieldValue.serverTimestamp(),
        });
        debugPrint('ℹ️ Google user already exists in Firestore - updated login timestamp');
      }

      return userCredential;
    } on FirebaseAuthException catch (e) {
      debugPrint('❌ Firebase Auth Exception during Google sign-in: ${e.code} - ${e.message}');
      rethrow;
    } catch (e) {
      debugPrint('❌ Error during Google sign-in: $e');
      rethrow;
    }
  }

  // Get Current User
  User? getCurrentUser() {
    return _auth.currentUser;
  }

  // Get Current User Data from Firestore
  Future<DocumentSnapshot?> getCurrentUserData() async {
    try {
      User? user = getCurrentUser();
      if (user != null) {
        return await _firestore.collection('users').doc(user.uid).get();
      }
      return null;
    } catch (e) {
      debugPrint('❌ Error getting user data: $e');
      rethrow;
    }
  }

  // User Sign Out
  Future<void> signOut() async {
    try {
      await _googleSignIn.signOut();
      await _auth.signOut();
    } catch (e) {
      debugPrint('❌ Error during sign out: $e');
      rethrow;
    }
  }

  // Reset Password
  Future<void> resetPassword(String email) async {
    try {
      await _auth.sendPasswordResetEmail(email: email);
    } catch (e) {
      debugPrint('❌ Error sending password reset email: $e');
      rethrow;
    }
  }

  // Check if user is signed in
  bool isSignedIn() {
    return _auth.currentUser != null;
  }

  // Update user profile
  Future<void> updateUserProfile({required String uid, required Map<String, dynamic> data}) async {
    try {
      await _firestore.collection('users').doc(uid).update(data);
    } catch (e) {
      debugPrint('❌ Error updating user profile: $e');
      rethrow;
    }
  }
}
