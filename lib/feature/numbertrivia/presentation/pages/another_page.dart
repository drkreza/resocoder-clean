import 'package:clean_reso_coder_implementation/feature/numbertrivia/presentation/blocs/cubit/number_trivia_cubit.dart';
import 'package:clean_reso_coder_implementation/feature/numbertrivia/presentation/widgets/trivia_controls.dart';
import 'package:clean_reso_coder_implementation/injection_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

class AnotherPage extends StatelessWidget {
  AnotherPage({super.key});

  final bloccc = sl<NumberTriviaCubit>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('title'.tr),
        leading: const BackButton(color: Colors.white),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(
              height: 30,
            ),
            BlocBuilder<NumberTriviaCubit, NumberTriviaState>(
              bloc: bloccc,
              builder: (context, state) {
                if (state is NumberTriviaInitial) {
                  return const Text('Type something');
                } else if (state is NumberTriviaLoading) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (state is NumberTriviaLoaded) {
                  return Text("${state.trivia.text}  ${state.trivia.number}");
                } else if (state is NumberTriviaError) {
                  return const Text(' error');
                } else {
                  return const Text(' none of above');
                }
              },
            ),
            const SizedBox(
              height: 20,
            ),
            TriviaControls(),
          ],
        ),
      ),
    );
  }
}
