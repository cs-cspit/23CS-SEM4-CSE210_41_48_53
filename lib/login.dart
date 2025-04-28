
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:the_eduventure/Sevices/auth_service.dart';

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

  // Sign In with Email and Password
void _signIn() async {
  if (_emailController.text.isEmpty || _passwordController.text.isEmpty) {
    _showErrorSnackbar('Please fill in all fields');
    return;
  }

  setState(() => _isLoading = true);

  try {
    final authService = AuthService();
    
    // Check email domain before attempting sign-in
    if (!authService.isValidDomain(_emailController.text.trim())) {
      setState(() => _isLoading = false);
      _showErrorSnackbar('Invalid email domain. Please use .edu.in or .ac.in');
      return;
    }

    await authService.signin(
      email: _emailController.text.trim(),
      password: _passwordController.text.trim(),
    );

    setState(() => _isLoading = false);

    // Navigate to the appropriate home screen based on the email domain
    String email = _emailController.text.trim();
    if (email.endsWith('.edu.in')) {
      Navigator.pushReplacementNamed(context, 'student_home');
    } else if (email.endsWith('.ac.in')) {
      Navigator.pushReplacementNamed(context, 'faculty_home');
    } 
  } on FirebaseAuthException catch (e) {
    setState(() => _isLoading = false);
    String errorMessage;
    switch (e.code) {
      case 'user-not-found':
        errorMessage = 'No user found for that email.';
        break;
      case 'wrong-password':
        errorMessage = 'Wrong password provided for that user.';
        break;
      case 'invalid-email':
        errorMessage = 'The email address is not valid.';
        break;
      case 'user-disabled':
        errorMessage = 'This user has been disabled.';
        break;
      case 'invalid-domain':
        errorMessage = 'Invalid email domain. Please use .edu.in or .ac.in';
        break;
      default:
        errorMessage = 'An error occurred during sign in: ${e.message}';
    }
    _showErrorSnackbar(errorMessage);
  } catch (e) {
    setState(() => _isLoading = false);
    _showErrorSnackbar('An unexpected error occurred. Please try again.');
  }
}

// Update the _signInWithGoogle() method
Future<void> _signInWithGoogle() async {
  setState(() => _isLoading = true);
  try {
    final authService = AuthService();
    await authService.signInWithGoogle();
    setState(() => _isLoading = false);

    User? user = authService.getCurrentUser();
    if (user != null) {
      String email = user.email ?? '';
      if (email.endsWith('.edu.in')) {
        Navigator.pushReplacementNamed(context, 'student_home');
      } else if (email.endsWith('.ac.in')) {
        Navigator.pushReplacementNamed(context, 'faculty_home');
      }
    }
  } on FirebaseAuthException catch (e) {
    setState(() => _isLoading = false);
    String errorMessage;
    switch (e.code) {
      case 'invalid-domain':
        errorMessage = 'Invalid email domain. Please use .edu.in or .ac.in';
        break;
      case 'ERROR_ABORTED_BY_USER':
        errorMessage = 'Sign-in was cancelled.';
        break;
      case 'account-exists-with-different-credential':
        errorMessage = 'An account already exists with the same email address but different sign-in method.';
        break;
      default:
        errorMessage = 'Google sign in failed: ${e.message}';
    }
    _showErrorSnackbar(errorMessage);
  } catch (e) {
    setState(() => _isLoading = false);
    _showErrorSnackbar('An unexpected error occurred during Google sign in.');
  }
}

  // Show Error Snackbar
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
                      
                      // Or continue with divider
                      Row(
                        children: [
                          Expanded(
                            child: Container(
                              height: 1,
                              color: const Color(0xFFE2E8F0),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 16),
                            child: Text(
                              'Or continue with',
                              style: GoogleFonts.poppins(
                                fontSize: 12,
                                color: const Color(0xFF718096),
                              ),
                            ),
                          ),
                          Expanded(
                            child: Container(
                              height: 1,
                              color: const Color(0xFFE2E8F0),
                            ),
                          ),
                        ],
                      ),
                      
                      const SizedBox(height: 24),
                      
                      // Google Sign In button
                      _buildSocialButton(
                        onPressed: _signInWithGoogle,
                        text: 'Sign in with Google',
                        icon: Image.asset(
                          'assets/images/google_logo.png',  // Ensure you have this image in your assets
                          height: 24,
                          width: 24,
                          errorBuilder: (context, error, stackTrace) {
                            // Fallback icon if asset is missing
                            return const Icon(
                              Icons.g_mobiledata,
                              size: 24,
                              color: Color(0xFF4285F4),
                            );
                          },
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
                              Navigator.pushReplacementNamed(context, 'register');
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
  
  Widget _buildSocialButton({
    required VoidCallback onPressed,
    required String text,
    required Widget icon,
    bool isLoading = false,
  }) {
    return SizedBox(
      width: double.infinity,
      height: 56,
      child: OutlinedButton.icon(
        onPressed: isLoading ? null : onPressed,
        icon: icon,
        label: Text(
          text,
          style: GoogleFonts.poppins(
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color: const Color(0xFF2D3748),
          ),
        ),
        style: OutlinedButton.styleFrom(
          side: const BorderSide(color: Color(0xFFE2E8F0), width: 1),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          backgroundColor: Colors.white,
        ),
      ),
    );
  }
}
