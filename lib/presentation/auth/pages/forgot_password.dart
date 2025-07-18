import 'package:ecommerce/common/helper/naviagtor/app_navigator.dart';
import 'package:ecommerce/common/widgets/appbar/app_bar.dart';
import 'package:ecommerce/common/widgets/button/basic_app_button.dart';
import 'package:ecommerce/presentation/auth/pages/enterpassword.dart';
import 'package:flutter/material.dart';

class ForgotPassword extends StatelessWidget {
  const ForgotPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BasicAppbar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 60),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _signinText(context),
            SizedBox(height: 20,),
            _emaiField(context),
            SizedBox(height: 20,),
            _continueButton(context),
          ],
        ),
      ),
    );
  }
  Widget _signinText(BuildContext context){
    return Text('Forgot Password',
      style: TextStyle(
          fontSize: 36,
          color: Colors.white,
          fontWeight: FontWeight.bold
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
  Widget _continueButton(BuildContext context){
    return BasicAppButton(
      onPressed: () {
        // AppNavigator.push(context, EnterPassword());
      },
      title: 'Continue',

    );
  }
}
