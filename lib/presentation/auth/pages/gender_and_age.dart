import 'package:ecommerce/common/helper/bottomsheet/app_bottomsheet.dart';
import 'package:ecommerce/common/widgets/button/basic_app_button.dart';
import 'package:ecommerce/core/configs/theme/app_colors.dart';
import 'package:ecommerce/data/auth/models/user_creation_req.dart';
import 'package:ecommerce/domain/auth/usecases/signup.dart';
import 'package:ecommerce/presentation/auth/bloc/age_selection_cubit.dart';
import 'package:ecommerce/presentation/auth/bloc/ages_display_cubit.dart';
import 'package:ecommerce/presentation/auth/bloc/gender_selection_cubit.dart';
import 'package:ecommerce/presentation/auth/widgets/ages.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GenderAndAge extends StatelessWidget {
  const GenderAndAge({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MultiBlocProvider(
         providers: [
           BlocProvider(create: (context)=>GenderSelectionCubit()),
           BlocProvider(create: (context)=>AgesDisplayCubit()..displayAges()),

        ],
        child: Column(
          children: [
          Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 50
        ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _tellUs(),
              const SizedBox(height: 30,),
              _genders(context),
              const SizedBox(height: 30,),
              howOld(),
              const SizedBox(height: 30,),
              _age(),
            ],
          ),
        ),
      Spacer(),
      _finishButton(context)
        ]
       )
      )
    );
  }
  Widget _tellUs(){
    return Text('Tell us about Yourself',
      style: TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.bold
      ),
    );
  }
  Widget _genders(BuildContext context) {
    return BlocBuilder<GenderSelectionCubit, int>(
        builder: (context, state) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              genderTile(context, 1, 'Men'),
              const SizedBox(width: 20,),
              genderTile(context, 2, 'Women'),
            ],
          );
        }

    );
  }
  Expanded genderTile(BuildContext context,int genderIndex,String gender) {
    return Expanded(
      flex: 1,
      child: GestureDetector(
        onTap: (){
          context.read<GenderSelectionCubit>().selectGender(genderIndex);
        },
        child: Container(
          height: 60,
          decoration: BoxDecoration(
              color: context.read<GenderSelectionCubit>().selectedIndex == genderIndex ?
              AppColors.primary : AppColors.secondBackground,
              borderRadius: BorderRadius.circular(30)
          ),
          child: Center(
            child: Text(
              gender,
              style: const TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 16
              ),
            ),
          ),
        ),
      ),
    );
  }
  Widget howOld() {
    return const Text(
      'How old are you?',
      style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w500
      ),
    );
  }
  Widget _age() {
    return BlocBuilder<AgeSelectionCubit,String>(
        builder: (context,state) {
          return GestureDetector(
            onTap: (){
              AppBottomsheet.display(
                  context,
                  MultiBlocProvider(
                      providers: [
                        BlocProvider.value(value: context.read<AgeSelectionCubit>(),),
                        BlocProvider.value(value: context.read<AgesDisplayCubit>()..displayAges())
                      ],
                      child: const Ages()
                  )
              );
            },
            child: Container(
              height: 60,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30)
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                      state
                  ),
                  const Icon(
                      Icons.keyboard_arrow_down
                  )
                ],
              ),
            ),
          );
        }
    );
  }
  Widget _finishButton(BuildContext context) {
    return Container(
      height: 100,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Center(
          child: BasicAppButton(
              onPressed: (){},
              title: 'Finish',
          ),
      ),
    );
  }
}

