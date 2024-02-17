import 'package:flutter/material.dart';
import 'package:startify/globale.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:startify/views/component/Button.dart';

class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}

bool _obscurePassword = true;
bool isChecked = false;
final TextEditingController usernameController = TextEditingController();
final TextEditingController passwordController = TextEditingController();
final TextEditingController confirmpasswordController = TextEditingController();

class _SignupState extends State<Signup> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: AppColor.white,
          body: SingleChildScrollView(
            child: Container(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Image(
                            image: AssetImage('assets/images/logo2.png'),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 50,
                      ),
                      Text(
                        'Create your profile ✍️',
                        style: GoogleFonts.poppins(
                          textStyle: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: AppColor.bleu),
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        'Sign up for faster startup management!',
                        style: GoogleFonts.poppins(
                          textStyle: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w400,
                              color: AppColor.grey),
                        ),
                      ),
                      SizedBox(
                        height: 50,
                      ),
                      TextFormField(
                        key: Key('username_field'),
                        controller: usernameController,
                        decoration: InputDecoration(
                          labelText: 'Username',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5.0),
                              borderSide: BorderSide(color: AppColor.grey)),
                          labelStyle: TextStyle(color: AppColor.grey),
                          contentPadding: EdgeInsets.symmetric(
                              vertical: 20.0, horizontal: 16.0),
                          prefixIcon: Icon(Icons.person, color: AppColor.grey),
                        ),
                      ),
                      SizedBox(height: 30),
                      TextFormField(
                        key: Key('password_field'),
                        controller: passwordController,
                        obscureText: _obscurePassword,
                        decoration: InputDecoration(
                          labelText: 'Password',
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5.0),
                              borderSide: BorderSide(color: AppColor.grey)),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5.0),
                              borderSide: BorderSide(color: AppColor.grey)),
                          labelStyle: TextStyle(color: AppColor.grey),
                          contentPadding: EdgeInsets.symmetric(
                              vertical: 20.0, horizontal: 16.0),
                          prefixIcon: Icon(Icons.lock, color: AppColor.grey),
                          suffixIcon: GestureDetector(
                            onTap: () {
                              setState(() {
                                _obscurePassword = !_obscurePassword;
                              });
                            },
                            child: Icon(
                              _obscurePassword
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                              color: AppColor.grey,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      TextFormField(
                        key: Key('password_confirm_field'),
                        controller: passwordController,
                        obscureText: _obscurePassword,
                        decoration: InputDecoration(
                          labelText: 'Confirm  Password',
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5.0),
                              borderSide: BorderSide(color: AppColor.grey)),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5.0),
                              borderSide: BorderSide(color: AppColor.grey)),
                          labelStyle: TextStyle(color: AppColor.grey),
                          contentPadding: EdgeInsets.symmetric(
                              vertical: 20.0, horizontal: 16.0),
                          prefixIcon: Icon(Icons.lock, color: AppColor.grey),
                          suffixIcon: GestureDetector(
                            onTap: () {
                              setState(() {
                                _obscurePassword = !_obscurePassword;
                              });
                            },
                            child: Icon(
                              _obscurePassword
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                              color: AppColor.grey,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Checkbox(
                            value: isChecked,
                            checkColor: AppColor.blanc,
                            fillColor:
                                MaterialStateProperty.resolveWith<Color?>(
                              (Set<MaterialState> states) {
                                if (states.contains(MaterialState.selected)) {
                                  return AppColor.bleu;
                                }
                                return AppColor.blanc;
                              },
                            ),
                            onChanged: (bool? value) {
                              setState(() {
                                isChecked = value!;
                              });
                            },
                          ),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'I’m at least 18 years old and agree to the following terms:',
                                  style: GoogleFonts.poppins(
                                    textStyle: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400,
                                      color: AppColor.grey,
                                    ),
                                  ),
                                ),
                                SizedBox(height: 10),
                                RichText(
                                  text: TextSpan(
                                    style: GoogleFonts.poppins(
                                      textStyle: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w400,
                                        color: AppColor.grey,
                                      ),
                                    ),
                                    children: [
                                      TextSpan(
                                        text:
                                            'By checking, I’ve read and agree to the',
                                      ),
                                      TextSpan(
                                        text:
                                            '                         Terms and conditions of service.',
                                        style: TextStyle(
                                          color: AppColor.bleu,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CustomElevatedButton(
                              onPressed: () {}, buttonText: "Signup"),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          )),
    );
  }
}
