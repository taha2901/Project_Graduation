import 'package:diabetes/cubits/auth_cubit/auth_cubit.dart';
import 'package:diabetes/helper/show-snack-bar.dart';
import 'package:diabetes/page/Home.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../widgets/custom_button.dart';
import '../widgets/custom_text_field.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});
  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String? name;
  String? email;
  String? password;
  String? confirmPassword;
  bool isPassword = true;
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.white,
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0.0,
        backgroundColor: Theme.of(context).colorScheme.background,
      ),
      body: BlocConsumer<AuthCubit, AuthState>(
        listener: (context, state) {
           if (state is RegisterLoaded) {
          isLoading = true;
        } else if (state is RegisterSuccess) {
          Navigator.pushNamed(context, Home.id, arguments: email);
          isLoading = false;
        } else if (state is RegisterFailur) {
          showSnackBar(context, state.errMessage);
          isLoading = false;
        }
        },
        builder: (context, state) {
          return ModalProgressHUD(
            inAsyncCall: isLoading,
            child: SingleChildScrollView(
              child: Form(
                key: _formKey,
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
                        'انشاء حساب',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 32,
                    ),
                    // const Padding(
                    //   padding: EdgeInsets.only(right: 18),
                    //   child: Text(
                    //     'رقم التلفون /او الايميل',
                    //     style: TextStyle(
                    //       fontSize: 16,
                    //       fontWeight: FontWeight.w400,
                    //     ),
                    //   ),
                    // ),
                    const SizedBox(
                      height: 16,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 18),
                      child: CustomTextField(
                        hint: 'ادخل رقم التلفون او الايميل ',
                        prefixIcon: IconButton(
                            onPressed: () {}, icon: const Icon(Icons.mail)),
                        showBorder: false,
                        onChange: (data) {
                          email = data;
                        },
                      ),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    // const Padding(
                    //   padding: EdgeInsets.only(right: 18),
                    //   child: Text(
                    //     'كلمة السر',
                    //     style: TextStyle(
                    //       fontSize: 16,
                    //       fontWeight: FontWeight.w400,
                    //     ),
                    //   ),
                    // ),
                    const SizedBox(
                      height: 16,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 18),
                      child: CustomTextField(
                        hint: 'ادخل الرقم السري الخاص بك',
                        showBorder: false,
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
                        type: TextInputType.visiblePassword,
                        isPassword: isPassword,
                        onChange: (data) {
                          password = data;
                        },
                      ),
                    ),
                    const SizedBox(
                      height: 32,
                    ),
                    // const Padding(
                    //   padding: EdgeInsets.only(right: 18),
                    //   child: Text(
                    //     'تأكيد كلمة السر',
                    //     style: TextStyle(
                    //       fontSize: 14,
                    //       fontWeight: FontWeight.w400,
                    //     ),
                    //   ),
                    // ),
                    // const SizedBox(
                    //   height: 8,
                    // ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 18),
                      child: CustomTextField(
                        hint: 'أعد إدخال الرقم السري الخاص بك',
                        showBorder: false,
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
                        type: TextInputType.visiblePassword,
                        isPassword: isPassword,
                        onChange: (data) {
                          confirmPassword = data;
                        },
                      ),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    const Padding(
                      padding: EdgeInsets.only(left: 18),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'هل نسيت كلمة السر ؟',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 18),
                      child: CustomButton(
                        text: 'تسجيل الدخول',
                        color: Colors.black,
                        circular: 15,
                        textcolor: Colors.white,
                        onTap: () async {
                          if (_formKey.currentState!.validate()) {
                            setState(() {
                              isLoading = true;
                            });
                            try {
                              await registerUser();
                              Navigator.pop(context);
                            } on FirebaseAuthException catch (ex) {
                              if (ex.code == 'weak-password') {
                                showSnackBar(context, 'كلمة سر ضعيفة');
                              } else if (ex.code == 'email-already-in-use') {
                                showSnackBar(
                                    context, 'البريد الإلكتروني مستخدم بالفعل');
                              } else {
                                showSnackBar(context, 'حدث خطأ ما');
                              }
                            } catch (ex) {
                              showSnackBar(context, 'حدث خطأ ما');
                            } finally {
                              setState(() {
                                isLoading = false;
                              });
                            }
                          }
                        },
                      ),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    const Center(
                      child: Text('او'),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 18),
                      child: CustomButton(
                        text: 'تسجيل عن طريق',
                        circular: 15,
                        icon: FontAwesomeIcons.google,
                        textcolor: const Color(0xff4B5768),
                        color: const Color(0xffE4E7EB),
                      ),
                    ),
                    const SizedBox(
                      height: 68,
                    ),
                    Center(
                      child: GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: const Text(
                          'هل لديك حساب بالفعل؟ تسجيل دخول',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Future<void> registerUser() async {
    await FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email!, password: password!);
    // يمكنك إضافة المزيد من الإجراءات هنا في حال نجاح عملية التسجيل
  }
}
