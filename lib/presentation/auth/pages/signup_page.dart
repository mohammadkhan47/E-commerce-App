import 'package:ecommerce/common/helper/naviagtor/app_navigator.dart';
import 'package:ecommerce/common/widgets/appbar/app_bar.dart';
import 'package:ecommerce/common/widgets/button/basic_app_button.dart';
import 'package:ecommerce/presentation/auth/pages/enterpassword.dart';
import 'package:ecommerce/presentation/auth/pages/signin.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class SignUp extends StatelessWidget {
  const SignUp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BasicAppbar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 60),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _signupText(context),
            SizedBox(height: 20,),
            _firstname(context),
            SizedBox(height: 20,),
            _lastname(context),
            SizedBox(height: 20,),
            _emaiField(context),
            SizedBox(height: 20,),
            _passwordfield(context),
            SizedBox(height: 20,),
            _continueButton(context),
            SizedBox(height: 20,),
            _createAccount(context),
          ],
        ),
      ),
    );
  }
  Widget _signupText(BuildContext context){
    return Text('Create Account',
      style: TextStyle(
          fontSize: 36,
          color: Colors.white,
          fontWeight: FontWeight.bold
      ),
    );
  }
  Widget _firstname(BuildContext context){
    return TextField(
      decoration: InputDecoration(
          hintText: "enter first name",
          labelText: 'First Name',
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15)
          )
      ),
    );
  }
  Widget _lastname(BuildContext context){
    return TextField(
      decoration: InputDecoration(
          hintText: "enter last name",
          labelText: 'Last name',
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15)
          )
      ),
    );
  }
  Widget _emaiField(BuildContext context){
    return TextField(
      decoration: InputDecoration(
          hintText: "enter email",
          labelText: 'Email',
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15)
          )
      ),
    );
  }
  Widget _passwordfield(BuildContext context){
    return TextField(
      decoration: InputDecoration(
          hintText: "enter password",
          labelText: 'password',
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15)
          )
      ),
    );
  }
  Widget _continueButton(BuildContext context){
    return BasicAppButton(
      onPressed: () {
        AppNavigator.push(context, EnterPassword());
      },
      title: 'Continue',

    );
  }
  Widget _createAccount(BuildContext context){
    return RichText(
      text: TextSpan(
          children: [
            TextSpan(
                text: "already have an account?"
            ),
            TextSpan(
                text: "login",
                recognizer: TapGestureRecognizer()..onTap=(){
                  AppNavigator.push(context, SigninPage());
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
