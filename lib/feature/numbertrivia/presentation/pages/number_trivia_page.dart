import 'package:clean_reso_coder_implementation/feature/numbertrivia/presentation/blocs/cubit/number_trivia_bloc.dart';
import 'package:clean_reso_coder_implementation/test/cubit/counter_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../injection_container.dart';
import '../blocs/cubit/number_trivia_cubit.dart';
import '../widgets/loading_widget.dart';
import '../widgets/message_display.dart';
import '../widgets/trivia_controls.dart';
import '../widgets/trivia_display.dart';

class NumberTriviaPage extends StatelessWidget {
  NumberTriviaPage({super.key});

  final bloc = sl<CounterCubit>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Number Trivia'),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              children: [
                const SizedBox(height: 10),
                // Top half
                BlocBuilder<CounterCubit, CounterState>(
                  bloc: bloc,
                  builder: (context, state) {
                    if (state is CounterInitial) {
                      return const MessageDisplay(
                        message: 'Start searching!',
                      );
                    } else if (state is CounterLoading) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    } else if (state is CounterLoaded) {
                      return Text(state.counter.toString());
                    } else {
                      return const MessageDisplay(
                        message: 'Start searching!.......',
                      );
                    }
                  },
                ),
                const SizedBox(height: 20),
                // Bottom half
                TriviaControls()
              ],
            ),
          ),
        ),
      ),
    );
  }

  /* Widget buildBody(BuildContext context) {
    print("00000");
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            const SizedBox(height: 10),
            // Top half
            BlocBuilder<NumberTriviaCubit, NumberTriviaState>(
              bloc: bloc,
              builder: (context, state) {
                print("state : " + state.toString());
                if (state is NumberTriviaInitial) {
                  print("a");
                  return const MessageDisplay(
                    message: 'Start searching now!',
                  );
                } else if (state is NumberTriviaLoading) {
                  print("b");
                  return const LoadingWidget();
                } else if (state is NumberTriviaLoaded) {
                  print("c");
                  return TriviaDisplay(
                    numberTriviaEntity: state.trivia,
                  );
                } else if (state is NumberTriviaError) {
                  print("d");
                  return MessageDisplay(
                    message: state.message,
                  );
                } else if (state is Empty) {
                  print("d");
                  return MessageDisplay(
                    message: 'emptyyyyy',
                  );
                } else {
                  print("d");
                  return const MessageDisplay(
                    message: 'else',
                  );
                }
              },
            ),
            const SizedBox(height: 20),
            // Bottom half
            TriviaControls()
          ],
        ),
      ),
    );
  } */
}
