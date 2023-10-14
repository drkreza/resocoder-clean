import 'package:clean_reso_coder_implementation/feature/numbertrivia/presentation/blocs/cubit/number_trivia_cubit.dart';
import 'package:clean_reso_coder_implementation/injection_container.dart';
import 'package:clean_reso_coder_implementation/test/cubit/counter_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyWidget extends StatelessWidget {
  MyWidget({super.key});

  final bloc = sl<NumberTriviaCubit>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            BlocBuilder<NumberTriviaCubit, NumberTriviaState>(
              bloc: bloc,
              builder: (context, state) {
                if (state is NumberTriviaInitial) {
                  return const Text('do something');
                } else if(state is NumberTriviaLoaded){
                  return Text(state.toString());
                }else if(state is NumberTriviaLoading){
                  return const Center(child: CircularProgressIndicator(),);
                }else{
                    return const Text('nothing to show');
                }
              },
            ),
            const SizedBox(
              height: 10,
            ),
            ElevatedButton(onPressed: () {
              bloc.getTriviaForRandomNumber();
            }, child: const Text('Click me'))
          ],
        ),
      ),
    );
  }
}
