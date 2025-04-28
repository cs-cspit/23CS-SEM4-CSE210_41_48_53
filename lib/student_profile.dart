import 'dart:io';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:intl/intl.dart';
import 'package:the_eduventure/Sevices/auth_service.dart';

class StudentProfile extends StatefulWidget {
  const StudentProfile({super.key});

  @override
  StudentProfileState createState() => StudentProfileState();
}

class StudentProfileState extends State<StudentProfile> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _phoneController = TextEditingController();
  final _collegeIdController = TextEditingController();
  final _birthdateController = TextEditingController();
  final _emailController = TextEditingController();
  final _departmentController = TextEditingController();
  XFile? _profileImage;
  String? _profileImageUrl;
  bool _isLoading = false;
  bool _isEditing = false;
  DateTime? _selectedDate;
  final AuthService _authService = AuthService();

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
    _departmentController.dispose();
    super.dispose();
  }

  Future<void> _loadUserData() async {
    setState(() {
      _isLoading = true;
    });
    try {
      User? user = _authService.getCurrentUser();
      if (user != null) {
        DocumentSnapshot? userDoc = await _authService.getCurrentUserData();

        if (userDoc != null && userDoc.exists) {
          Map<String, dynamic> userData = userDoc.data() as Map<String, dynamic>;
          setState(() {
            _nameController.text = userData['name'] ?? '';
            _phoneController.text = userData['phone'] ?? '';
            _collegeIdController.text = userData['collegeId'] ?? '';
            _birthdateController.text = userData['birthdate'] ?? '';
            _emailController.text = userData['email'] ?? '';
            _departmentController.text = userData['department'] ?? '';
            _profileImageUrl = userData['profileImageUrl'];
            
            // Parse date if available
            if (userData['birthdate'] != null && userData['birthdate'].isNotEmpty) {
              try {
                _selectedDate = DateFormat('dd-MM-yyyy').parse(userData['birthdate']);
              } catch (e) {
                debugPrint('Date parsing error: $e');
              }
            }
          });
        }
      }
    } catch (e) {
      _showErrorSnackbar('Failed to load user data: $e');
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime now = DateTime.now();
    final DateTime initialDate = _selectedDate ?? 
        DateTime(now.year - 18, now.month, now.day);
    
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: initialDate,
      firstDate: DateTime(1950),
      lastDate: DateTime(now.year - 15, now.month, now.day),
      builder: (context, child) {
        return Theme(
          data: ThemeData.light().copyWith(
            colorScheme: const ColorScheme.light(
              primary: Color(0xFF5A6BF5),
              onPrimary: Colors.white,
              surface: Colors.white,
              onSurface: Color(0xFF2D3748),
            ),
            dialogBackgroundColor: Colors.white,
          ),
          child: child!,
        );
      },
    );

    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
        _birthdateController.text = DateFormat('dd-MM-yyyy').format(picked);
      });
    }
  }

  Future<void> _pickImage() async {
    final ImagePicker picker = ImagePicker();
    
    // Show a dialog to choose between camera and gallery
    await showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (BuildContext context) {
        return Container(
          padding: const EdgeInsets.all(20),
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Profile Photo',
                style: GoogleFonts.poppins(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: const Color(0xFF2D3748),
                ),
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _buildImageSourceOption(
                    context,
                    Icons.camera_alt,
                    'Camera',
                    () async {
                      Navigator.pop(context);
                      final XFile? image = await picker.pickImage(
                        source: ImageSource.camera,
                        imageQuality: 80,
                      );
                      if (image != null) {
                        setState(() {
                          _profileImage = image;
                        });
                      }
                    },
                  ),
                  _buildImageSourceOption(
                    context,
                    Icons.photo_library,
                    'Gallery',
                    () async {
                      Navigator.pop(context);
                      final XFile? image = await picker.pickImage(
                        source: ImageSource.gallery,
                        imageQuality: 80,
                      );
                      if (image != null) {
                        setState(() {
                          _profileImage = image;
                        });
                      }
                    },
                  ),
                  if (_profileImageUrl != null || _profileImage != null)
                    _buildImageSourceOption(
                      context,
                      Icons.delete,
                      'Remove',
                      () {
                        Navigator.pop(context);
                        setState(() {
                          _profileImage = null;
                          _profileImageUrl = null;
                        });
                      },
                      color: Colors.red.shade700,
                    ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildImageSourceOption(
    BuildContext context,
    IconData icon,
    String label,
    VoidCallback onTap, {
    Color color = const Color(0xFF5A6BF5),
  }) {
    return InkWell(
      onTap: onTap,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            padding: const EdgeInsets.all(15),
            decoration: BoxDecoration(
              color: color.withOpacity(0.1),
              shape: BoxShape.circle,
            ),
            child: Icon(
              icon,
              color: color,
              size: 30,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            label,
            style: GoogleFonts.poppins(
              color: const Color(0xFF2D3748),
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }

  Future<String?> _uploadImageToFirebase() async {
    if (_profileImage == null) return _profileImageUrl;

    setState(() {
      _isLoading = true;
    });

    try {
      // Creating a unique file name
      String fileName = 'profile_image_${DateTime.now().millisecondsSinceEpoch}.jpg';
      Reference firebaseStorageRef =
          FirebaseStorage.instance.ref().child('profile_images/$fileName');
      
      // Upload image
      UploadTask uploadTask =
          firebaseStorageRef.putFile(File(_profileImage!.path));
      TaskSnapshot taskSnapshot = await uploadTask;
      
      // Get download URL
      String downloadUrl = await taskSnapshot.ref.getDownloadURL();
      return downloadUrl;
    } catch (e) {
      _showErrorSnackbar('Failed to upload image: $e');
      return null;
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  void _toggleEditMode() {
    setState(() {
      _isEditing = !_isEditing;
    });
  }

  Future<void> _saveProfile() async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        _isLoading = true;
      });
      
      try {
        User? user = _authService.getCurrentUser();
        if (user != null) {
          // Upload profile image if changed
          String? newProfileImageUrl;
          if (_profileImage != null) {
            newProfileImageUrl = await _uploadImageToFirebase();
          }

          // Create update data map
          Map<String, dynamic> updateData = {
            'name': _nameController.text.trim(),
            'phone': _phoneController.text.trim(),
            'collegeId': _collegeIdController.text.trim(),
            'birthdate': _birthdateController.text.trim(),
            'department': _departmentController.text.trim(),
          };

          // Only update profile image URL if it changed
          if (_profileImage != null) {
            if (newProfileImageUrl != null) {
              updateData['profileImageUrl'] = newProfileImageUrl;
              _profileImageUrl = newProfileImageUrl;
            }
          } else if (_profileImageUrl == null) {
            // If the user removed their profile image
            updateData['profileImageUrl'] = FieldValue.delete();
          }

          // Update user profile using AuthService
          await _authService.updateUserProfile(
            uid: user.uid,
            data: updateData,
          );

          _showSuccessSnackbar('Profile updated successfully');
          _toggleEditMode(); // Exit edit mode after saving
        }
      } catch (e) {
        _showErrorSnackbar('Failed to update profile: $e');
      } finally {
        setState(() {
          _isLoading = false;
        });
      }
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

  void _showSuccessSnackbar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: Colors.green.shade700,
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
      appBar: AppBar(
        title: Text(
          'Student Profile',
          style: GoogleFonts.poppins(
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: const Color(0xFF5A6BF5),
        foregroundColor: Colors.white,
        elevation: 0,
        actions: [
          IconButton(
            icon: Icon(_isEditing ? Icons.close : Icons.edit),
            onPressed: _toggleEditMode,
          ),
        ],
      ),
      body: _isLoading 
        ? const Center(
            child: CircularProgressIndicator(color: Color(0xFF5A6BF5)),
          ) 
        : SingleChildScrollView(
            child: Column(
              children: [
                // Profile Header with Image
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: const Color(0xFF5A6BF5),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.2),
                        spreadRadius: 1,
                        blurRadius: 10,
                        offset: const Offset(0, 3),
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      const SizedBox(height: 20),
                      GestureDetector(
                        onTap: _isEditing ? _pickImage : null,
                        child: Stack(
                          children: [
                            Container(
                              width: 120,
                              height: 120,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                shape: BoxShape.circle,
                                border: Border.all(
                                  color: Colors.white,
                                  width: 4,
                                ),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withOpacity(0.1),
                                    spreadRadius: 1,
                                    blurRadius: 10,
                                    offset: const Offset(0, 3),
                                  ),
                                ],
                                image: _profileImage != null
                                  ? DecorationImage(
                                      image: FileImage(File(_profileImage!.path)),
                                      fit: BoxFit.cover,
                                    )
                                  : _profileImageUrl != null
                                    ? DecorationImage(
                                        image: NetworkImage(_profileImageUrl!),
                                        fit: BoxFit.cover,
                                      )
                                    : null,
                              ),
                              child: _profileImage == null && _profileImageUrl == null
                                ? Icon(
                                    Icons.person,
                                    size: 65,
                                    color: Colors.grey.shade400,
                                  )
                                : null,
                            ),
                            if (_isEditing)
                              Positioned(
                                bottom: 0,
                                right: 0,
                                child: Container(
                                  padding: const EdgeInsets.all(8),
                                  decoration: const BoxDecoration(
                                    color: Color(0xFF5A6BF5),
                                    shape: BoxShape.circle,
                                  ),
                                  child: const Icon(
                                    Icons.camera_alt,
                                    color: Colors.white,
                                    size: 20,
                                  ),
                                ),
                              ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 15),
                      Text(
                        _nameController.text,
                        style: GoogleFonts.poppins(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(height: 5),
                      Text(
                        _emailController.text,
                        style: GoogleFonts.poppins(
                          fontSize: 14,
                          color: Colors.white.withOpacity(0.9),
                        ),
                      ),
                      const SizedBox(height: 30),
                    ],
                  ),
                ),

                // Profile Form
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        const SizedBox(height: 10),
                        
                        // Personal Information Section
                        Text(
                          'Personal Information',
                          style: GoogleFonts.poppins(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                            color: const Color(0xFF2D3748),
                          ),
                        ),
                        const SizedBox(height: 16),
                        
                        // Name Field
                        _buildTextField(
                          controller: _nameController,
                          labelText: 'Full Name',
                          hintText: 'Enter your full name',
                          prefixIcon: Icons.person_outline,
                          enabled: _isEditing,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your name';
                            }
                            return null;
                          },
                        ),
                        
                        const SizedBox(height: 16),
                        
                        // Phone Number Field
                        _buildTextField(
                          controller: _phoneController,
                          labelText: 'Phone Number',
                          hintText: 'Enter your phone number',
                          prefixIcon: Icons.phone_outlined,
                          keyboardType: TextInputType.phone,
                          enabled: _isEditing,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your phone number';
                            }
                            if (!RegExp(r'^\d{10}$').hasMatch(value)) {
                              return 'Please enter a valid 10-digit phone number';
                            }
                            return null;
                          },
                        ),
                        
                        const SizedBox(height: 16),
                        
                        // Birthdate Field
                        _buildTextField(
                          controller: _birthdateController,
                          labelText: 'Date of Birth',
                          hintText: 'DD-MM-YYYY',
                          prefixIcon: Icons.calendar_today_outlined,
                          enabled: _isEditing,
                          readOnly: true,
                          onTap: _isEditing ? () => _selectDate(context) : null,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your date of birth';
                            }
                            return null;
                          },
                        ),
                        
                        const SizedBox(height: 24),
                        
                        // Academic Information Section
                        Text(
                          'Academic Information',
                          style: GoogleFonts.poppins(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                            color: const Color(0xFF2D3748),
                          ),
                        ),
                        const SizedBox(height: 16),
                        
                        // College ID Field
                        _buildTextField(
                          controller: _collegeIdController,
                          labelText: 'College ID / Roll Number',
                          hintText: 'Enter your college ID',
                          prefixIcon: Icons.badge_outlined,
                          enabled: _isEditing,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your college ID';
                            }
                            return null;
                          },
                        ),
                        
                        const SizedBox(height: 16),
                        
                        // Department Field
                        _buildTextField(
                          controller: _departmentController,
                          labelText: 'Department',
                          hintText: 'Enter your department/major',
                          prefixIcon: Icons.school_outlined,
                          enabled: _isEditing,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your department';
                            }
                            return null;
                          },
                        ),
                        
                        const SizedBox(height: 16),
                        
                        // Email Field
                        _buildTextField(
                          controller: _emailController,
                          labelText: 'Email',
                          hintText: 'Your email address',
                          prefixIcon: Icons.email_outlined,
                          keyboardType: TextInputType.emailAddress,
                          enabled: false, // Email shouldn't be editable
                        ),
                        
                        const SizedBox(height: 30),
                        
                        // Save Button
                        if (_isEditing)
                          _buildPrimaryButton(
                            onPressed: _saveProfile,
                            text: 'Save Changes',
                            isLoading: _isLoading,
                          ),
                        
                        // Reset Password
                        if (!_isEditing)
                          Center(
                            child: TextButton.icon(
                              onPressed: () async {
                                try {
                                  await _authService.resetPassword(_emailController.text);
                                  _showSuccessSnackbar('Password reset email sent to ${_emailController.text}');
                                } catch (e) {
                                  _showErrorSnackbar('Failed to send password reset email: $e');
                                }
                              },
                              icon: const Icon(Icons.lock_reset, size: 18),
                              label: Text(
                                'Reset Password',
                                style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              style: TextButton.styleFrom(
                                foregroundColor: const Color(0xFF5A6BF5),
                              ),
                            ),
                          ),
                        
                        const SizedBox(height: 30),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
    );
  }
  
  Widget _buildTextField({
    required TextEditingController controller,
    required String labelText,
    required String hintText,
    required IconData prefixIcon,
    TextInputType keyboardType = TextInputType.text,
    bool enabled = true,
    bool readOnly = false,
    VoidCallback? onTap,
    String? Function(String?)? validator,
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
      child: TextFormField(
        controller: controller,
        enabled: enabled,
        readOnly: readOnly,
        onTap: onTap,
        keyboardType: keyboardType,
        style: GoogleFonts.poppins(
          fontSize: 14,
          color: const Color(0xFF2D3748),
        ),
        decoration: InputDecoration(
          labelText: labelText,
          hintText: hintText,
          labelStyle: GoogleFonts.poppins(
            color: const Color(0xFF718096),
            fontSize: 14,
          ),
          hintStyle: GoogleFonts.poppins(
            color: const Color(0xFFA0AEC0),
            fontSize: 14,
          ),
          prefixIcon: Icon(
            prefixIcon,
            color: const Color(0xFF718096),
            size: 18,
          ),
          border: InputBorder.none,
          contentPadding: const EdgeInsets.symmetric(vertical: 16),
          errorStyle: GoogleFonts.poppins(
            fontSize: 12,
            color: Colors.red.shade700,
          ),
          disabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.transparent),
          ),
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Color(0xFF5A6BF5)),
          ),
        ),
        validator: validator,
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
        child: isLoading
            ? const CircularProgressIndicator(color: Colors.white)
            : Text(
                text,
                style: GoogleFonts.poppins(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
      ),
    );
  }
}
