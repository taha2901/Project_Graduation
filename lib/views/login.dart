import 'package:diabetes/cubits/auth_cubit/auth_cubit.dart';
import 'package:diabetes/cubits/chat_cubit/chat_cubit.dart';
import 'package:diabetes/helper/show-snack-bar.dart';
import 'package:diabetes/page/Home.dart';
import 'package:diabetes/views/register.dart';
import 'package:diabetes/widgets/custom_button.dart';
import 'package:diabetes/widgets/custom_text_field.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is LoginLoaded) {
          isLoading = true;
        } else if (state is LoginSuccess) {
          Navigator.pushNamed(context, Home.id, arguments: email);
          isLoading = false;
        } else if (state is LoginFailur) {
          showSnackBar(context, state.errMessage);
          isLoading = false;
        }
      },
      builder: (context, state) {
        return ModalProgressHUD(
          inAsyncCall: isLoading,
          child: Scaffold(
            backgroundColor: Theme.of(context).colorScheme.background,
            appBar: AppBar(
              automaticallyImplyLeading: false,
              backgroundColor: Theme.of(context).colorScheme.background,
            ),
            body: SingleChildScrollView(
              child: Form(
                key: _formKey,
                child: Padding(
                  padding: const EdgeInsets.all(18),
                  child: Column(
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
                            BlocProvider.of<AuthCubit>(context)
                                .loginUser(email: email!, passWord: passWord!);
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
                          style: TextStyle(
                              fontSize: 14, fontWeight: FontWeight.w700),
                        ),
                      )),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  Future<void> loginUser() async {
    UserCredential user = await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email!, password: passWord!);
  }
}
