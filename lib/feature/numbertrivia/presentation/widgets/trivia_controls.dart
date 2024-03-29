import 'package:clean_reso_coder_implementation/feature/numbertrivia/presentation/blocs/cubit/number_trivia_bloc.dart';
import 'package:clean_reso_coder_implementation/feature/numbertrivia/presentation/blocs/cubit/number_trivia_cubit.dart';
import 'package:clean_reso_coder_implementation/feature/numbertrivia/presentation/blocs/cubit/number_trivia_event.dart';
import 'package:clean_reso_coder_implementation/feature/numbertrivia/presentation/pages/third_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:get_it/get_it.dart';

import '../../../../injection_container.dart';

class TriviaControls extends StatefulWidget {
  TriviaControls({super.key});

  @override
  State<TriviaControls> createState() => _TriviaControlsState();
}

class _TriviaControlsState extends State<TriviaControls> {
  final controller = TextEditingController();

  final bloc = sl<NumberTriviaCubit>();

  late String inputStr;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        TextField(
          controller: controller,
          keyboardType: TextInputType.number,
          decoration: const InputDecoration(
            border: OutlineInputBorder(),
            hintText: 'Input a number',
          ),
          onChanged: (value) {
            inputStr = value;
          },
          onSubmitted: (_) {
            dispatchConcrete();
          },
        ),
        const SizedBox(height: 10),
        Row(
          children: <Widget>[
            Expanded(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blueAccent),
                onPressed: (){
                  Get.to(ThirdScreen());
                },
                child: const Text('Search'),
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: ElevatedButton(
                onPressed: () {
                  dispatchRandom();
                  // bloc.getTriviaForRandomNumber();
                  // changeLocale();
                },
                child: Text('hi'.tr),
              ),
            ),
          ],
        )
      ],
    );
  }

  void dispatchConcrete() {
    controller.clear();
    // BlocProvider.of<NumberTriviaBloc>(context).add(GetTriviaForConcreteNumber(inputStr));
    bloc.getTriviaForConcreteNumber(inputStr);
  }

  void dispatchRandom() {
    controller.clear();
    // BlocProvider.of<NumberTriviaBloc>(context).add(GetTriviaForRandomNumber());
    bloc.getTriviaForRandomNumber();
  }

  void changeLocale() {
    Get.updateLocale(const Locale('en'));
  }
}
