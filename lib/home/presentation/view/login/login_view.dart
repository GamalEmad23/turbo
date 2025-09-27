// ignore_for_file: unused_local_variable, body_might_complete_normally_nullable

import 'package:flutter/material.dart';
import 'package:turbo/home/presentation/widgets/custome_footer.dart';
import 'package:turbo/home/presentation/widgets/custome_material_button.dart';
import 'package:turbo/home/presentation/widgets/custome_text_form_field.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  GlobalKey<FormState> global = GlobalKey();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  bool secure = false;
  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.sizeOf(context).height;
    double w = MediaQuery.sizeOf(context).width;
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Form(
            key: global,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  SizedBox(height: h * .1),
                  Text(
                    "Hello , Welcome Back 🙌",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: h * .01),

                  Text(
                    "Happy to see you again ,please login here.",
                    style: TextStyle(color: Colors.grey.shade500, fontSize: 15),
                  ),
                  SizedBox(height: h * .12),

                  //Email Adress
                  Text(
                    "Email Address",
                    style: TextStyle(
                      color: Colors.black87,
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: h * .012),
                  CustomeTextFormField(
                    hint: 'Enter your Email address',
                    controller: email,
                    validate: (value) {
                      if (value!.isEmpty) {
                        return "You should enter email address";
                      }
                      if (!value.contains("@gmail.com")) {
                        return "Email must be like this example@gmail.com";
                      }
                    },
                  ),
                  SizedBox(height: h * .035),

                  //Password
                  Text(
                    "Password",
                    style: TextStyle(
                      color: Colors.black87,
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  CustomeTextFormField(
                    hint: 'Enter Password',
                    controller: password,
                    validate: (value) {
                      if (value!.isEmpty) {
                        return "You should enter password";
                      }
                      if (value.length < 8) {
                        return "Password musn't be less than 8 character";
                      }
                    },
                    secur: secure,
                    buttonAction: () {
                      setState(() {
                        secure = !secure;
                      });
                    },
                    icon: secure == false
                        ? Icons.remove_red_eye_outlined
                        : Icons.remove_red_eye_rounded,
                  ),
                  SizedBox(height: h * .012),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      GestureDetector(
                        onTap: () {},
                        child: Text(
                          "Forget Password",
                          style: TextStyle(
                            color: Colors.red,
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: h * .03),

                  Center(
                    child: CustomeMaterialButton(
                      buttonActio: () {
                        if (global.currentState!.validate()) {}
                      },
                      text: "Login",
                      color: Colors.blue,
                      textColor: Colors.white,
                      hight: h * .07,
                      width: w * .7,
                    ),
                  ),
                  SizedBox(height: h * .03),

                  CustomeFooter(
                    fText: "Dont't have an account?",
                    sText: 'Register',
                    buttonAction: () {},
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
