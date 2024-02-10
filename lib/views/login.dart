import 'package:diabetes/helper/show-snack-bar.dart';
import 'package:diabetes/page/Home.dart';
import 'package:diabetes/views/register.dart';
import 'package:diabetes/widgets/custom_button.dart';
import 'package:diabetes/widgets/custom_text_field.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});
  static String id = 'LoginPage';
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String? email;
  String? passWord;
  bool isPassword = true;
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: isLoading,
      child: Scaffold(
        backgroundColor: Theme.of(context).colorScheme.background,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          // elevation: 0.0,
          backgroundColor: Theme.of(context).colorScheme.background,
        ),
        body: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Padding(
              padding: const EdgeInsets.all(18),
              child: Column(
                // crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.message,
                    size: 60,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  const Center(
                      child: Text(
                    'تسـجـيل الدخــول',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  )),
                  const SizedBox(
                    height: 32,
                  ),
                  CustomTextField(
                    hint: 'ادخل رقم التلفون او الايميل ',
                    prefixIcon: IconButton(
                        onPressed: () {}, icon: const Icon(Icons.person)),
                    onChange: (data) {
                      email = data;
                    },
                    showBorder: false,
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  CustomTextField(
                    hint: 'ادخل الرقم السري الخاص بيك',
                    prefixIcon: isPassword
                        ? IconButton(
                            onPressed: () {},
                            icon: const Icon(Icons.visibility))
                        : IconButton(
                            onPressed: () {},
                            icon: const Icon(Icons.visibility_off)),
                    suffixPressed: () {
                      setState(() {
                        isPassword = !isPassword;
                      });
                    },
                    showBorder: false,
                    obscure: true,
                    type: TextInputType.visiblePassword,
                    isPassword: isPassword,
                    onChange: (data) {
                      passWord = data;
                    },
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  const Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'هل نسيت كلمه السر ؟',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  CustomButton(
                    text: 'تسجيل الدخول',
                    color: Colors.black,
                    textcolor: Colors.white,
                    circular: 15,
                    onTap: () async {
                      if (_formKey.currentState!.validate()) {
                        setState(() {
                          isLoading = true;
                        });

                        try {
                          await loginUser();
                          // ignore: use_build_context_synchronously
                          Navigator.pushNamed(context, Home.id,
                              arguments: email);
                        } on FirebaseAuthException catch (ex) {
                          if (ex.code == 'user-not-found') {
                            // ignore: use_build_context_synchronously
                            showSnackBar(context, 'user not found');
                          } else if (ex.code == 'wrong-password') {
                            // ignore: use_build_context_synchronously
                            showSnackBar(context, 'wrong password');
                          } else {
                            // ignore: use_build_context_synchronously
                            showSnackBar(context, 'there was an error');
                          }
                        } catch (ex) {
                          print(ex);
                          // ignore: use_build_context_synchronously
                          showSnackBar(context, 'there was an error');
                        } finally {
                          setState(() {
                            isLoading = false;
                          });
                        }
                      }
                    },
                  ),
                  const SizedBox(
                    height: 13,
                  ),
                  const Center(
                    child: Text(
                      'او',
                    ),
                  ),
                  CustomButton(
                    text: 'تسجيل عن طريق',
                    icon: FontAwesomeIcons.google,
                    circular: 15,
                    textcolor: const Color(0xff4B5768),
                    color: const Color(0xffE4E7EB),
                  ),
                  const SizedBox(
                    height: 127,
                  ),
                  Center(
                      child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const RegisterPage()),
                      );
                    },
                    child: const Text(
                      'انشاء حساب جديد',
                      style:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.w700),
                    ),
                  )),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<void> loginUser() async {
    UserCredential user = await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email!, password: passWord!);
  }
}
