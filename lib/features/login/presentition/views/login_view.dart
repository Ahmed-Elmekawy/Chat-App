import 'package:chat_app/core/functions/custom_snack_bar.dart';
import 'package:chat_app/core/utils/app_colors.dart';
import 'package:chat_app/core/utils/assets.dart';
import 'package:chat_app/core/widgets/custom_background.dart';
import 'package:chat_app/core/widgets/custom_button.dart';
import 'package:chat_app/core/widgets/custom_text_form_field.dart';
import 'package:chat_app/core/widgets/custom_textbutton.dart';
import 'package:chat_app/features/chat/presentition/views/chat_view.dart';
import 'package:chat_app/features/register/presentition/views/register_view.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController controllerEmail = TextEditingController();
  TextEditingController controllerPass = TextEditingController();
  bool hiddenPass = true;
  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          customBackground(AssetConstants.backGround),
          SingleChildScrollView(
            child: Form(
              key: formKey,
              child: buildColumLogin(context),
            ),
          ),
        ],
      ),
    );
  }

  Column buildColumLogin(BuildContext context) {
    return Column(
      children: [
        const Image(image: AssetImage(AssetConstants.logo),height: 80,),
        const SizedBox(height: 10,),
        const Text("Let,s Chat",style: TextStyle(fontSize: 18,color: Colors.black,fontWeight: FontWeight.bold),),
        Padding(
          padding: const EdgeInsets.only(
              left: 16, right: 16, top: 16, bottom: 10),
          child: customField(
              text: "Email",
              prefixIcon: Icons.email_outlined,
              controller: controllerEmail,
              validator: (value) {
                if (value!.isEmpty) {
                  return "Enter your email";
                } else {
                  return null;
                }
              }),
        ),
        Padding(
          padding: const EdgeInsets.only(right: 16, left: 16, bottom: 16),
          child: customField(
            text: "Password",
            prefixIcon: Icons.lock_outline,
            onPressed: () {
              setState(() {
                hiddenPass = !hiddenPass;
              });
            },
            sufIcon: hiddenPass
                ? Icons.visibility_off_outlined
                : Icons.visibility_outlined,
            controller: controllerPass,
            validator: (value) {
              if (value!.isEmpty) {
                return "Enter your password";
              } else {
                return null;
              }
            },
            obscureText: hiddenPass,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(right: 16, left: 16, bottom: 20),
          child: customButton(
            onPressed: () async{
              if (formKey.currentState!.validate()) {
                try {
                  await FirebaseAuth.instance.signInWithEmailAndPassword(
                      email: controllerEmail.text,
                      password: controllerPass.text
                  );
                  Navigator.pushNamed(context, ChatView.id ,arguments: controllerEmail.text);
                } on FirebaseAuthException catch (e) {
                  if (e.code == 'user-not-found') {
                    customSnackBar(context, "No user found for that email.");
                  } else if (e.code == 'wrong-password') {
                    customSnackBar(context, "Wrong password provided for that user.");
                  }
                  else{
                    customSnackBar(context, "No user found for that email.");
                  }
                }
                catch (e) {
                  customSnackBar(context, e.toString());
                }
              }
            },
            colorText: Colors.white,
            text: "Login",
            buttonColor: AppColors.primaryColor,
          ),
        ),
        Center(
            child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Don't have any account ?",
            ),
            const SizedBox(width: 10),
            customTextButton(context,text: "Register now",widget: const Register())
          ],
        )),
      ],
    );
  }


}
