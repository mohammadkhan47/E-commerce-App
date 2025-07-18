import 'package:ecommerce/core/configs/assets/app_vector.dart';
import 'package:ecommerce/presentation/auth/pages/signin.dart';
import 'package:ecommerce/presentation/splash/bloc/splash_cubit.dart';
import 'package:ecommerce/presentation/splash/bloc/splash_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<SplashCubit, SplashState>(
      listener: (context, state) {
        if(state is UnAuthenticated){
          Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context)=>SigninPage()));
        }
      },
      child: Scaffold(
        backgroundColor: Colors.deepPurple,
        body: Center(
          child: SvgPicture.asset(
              AppVectors.appLogo
          ),
        ),
      ),
    );
  }
}
