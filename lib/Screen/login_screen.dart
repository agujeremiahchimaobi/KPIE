import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kpie_test/Model/model.dart';
import 'package:kpie_test/Services/api_service.dart';

import '../CustomWidgets/custom_widgets.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  late LoginRequestModel requestModel;
  late TextEditingController controller = TextEditingController();

  @override
  void initState() {
    requestModel = LoginRequestModel();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffffffff),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  height: 100,
                  color: const Color(0xfff2f5f9),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 70),
                  child: Image.asset('images/cloud.png'),
                ),
                Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.only(top: 120),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Welcome to',
                            style: GoogleFonts.lato(
                              fontSize: 16,
                              fontWeight: FontWeight.w700,
                              letterSpacing: 0.5,
                              color: const Color(0xff000140),
                            ),
                          ),
                          Text(
                            'RAKTAPP',
                            style: GoogleFonts.rubik(
                              fontSize: 52,
                              fontWeight: FontWeight.w700,
                              letterSpacing: 0.5,
                              color: const Color(0xff000140),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 25),
                      child: Center(
                        child: Text(
                          'sign in to continue',
                          style: GoogleFonts.poppins(
                              fontSize: 13,
                              fontWeight: FontWeight.w400,
                              letterSpacing: 0.5,
                              color: const Color(0xff000140)),
                        ),
                      ),
                    ),
                    Container(
                      padding:
                          const EdgeInsets.only(left: 40, right: 50, top: 50),
                      child: Column(
                        children: [
                          LogintextField(
                            onsave: (username) =>
                                requestModel.userName = username,
                            hint: 'Username or Email',
                            prefix: const ImageIcon(
                              AssetImage('images/profile.png'),
                              color: Colors.yellow,
                            ),
                          ),
                          const SizedBox(height: 10),
                          LogintextField(
                            onsave: (password) =>
                                requestModel.password = password,
                            hint: 'Username or Email',
                            prefix: const ImageIcon(
                              AssetImage('images/Lock.png'),
                            ),
                          ),
                          const SizedBox(height: 30),
                          GestureDetector(
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 20,
                                vertical: 8,
                              ),
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: Colors.yellow,
                                  width: 3,
                                ),
                                borderRadius: BorderRadius.circular(65),
                              ),
                              child: Text(
                                'Sign in',
                                style: GoogleFonts.lato(
                                  fontSize: 14,
                                  letterSpacing: 0.5,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ),
                            onTap: () async {
                              ApiService apiService = ApiService();
                              apiService.login(context, requestModel).then(
                                (value) {
                                  value.token!.isNotEmpty
                                      ? ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                          const SnackBar(
                                            backgroundColor: Colors.green,
                                            content: Text(
                                              'Logged In Sucessfully',
                                            ),
                                          ),
                                        )
                                      : ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                          const SnackBar(
                                            backgroundColor: Colors.red,
                                            content: Text(
                                              'Invalid Credentials',
                                            ),
                                          ),
                                        );
                                },
                              );
                              print(
                                requestModel.toJson(),
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 20),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Flexible(
                                child: Divider(thickness: 2),
                              ),
                              const SizedBox(width: 15),
                              Text(
                                'OR',
                                style: GoogleFonts.lato(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.grey,
                                ),
                              ),
                              const SizedBox(width: 15),
                              const Flexible(
                                child: Divider(thickness: 2),
                              )
                            ],
                          ),
                          const SizedBox(height: 20),
                          const CustomBtn(
                            prefix: 'images/google.png',
                            text: 'Login with Google',
                          ),
                          const SizedBox(height: 10),
                          const CustomBtn(
                            prefix: 'images/fb.png',
                            text: 'Login with Facebook',
                          ),
                          const SizedBox(height: 20),
                          Center(
                            child: Text(
                              'Forgot Password?',
                              style: GoogleFonts.lato(
                                fontSize: 12,
                                fontWeight: FontWeight.w700,
                                letterSpacing: 0.5,
                                color: const Color(0xff000140),
                              ),
                            ),
                          ),
                          const SizedBox(height: 15),
                          RichText(
                            text: TextSpan(
                              children: [
                                TextSpan(
                                  text: 'Don’t have an account? ',
                                  style: GoogleFonts.lato(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w400,
                                    letterSpacing: 0.5,
                                    color: Colors.grey,
                                  ),
                                ),
                                TextSpan(
                                  text: ' Sign Up',
                                  style: GoogleFonts.lato(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w700,
                                    letterSpacing: 0.5,
                                    color: const Color(0xff000140),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 30)
                        ],
                      ),
                    )
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
