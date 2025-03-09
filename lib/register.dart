// import 'package:flutter/material.dart';

// class MyRegister extends StatefulWidget {
//   const MyRegister({super.key});

//   @override
//   MyRegisterState createState() => MyRegisterState();
// }

// class MyRegisterState extends State<MyRegister> {
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       decoration: const BoxDecoration(
//         image: DecorationImage(
//           image: AssetImage('assets/register.png'),
//           fit: BoxFit.cover,
//         ),
//       ),
//       child: Scaffold(
//         backgroundColor: Colors.transparent,
//         appBar: AppBar(
//           backgroundColor: Colors.transparent,
//           elevation: 0,
//         ),
//         body: Stack(
//           children: [
//             Container(
//               padding: const EdgeInsets.only(left: 35, top: 30),
//               child: const Text(
//                 'Create\nAccount',
//                 style: TextStyle(color: Colors.white, fontSize: 33),
//               ),
//             ),
//             SingleChildScrollView(
//               child: Container(
//                 padding: EdgeInsets.only(
//                   top: MediaQuery.of(context).size.height * 0.28,
//                 ),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Container(
//                       margin: const EdgeInsets.only(left: 35, right: 35),
//                       child: Column(
//                         children: [
//                           TextField(
//                             style: const TextStyle(color: Colors.white),
//                             decoration: InputDecoration(
//                               enabledBorder: OutlineInputBorder(
//                                 borderRadius: BorderRadius.circular(10),
//                                 borderSide: const BorderSide(
//                                   color: Colors.white,
//                                 ),
//                               ),
//                               focusedBorder: OutlineInputBorder(
//                                 borderRadius: BorderRadius.circular(10),
//                                 borderSide: const BorderSide(
//                                   color: Colors.black,
//                                 ),
//                               ),
//                               hintText: "Name",
//                               hintStyle: const TextStyle(color: Colors.white),
//                               border: OutlineInputBorder(
//                                 borderRadius: BorderRadius.circular(10),
//                               ),
//                             ),
//                           ),
//                           const SizedBox(
//                             height: 30,
//                           ),
//                           TextField(
//                             style: const TextStyle(color: Colors.white),
//                             decoration: InputDecoration(
//                               enabledBorder: OutlineInputBorder(
//                                 borderRadius: BorderRadius.circular(10),
//                                 borderSide: const BorderSide(
//                                   color: Colors.white,
//                                 ),
//                               ),
//                               focusedBorder: OutlineInputBorder(
//                                 borderRadius: BorderRadius.circular(10),
//                                 borderSide: const BorderSide(
//                                   color: Colors.black,
//                                 ),
//                               ),
//                               hintText: "Email",
//                               hintStyle: const TextStyle(color: Colors.white),
//                               border: OutlineInputBorder(
//                                 borderRadius: BorderRadius.circular(10),
//                               ),
//                             ),
//                           ),
//                           const SizedBox(
//                             height: 30,
//                           ),
//                           TextField(
//                             style: const TextStyle(color: Colors.white),
//                             obscureText: true,
//                             decoration: InputDecoration(
//                               enabledBorder: OutlineInputBorder(
//                                 borderRadius: BorderRadius.circular(10),
//                                 borderSide: const BorderSide(
//                                   color: Colors.white,
//                                 ),
//                               ),
//                               focusedBorder: OutlineInputBorder(
//                                 borderRadius: BorderRadius.circular(10),
//                                 borderSide: const BorderSide(
//                                   color: Colors.black,
//                                 ),
//                               ),
//                               hintText: "Password",
//                               hintStyle: const TextStyle(color: Colors.white),
//                               border: OutlineInputBorder(
//                                 borderRadius: BorderRadius.circular(10),
//                               ),
//                             ),
//                           ),
//                           const SizedBox(
//                             height: 40,
//                           ),
//                           Row(
//                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                             children: [
//                               const Text(
//                                 'Sign Up',
//                                 style: TextStyle(
//                                   color: Colors.white,
//                                   fontSize: 27,
//                                   fontWeight: FontWeight.w700,
//                                 ),
//                               ),
//                               CircleAvatar(
//                                 radius: 30,
//                                 backgroundColor: const Color(0xff4c505b),
//                                 child: IconButton(
//                                   color: Colors.white,
//                                   onPressed: () {
//                                     // Navigate to home screen upon successful registration
//                                     Navigator.pushNamed(context, 'home');
//                                   },
//                                   icon: const Icon(
//                                     Icons.arrow_forward,
//                                   ),
//                                 ),
//                               ),
//                             ],
//                           ),
//                           const SizedBox(
//                             height: 40,
//                           ),
//                           Row(
//                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                             children: [
//                               TextButton(
//                                 onPressed: () {
//                                   Navigator.pushNamed(context, 'login');
//                                 },
//                                 style: ButtonStyle(),
//                                 child: const Text(
//                                   'Sign In',
//                                   textAlign: TextAlign.left,
//                                   style: TextStyle(
//                                     decoration: TextDecoration.underline,
//                                     color: Colors.white,
//                                     fontSize: 18,
//                                   ),
//                                 ),
//                               ),
//                             ],
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

// import 'package:flutter/material.dart';

// class MyRegister extends StatefulWidget {
//   const MyRegister({super.key});

//   @override
//   MyRegisterState createState() => MyRegisterState();
// }

// class MyRegisterState extends State<MyRegister> {
//   final TextEditingController _nameController = TextEditingController();
//   final TextEditingController _emailController = TextEditingController();
//   final TextEditingController _passwordController = TextEditingController();

//   @override
//   void dispose() {
//     _nameController.dispose();
//     _emailController.dispose();
//     _passwordController.dispose();
//     super.dispose();
//   }

//   void _register() {
//     // Implement your registration logic here
//     Navigator.pushReplacementNamed(context, 'login');
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       decoration: const BoxDecoration(
//         image: DecorationImage(
//           image: AssetImage('assets/register.png'),
//           fit: BoxFit.cover,
//         ),
//       ),
//       child: Scaffold(
//         backgroundColor: Colors.transparent,
//         appBar: AppBar(backgroundColor: Colors.transparent, elevation: 0),
//         body: Stack(
//           children: [
//             Container(
//               padding: const EdgeInsets.only(left: 35, top: 30),
//               child: const Text(
//                 'Create\nAccount',
//                 style: TextStyle(color: Colors.white, fontSize: 33),
//               ),
//             ),
//             SingleChildScrollView(
//               child: Container(
//                 padding: EdgeInsets.only(
//                   top: MediaQuery.of(context).size.height * 0.28,
//                 ),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Container(
//                       margin: const EdgeInsets.only(left: 35, right: 35),
//                       child: Column(
//                         children: [
//                           TextField(
//                             controller: _nameController,
//                             style: const TextStyle(color: Colors.white),
//                             decoration: InputDecoration(
//                               enabledBorder: OutlineInputBorder(
//                                 borderRadius: BorderRadius.circular(10),
//                                 borderSide: const BorderSide(
//                                   color: Colors.white,
//                                 ),
//                               ),
//                               focusedBorder: OutlineInputBorder(
//                                 borderRadius: BorderRadius.circular(10),
//                                 borderSide: const BorderSide(
//                                   color: Colors.black,
//                                 ),
//                               ),
//                               hintText: "Name",
//                               hintStyle: const TextStyle(color: Colors.white),
//                               border: OutlineInputBorder(
//                                 borderRadius: BorderRadius.circular(10),
//                               ),
//                             ),
//                           ),
//                           const SizedBox(height: 30),
//                           TextField(
//                             controller: _emailController,
//                             style: const TextStyle(color: Colors.white),
//                             decoration: InputDecoration(
//                               enabledBorder: OutlineInputBorder(
//                                 borderRadius: BorderRadius.circular(10),
//                                 borderSide: const BorderSide(
//                                   color: Colors.white,
//                                 ),
//                               ),
//                               focusedBorder: OutlineInputBorder(
//                                 borderRadius: BorderRadius.circular(10),
//                                 borderSide: const BorderSide(
//                                   color: Colors.black,
//                                 ),
//                               ),
//                               hintText: "Email",
//                               hintStyle: const TextStyle(color: Colors.white),
//                               border: OutlineInputBorder(
//                                 borderRadius: BorderRadius.circular(10),
//                               ),
//                             ),
//                           ),
//                           const SizedBox(height: 30),
//                           TextField(
//                             controller: _passwordController,
//                             style: const TextStyle(color: Colors.white),
//                             obscureText: true,
//                             decoration: InputDecoration(
//                               enabledBorder: OutlineInputBorder(
//                                 borderRadius: BorderRadius.circular(10),
//                                 borderSide: const BorderSide(
//                                   color: Colors.white,
//                                 ),
//                               ),
//                               focusedBorder: OutlineInputBorder(
//                                 borderRadius: BorderRadius.circular(10),
//                                 borderSide: const BorderSide(
//                                   color: Colors.black,
//                                 ),
//                               ),
//                               hintText: "Password",
//                               hintStyle: const TextStyle(color: Colors.white),
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
//                                 'Sign Up',
//                                 style: TextStyle(
//                                   color: Colors.white,
//                                   fontSize: 27,
//                                   fontWeight: FontWeight.w700,
//                                 ),
//                               ),
//                               CircleAvatar(
//                                 radius: 30,
//                                 backgroundColor: const Color(0xff4c505b),
//                                 child: IconButton(
//                                   color: Colors.white,
//                                   onPressed: _register,
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
//                                   Navigator.pushReplacementNamed(
//                                     context,
//                                     'login',
//                                   );
//                                 },
//                                 style: ButtonStyle(),
//                                 child: const Text(
//                                   'Sign In',
//                                   textAlign: TextAlign.left,
//                                   style: TextStyle(
//                                     decoration: TextDecoration.underline,
//                                     color: Colors.white,
//                                     fontSize: 18,
//                                   ),
//                                 ),
//                               ),
//                             ],
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
import 'package:google_fonts/google_fonts.dart';

class MyRegister extends StatefulWidget {
  const MyRegister({super.key});

  @override
  MyRegisterState createState() => MyRegisterState();
}

class MyRegisterState extends State<MyRegister> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  final _formKey = GlobalKey<FormState>();
  bool _obscurePassword = true;
  bool _obscureConfirmPassword = true;
  bool _isLoading = false;
  String _selectedRole = 'Student';

  // For password strength indicator
  double _passwordStrength = 0.0;
  String _passwordStrengthText = 'Add your password';
  Color _passwordStrengthColor = Colors.grey;

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  void _checkPasswordStrength(String password) {
    if (password.isEmpty) {
      setState(() {
        _passwordStrength = 0.0;
        _passwordStrengthText = 'Add your password';
        _passwordStrengthColor = Colors.grey;
      });
      return;
    }

    // Simple password strength evaluation
    double strength = 0;

    // Check length
    if (password.length >= 8) strength += 0.25;

    // Check for uppercase letters
    if (password.contains(RegExp(r'[A-Z]'))) strength += 0.25;

    // Check for numbers
    if (password.contains(RegExp(r'[0-9]'))) strength += 0.25;

    // Check for special characters
    if (password.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'))) strength += 0.25;

    // Update UI based on strength
    String text;
    Color color;

    if (strength <= 0.25) {
      text = 'Weak';
      color = Colors.red;
    } else if (strength <= 0.5) {
      text = 'Fair';
      color = Colors.orange;
    } else if (strength <= 0.75) {
      text = 'Good';
      color = Colors.yellow.shade700;
    } else {
      text = 'Strong';
      color = Colors.green;
    }

    setState(() {
      _passwordStrength = strength;
      _passwordStrengthText = text;
      _passwordStrengthColor = color;
    });
  }

  void _register() {
    if (_formKey.currentState!.validate()) {
      setState(() => _isLoading = true);

      // Simulate network request
      Future.delayed(const Duration(seconds: 2), () {
        setState(() => _isLoading = false);

        // Create a success message before navigation
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              'Account created successfully!',
              style: GoogleFonts.poppins(),
            ),
            backgroundColor: Colors.green,
            behavior: SnackBarBehavior.floating,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            margin: const EdgeInsets.all(16),
          ),
        );

        // Wait for the snackbar to be visible before navigating
        Future.delayed(const Duration(milliseconds: 1500), () {
          Navigator.pushReplacementNamed(context, 'login');
        });
      });
    }
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
                  child: Form(
                    key: _formKey,
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
                          'Create Account',
                          style: GoogleFonts.poppins(
                            fontSize: 26,
                            fontWeight: FontWeight.bold,
                            color: const Color(0xFF2D3748),
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          'Join our learning community today',
                          style: GoogleFonts.poppins(
                            fontSize: 14,
                            color: const Color(0xFF718096),
                          ),
                          textAlign: TextAlign.center,
                        ),

                        const SizedBox(height: 40),

                        // Role selection
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 8,
                          ),
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
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(
                                  left: 4,
                                  bottom: 8,
                                  top: 4,
                                ),
                                child: Text(
                                  'I am a:',
                                  style: GoogleFonts.poppins(
                                    fontSize: 13,
                                    fontWeight: FontWeight.w500,
                                    color: const Color(0xFF718096),
                                  ),
                                ),
                              ),
                              Row(
                                children: [
                                  Expanded(
                                    child: GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          _selectedRole = 'Student';
                                        });
                                      },
                                      child: _buildRoleOption(
                                        'Student',
                                        Icons.school,
                                        isSelected: _selectedRole == 'Student',
                                      ),
                                    ),
                                  ),
                                  const SizedBox(width: 12),
                                  Expanded(
                                    child: GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          _selectedRole = 'Faculty';
                                        });
                                      },
                                      child: _buildRoleOption(
                                        'Faculty',
                                        Icons.person,
                                        isSelected: _selectedRole == 'Faculty',
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),

                        const SizedBox(height: 24),

                        // Name field
                        _buildTextField(
                          controller: _nameController,
                          hintText: 'Full Name',
                          prefixIcon: Icons.person_outline,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your name';
                            }
                            if (value.length < 2) {
                              return 'Name is too short';
                            }
                            return null;
                          },
                        ),

                        const SizedBox(height: 16),

                        // Email field
                        _buildTextField(
                          controller: _emailController,
                          hintText: 'Email Address',
                          prefixIcon: Icons.email_outlined,
                          keyboardType: TextInputType.emailAddress,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your email';
                            }

                            bool emailValid = RegExp(
                              r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
                            ).hasMatch(value);

                            if (!emailValid) {
                              return 'Please enter a valid email';
                            }

                            if (_selectedRole == 'Student' &&
                                !value.endsWith('.edu.in')) {
                              return 'Students must use .edu.in email';
                            }

                            if (_selectedRole == 'Faculty' &&
                                !value.endsWith('.ac.in')) {
                              return 'Faculty must use .ac.in email';
                            }

                            return null;
                          },
                        ),

                        const SizedBox(height: 16),

                        // Password field
                        _buildTextField(
                          controller: _passwordController,
                          hintText: 'Password',
                          prefixIcon: Icons.lock_outline,
                          obscureText: _obscurePassword,
                          onChanged: _checkPasswordStrength,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter a password';
                            }
                            if (value.length < 8) {
                              return 'Password must be at least 8 characters';
                            }
                            return null;
                          },
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

                        // Password strength indicator
                        Padding(
                          padding: const EdgeInsets.only(
                            top: 8,
                            left: 4,
                            right: 4,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Password Strength:',
                                    style: GoogleFonts.poppins(
                                      fontSize: 12,
                                      color: const Color(0xFF718096),
                                    ),
                                  ),
                                  Text(
                                    _passwordStrengthText,
                                    style: GoogleFonts.poppins(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w500,
                                      color: _passwordStrengthColor,
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 4),
                              LinearProgressIndicator(
                                value: _passwordStrength,
                                backgroundColor: Colors.grey.shade300,
                                borderRadius: BorderRadius.circular(10),
                                color: _passwordStrengthColor,
                                minHeight: 5,
                              ),
                              const SizedBox(height: 8),
                              Text(
                                'Use 8+ characters with a mix of letters, numbers & symbols',
                                style: GoogleFonts.poppins(
                                  fontSize: 11,
                                  color: const Color(0xFF718096),
                                ),
                              ),
                            ],
                          ),
                        ),

                        const SizedBox(height: 16),

                        // Confirm Password field
                        _buildTextField(
                          controller: _confirmPasswordController,
                          hintText: 'Confirm Password',
                          prefixIcon: Icons.lock_outline,
                          obscureText: _obscureConfirmPassword,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please confirm your password';
                            }
                            if (value != _passwordController.text) {
                              return 'Passwords do not match';
                            }
                            return null;
                          },
                          suffixIcon: IconButton(
                            icon: Icon(
                              _obscureConfirmPassword
                                  ? Icons.visibility_outlined
                                  : Icons.visibility_off_outlined,
                              color: const Color(0xFF718096),
                            ),
                            onPressed: () {
                              setState(() {
                                _obscureConfirmPassword =
                                    !_obscureConfirmPassword;
                              });
                            },
                          ),
                        ),

                        const SizedBox(height: 32),

                        // Sign up button
                        _buildPrimaryButton(
                          onPressed: _register,
                          text: 'Create Account',
                          isLoading: _isLoading,
                        ),

                        const SizedBox(height: 32),

                        // Sign in option
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Already have an account?',
                              style: GoogleFonts.poppins(
                                fontSize: 14,
                                color: const Color(0xFF718096),
                              ),
                            ),
                            TextButton(
                              onPressed: () {
                                Navigator.pushReplacementNamed(
                                  context,
                                  'login',
                                );
                              },
                              style: TextButton.styleFrom(
                                foregroundColor: const Color(0xFF5A6BF5),
                              ),
                              child: Text(
                                'Sign In',
                                style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 14,
                                ),
                              ),
                            ),
                          ],
                        ),

                        const SizedBox(height: 24),
                      ],
                    ),
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
    String? Function(String?)? validator,
    void Function(String)? onChanged,
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
          errorStyle: GoogleFonts.poppins(
            fontSize: 12,
            color: Colors.red.shade700,
          ),
        ),
        validator: validator,
        onChanged: onChanged,
      ),
    );
  }

  Widget _buildRoleOption(
    String title,
    IconData icon, {
    required bool isSelected,
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 8),
      decoration: BoxDecoration(
        color:
            isSelected
                ? const Color(0xFF5A6BF5).withOpacity(0.1)
                : Colors.transparent,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: isSelected ? const Color(0xFF5A6BF5) : Colors.grey.shade300,
          width: 1.5,
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            color: isSelected ? const Color(0xFF5A6BF5) : Colors.grey.shade600,
            size: 20,
          ),
          const SizedBox(width: 8),
          Text(
            title,
            style: GoogleFonts.poppins(
              fontSize: 14,
              fontWeight: isSelected ? FontWeight.w600 : FontWeight.w500,
              color:
                  isSelected ? const Color(0xFF5A6BF5) : Colors.grey.shade700,
            ),
          ),
        ],
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
}
