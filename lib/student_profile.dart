// import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart';
// import 'dart:io';

// class StudentProfile extends StatefulWidget {
//   const StudentProfile({super.key});

//   @override
//   _StudentProfileState createState() => _StudentProfileState();
// }

// class _StudentProfileState extends State<StudentProfile> {
//   final _formKey = GlobalKey<FormState>();
//   final _nameController = TextEditingController();
//   final _phoneController = TextEditingController();
//   final _collegeIdController = TextEditingController();
//   final _birthdateController = TextEditingController();
//   final _emailController = TextEditingController();
//   XFile? _profileImage;

//   @override
//   void dispose() {
//     _nameController.dispose();
//     _phoneController.dispose();
//     _collegeIdController.dispose();
//     _birthdateController.dispose();
//     _emailController.dispose();
//     super.dispose();
//   }

//   Future<void> _pickImage() async {
//     final ImagePicker picker = ImagePicker();
//     final XFile? image = await picker.pickImage(source: ImageSource.gallery);
//     setState(() {
//       _profileImage = image;
//     });
//   }

//   void _saveProfile() {
//     if (_formKey.currentState!.validate()) {
//       // Save the profile information
//       // You can add your logic to save the profile information here
//       ScaffoldMessenger.of(context).showSnackBar(
//         const SnackBar(content: Text('Profile saved successfully')),
//       );
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Student Profile'),
//         backgroundColor: const Color.fromARGB(235, 134, 201, 232),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Form(
//           key: _formKey,
//           child: ListView(
//             children: <Widget>[
//               Center(
//                 child: GestureDetector(
//                   onTap: _pickImage,
//                   child: CircleAvatar(
//                     radius: 50,
//                     backgroundImage:
//                         _profileImage != null
//                             ? FileImage(File(_profileImage!.path))
//                             : null,
//                     child:
//                         _profileImage == null
//                             ? const Icon(Icons.camera_alt, size: 50)
//                             : null,
//                   ),
//                 ),
//               ),
//               const SizedBox(height: 16.0),
//               TextFormField(
//                 controller: _nameController,
//                 decoration: const InputDecoration(
//                   labelText: 'Name',
//                   border: OutlineInputBorder(),
//                 ),
//                 validator: (value) {
//                   if (value == null || value.isEmpty) {
//                     return 'Please enter your name';
//                   }
//                   return null;
//                 },
//               ),
//               const SizedBox(height: 16.0),
//               TextFormField(
//                 controller: _phoneController,
//                 decoration: const InputDecoration(
//                   labelText: 'Phone Number',
//                   border: OutlineInputBorder(),
//                 ),
//                 keyboardType: TextInputType.phone,
//                 validator: (value) {
//                   if (value == null || value.isEmpty) {
//                     return 'Please enter your phone number';
//                   }
//                   return null;
//                 },
//               ),
//               const SizedBox(height: 16.0),
//               TextFormField(
//                 controller: _collegeIdController,
//                 decoration: const InputDecoration(
//                   labelText: 'College ID',
//                   border: OutlineInputBorder(),
//                 ),
//                 validator: (value) {
//                   if (value == null || value.isEmpty) {
//                     return 'Please enter your college ID';
//                   }
//                   return null;
//                 },
//               ),
//               const SizedBox(height: 16.0),
//               TextFormField(
//                 controller: _birthdateController,
//                 decoration: const InputDecoration(
//                   labelText: 'Birthdate',
//                   border: OutlineInputBorder(),
//                 ),
//                 keyboardType: TextInputType.datetime,
//                 validator: (value) {
//                   if (value == null || value.isEmpty) {
//                     return 'Please enter your birthdate';
//                   }
//                   return null;
//                 },
//               ),
//               const SizedBox(height: 16.0),
//               TextFormField(
//                 controller: _emailController,
//                 decoration: const InputDecoration(
//                   labelText: 'Email ID',
//                   border: OutlineInputBorder(),
//                 ),
//                 keyboardType: TextInputType.emailAddress,
//                 validator: (value) {
//                   if (value == null || value.isEmpty) {
//                     return 'Please enter your email ID';
//                   }
//                   return null;
//                 },
//               ),
//               const SizedBox(height: 16.0),
//               ElevatedButton(
//                 onPressed: _saveProfile,
//                 child: const Text('Save Profile'),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }


