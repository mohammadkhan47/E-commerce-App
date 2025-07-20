import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce/presentation/auth/bloc/age_selection_cubit.dart';
import 'package:ecommerce/presentation/auth/bloc/ages_display_cubit.dart';
import 'package:ecommerce/presentation/auth/bloc/ages_display_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Ages extends StatelessWidget {
  const Ages({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => AgesDisplayCubit()..displayAges(),
      child: SizedBox(
        height: MediaQuery.of(context).size.height / 2.7,
        child: BlocBuilder<AgesDisplayCubit, AgesDisplayState>(
          builder: (context, state) {
            if (state is AgesLoading) {
              return const Center(child: CircularProgressIndicator());
            }

            if (state is AgesLoaded) {
              return _agesList(context, state.ages);
            }

            if (state is AgesLoadFailure) {
              return Center(
                child: Text(
                  state.message,
                  style: const TextStyle(color: Colors.red),
                ),
              );
            }

            return const SizedBox();
          },
        ),
      ),
    );
  }

  Widget _agesList(BuildContext context, List<QueryDocumentSnapshot<Map<String, dynamic>>> ages) {
    return ListView.separated(
      padding: const EdgeInsets.all(16),
      itemCount: ages.length,
      separatorBuilder: (_, __) => const SizedBox(height: 20),
      itemBuilder: (context, index) {
        final ageValue = ages[index].data()['value'];

        return GestureDetector(
          onTap: () {
            Navigator.pop(context);
            context.read<AgeSelectionCubit>().selectAge(ageValue);
          },
          child: Text(
            ageValue,
            style: const TextStyle(fontSize: 18),
          ),
        );
      },
    );
  }
}
