import 'package:ecommerce/common/helper/naviagtor/app_navigator.dart';
import 'package:ecommerce/common/widgets/appbar/app_bar.dart';
import 'package:ecommerce/common/widgets/button/basic_app_button.dart';
import 'package:ecommerce/presentation/auth/pages/enterpassword.dart';
import 'package:ecommerce/presentation/auth/pages/forgot_password.dart';
import 'package:ecommerce/presentation/auth/pages/signin.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class EnterPassword extends StatelessWidget {
  const EnterPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BasicAppbar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 80),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _signinText(context),
            SizedBox(height: 20,),
            _passwordField(context),
            SizedBox(height: 20,),
            _continueButton(),
            SizedBox(height: 20,),
            forgetPassword(context),
          ],
        ),
      ),
    );
  }
  Widget _signinText(BuildContext context){
    return Text('Sign in',
      style: TextStyle(
          fontSize: 36,
          color: Colors.white,
          fontWeight: FontWeight.bold
      ),
    );
  }
  Widget _passwordField(BuildContext context){
    return TextField(
      decoration: InputDecoration(
          hintText: "enter password",
          labelText: 'Password',
          suffixIcon: Icon(Icons.visibility_off),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15)
          )
      ),
    );
  }
  Widget _continueButton(){
    return BasicAppButton(
      onPressed: () {},
      title: 'Continue',

    );
  }
  Widget forgetPassword(BuildContext context){
    return RichText(
      text: TextSpan(
          children: [
            TextSpan(
                text: "Forgot password?"
            ),
            TextSpan(
                text: "Reset",

                recognizer: TapGestureRecognizer()..onTap=(){
                  // Navigator
                  AppNavigator.push(context, ForgotPassword());
                },
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold
                )
            )
          ]
      ),
    );
  }
}