// filepath: [student_profile.dart](http://_vscodecontentref_/1)
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'dart:io';

class StudentProfile extends StatefulWidget {
  const StudentProfile({super.key});

  @override
  _StudentProfileState createState() => _StudentProfileState();
}

class _StudentProfileState extends State<StudentProfile> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _phoneController = TextEditingController();
  final _collegeIdController = TextEditingController();
  final _birthdateController = TextEditingController();
  final _emailController = TextEditingController();
  XFile? _profileImage;
  String? _profileImageUrl;

  @override
  void initState() {
    super.initState();
    _loadUserData();
  }

  @override
  void dispose() {
    _nameController.dispose();
    _phoneController.dispose();
    _collegeIdController.dispose();
    _birthdateController.dispose();
    _emailController.dispose();
    super.dispose();
  }

  Future<void> _loadUserData() async {
    try {
      User? user = FirebaseAuth.instance.currentUser;
      if (user != null) {
        DocumentSnapshot userDoc = await FirebaseFirestore.instance
            .collection('users')
            .doc(user.uid)
            .get();

        if (userDoc.exists) {
          Map<String, dynamic> userData = userDoc.data() as Map<String, dynamic>;
          setState(() {
            _nameController.text = userData['name'] ?? '';
            _phoneController.text = userData['phone'] ?? '';
            _collegeIdController.text = userData['collegeId'] ?? '';
            _birthdateController.text = userData['birthdate'] ?? '';
            _emailController.text = userData['email'] ?? '';
            _profileImageUrl = userData['profileImageUrl'];
          });
        }
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to load user data: $e')),
      );
    }
  }

  Future<void> _pickImage() async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      setState(() {
        _profileImage = image;
      });

      // Upload the image to Firebase Storage (optional)
      // You can implement Firebase Storage upload here if needed
    }
  }

  Future<void> _saveProfile() async {
    if (_formKey.currentState!.validate()) {
      try {
        User? user = FirebaseAuth.instance.currentUser;
        if (user != null) {
          // Update Firestore with the new data
          await FirebaseFirestore.instance.collection('users').doc(user.uid).update({
            'name': _nameController.text.trim(),
            'phone': _phoneController.text.trim(),
            'collegeId': _collegeIdController.text.trim(),
            'birthdate': _birthdateController.text.trim(),
            'email': _emailController.text.trim(),
            // Add profileImageUrl if you upload the image to Firebase Storage
          });

          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Profile saved successfully')),
          );
        }
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Failed to save profile: $e')),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Student Profile'),
        backgroundColor: const Color.fromARGB(235, 134, 201, 232),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: <Widget>[
              Center(
                child: GestureDetector(
                  onTap: _pickImage,
                  child: CircleAvatar(
                    radius: 50,
                    backgroundImage: _profileImage != null
                        ? FileImage(File(_profileImage!.path))
                        : (_profileImageUrl != null
                            ? NetworkImage(_profileImageUrl!) as ImageProvider
                            : null),
                    child: _profileImage == null && _profileImageUrl == null
                        ? const Icon(Icons.camera_alt, size: 50)
                        : null,
                  ),
                ),
              ),
              const SizedBox(height: 16.0),
              TextFormField(
                controller: _nameController,
                decoration: const InputDecoration(
                  labelText: 'Name',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your name';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16.0),
              TextFormField(
                controller: _phoneController,
                decoration: const InputDecoration(
                  labelText: 'Phone Number',
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.phone,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your phone number';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16.0),
              TextFormField(
                controller: _collegeIdController,
                decoration: const InputDecoration(
                  labelText: 'College ID',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your college ID';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16.0),
              TextFormField(
                controller: _birthdateController,
                decoration: const InputDecoration(
                  labelText: 'Birthdate',
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.datetime,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your birthdate';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16.0),
              TextFormField(
                controller: _emailController,
                decoration: const InputDecoration(
                  labelText: 'Email ID',
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.emailAddress,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your email ID';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: _saveProfile,
                child: const Text('Save Profile'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}