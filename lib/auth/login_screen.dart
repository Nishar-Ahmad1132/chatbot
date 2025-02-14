// import 'package:bot_ai/screens/chat_screen.dart';
import 'package:bot_ai/widgets/info_page.dart';
// import 'package:bot_ai/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:bot_ai/auth/signup_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_fonts/google_fonts.dart';

final _firebase = FirebaseAuth.instance;

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();

  final bool _islogin = true;
  String _userEmail = '';
  String _userPassword = '';

  void _trySubmit() async {
    final isValid = _formKey.currentState!.validate();
    if (!isValid) {
      return;
    }

    _formKey.currentState!.save();
    if (_islogin) {
      try {
        await _firebase
            .signInWithEmailAndPassword(
                email: _userEmail, password: _userPassword)
            .then(
          (value) {
        showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  title: const Text("Welcome"),
                  content: const Text("Lodge Your Grienvance here and get suitable response from AI."),
                  actions: [
                    TextButton(
                      onPressed: () {
                        // Navigator.of(context).pop();
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const InfoPage(),
                          ),
                        );
                      },
                      child: const Text("OK"),
                    ),
                  ],
                );
              },
            );
          },
        );
      } on FirebaseAuthException catch (error) {
        if (error.code == 'email-already-in-use') {
          //...
        }
        ScaffoldMessenger.of(context).clearSnackBars();
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(error.message ?? 'Authentication Failed'),
          ),
        );
      }
    } else {
      return;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      decoration: const BoxDecoration(
        color: Colors.white,
        // image: DecorationImage(
        //   image: AssetImage('assets/lockboot.jpg'),
        //   fit: BoxFit.cover,
        // ),
      ),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.greenAccent,
          title: Text(
              'Login',
              style: GoogleFonts.lato(
                color: Colors.black,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            centerTitle: true,
          toolbarHeight: 75,
          automaticallyImplyLeading: false,
        ),
        backgroundColor: Colors.transparent,
        body: StreamBuilder<Object>(
            stream: null,
            builder: (context, snapshot) {
              return Stack(
                children: [
                  Container(
                    padding: const EdgeInsets.only(left: 35, top: 75),
                    child: Text(
                      'Welcome\nBack!',
                      style: GoogleFonts.lato(
                        color: const Color(0xFF000000),
                        fontSize: 32,
                      ),
                    ),
                  ),
                  Form(
                    key: _formKey,
                    child: SingleChildScrollView(
                      child: Container(
                        padding: EdgeInsets.only(
                            top: MediaQuery.of(context).size.height * 0.3,
                            right: 25,
                            left: 25),
                        child: Column(
                          children: [
                            TextFormField(
                              validator: (value) {
                                if (value!.isEmpty || !value.contains('@')) {
                                  return 'Please enter correct email address';
                                }
                                return null;
                              },
                              keyboardType: TextInputType.emailAddress,
                              decoration: const InputDecoration(
                                labelText: 'Email',
                                prefixIcon: Icon(Icons.email_outlined),
                              ),
                              onSaved: (value) {
                                _userEmail = value.toString();
                              },
                            ),
                            const SizedBox(height: 15),
                            TextFormField(
                              validator: (value) {
                                if (value!.isEmpty || value.length < 7) {
                                  return 'Please enter min 7 character';
                                }
                                return null;
                              },
                              obscureText: true,
                              decoration: const InputDecoration(
                                labelText: 'Password',
                                prefixIcon: Icon(Icons.lock),
                                suffixIcon: Icon(Icons.visibility),
                              ),
                              onSaved: (value) {
                                _userPassword = value.toString();
                              },
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                TextButton(
                                  style: TextButton.styleFrom(
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(16)),
                                    backgroundColor: const Color(0xFF2A2F4F),
                                  ),
                                  onPressed: _trySubmit,
                                  child: Text(
                                    'Login',
                                    style: GoogleFonts.lato(
                                      fontSize: 22,
                                      fontWeight: FontWeight.bold,
                                      color: const Color(0xFFFFEBF8),
                                    ),
                                  ),
                                )
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  child: Text(
                                    ' Create Account ?',
                                    style: GoogleFonts.lato(
                                      fontSize: 20,
                                      color: const Color(0xFF000000),
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                TextButton(
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            const SignUpScreen(),
                                      ),
                                    );
                                  },
                                  child: Text(
                                    'Sign-Up',
                                    style: GoogleFonts.lato(
                                      fontSize: 22,
                                      color: const Color.fromARGB(
                                          255, 102, 40, 36),
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              );
            }),
      ),
    );
  }
}
