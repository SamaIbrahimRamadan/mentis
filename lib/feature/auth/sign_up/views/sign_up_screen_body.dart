import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mentis/feature/auth/sign_up/widget/custom_sign_up_text_field.dart';

import '../../../../core/helper/spacing.dart';
import '../../../../core/routing/routing.dart';
import '../../../../core/widget/button.dart';
import '../../../../res.dart';

class SignUpScreenBody extends StatelessWidget {
  const SignUpScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = TextEditingController();
    final controllerPass = TextEditingController();
    final key = GlobalKey<FormState>();
    return SingleChildScrollView(
        child: Form(
      key: key,
      child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(Res.sign_up),
            CustomSignUpTextField(
              controller: controller,
              controllerPass: controllerPass,
            ),
            verticalSpace(40),
            CustomButton(
              text: "Sign up",
              onPressed: () async {
                if (key.currentState!.validate()) {
                  try {
                    final credential1 = await FirebaseAuth.instance
                        .createUserWithEmailAndPassword(
                      email: controller.text,
                      password: controllerPass.text,
                    );
                    await FirebaseFirestore.instance
                        .collection('user')
                        .doc(credential1.user?.uid)
                        .set({'email': controller.text});
                    if (credential1.user!.emailVerified)
                      GoRouter.of(context).push(AppRouter.kHome);
                  } on FirebaseAuthException catch (e) {
                    SnackBar snackBar = SnackBar(
                      content: Text(e.message.toString()),
                      backgroundColor: Colors.red,
                    );
                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
                  }
                }
              },
              horizontal: 140,
              vertical: 13,
            ),
          ],
        ),
      ),
    ));
  }
}
