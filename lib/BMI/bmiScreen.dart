import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sec2/BMI/cubit/bmi_cubit.dart';
import 'package:sec2/BMI/cubit/bmi_state.dart';

class BMIScreen extends StatelessWidget {
  const BMIScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => BmiCubit(),
      child: BlocConsumer<BmiCubit, BMIState>(
        listener: (context, state) {},
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              centerTitle: true,
              backgroundColor: Colors.cyan,
              title: const Text('BMI Calculator'),
              actions: const [
                Icon(Icons.dark_mode),
                Icon(Icons.accessibility_new_sharp),
              ],
            ),
            body: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Expanded(
                    child: Row(
                      children: [
                        Expanded(
                          child: GestureDetector(
                            onTap: () {
                              debugPrint('male');
                              BmiCubit.get(context).Male();
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                color: BmiCubit.get(context).isMale
                                    ? Colors.blue
                                    : Colors.grey[300],
                              ),
                              child: const Column(
                                children: [Icon(Icons.male), Text('male')],
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 8,
                        ),
                        Expanded(
                          child: GestureDetector(
                            onTap: () {
                              BmiCubit.get(context).Female();
                              debugPrint('female');
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                color: BmiCubit.get(context).isMale
                                    ? Colors.grey[300]
                                    : Colors.blue,
                              ),
                              child: const Column(
                                children: [Icon(Icons.female), Text('Female')],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Expanded(
                    child: Container(
                      width: double.infinity,
                      decoration: BoxDecoration(color: Colors.grey[300]),
                      child: Column(
                        children: [
                          const Text(
                            'Height',
                            style: TextStyle(
                                fontSize: 40, fontWeight: FontWeight.w800),
                          ),
                          Text(
                            '${BmiCubit.get(context).sliderVal.toInt()}cm',
                            style: const TextStyle(
                                fontSize: 40, fontWeight: FontWeight.w800),
                          ),
                          Slider(
                            value: BmiCubit.get(context).sliderVal.toDouble(),
                            onChanged: (val) {
                              BmiCubit.get(context)
                                  .SliderIncreaseHeight(val: val);
                            },
                            min: 100,
                            max: 210,
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Expanded(
                    child: Row(
                      children: [
                        Expanded(
                          child: Container(
                            /// Elevated button , textButton , floating action button
                            decoration: BoxDecoration(
                              color: Colors.grey[300],
                            ),
                            child: Column(
                              children: [
                                const Text(
                                  'Age',
                                  style: TextStyle(
                                      fontSize: 40,
                                      fontWeight: FontWeight.w800),
                                ),
                                Text(
                                  '${BmiCubit.get(context).age}',
                                  style: const TextStyle(
                                      fontSize: 40,
                                      fontWeight: FontWeight.w800),
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    IconButton(
                                        onPressed: () {
                                          BmiCubit.get(context).IncreaseAge();
                                        },
                                        icon: const Icon(Icons.add)),
                                    IconButton(
                                        onPressed: () {
                                          BmiCubit.get(context).DecreaseAge();
                                        },
                                        icon: const Icon(Icons.minimize_sharp))
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 8,
                        ),
                        Expanded(
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.grey[300],
                            ),
                            child: Column(
                              children: [
                                const Text(
                                  'Weight',
                                  style: TextStyle(
                                      fontSize: 40,
                                      fontWeight: FontWeight.w800),
                                ),
                                Text(
                                  '${BmiCubit.get(context).weight}',
                                  style: const TextStyle(
                                      fontSize: 40,
                                      fontWeight: FontWeight.w800),
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    IconButton(
                                        onPressed: () {
                                          BmiCubit.get(context).IncreaseWight();
                                        },
                                        icon: const Icon(Icons.add)),
                                    IconButton(
                                        onPressed: () {
                                          BmiCubit.get(context).DecreaseWight();
                                        },
                                        icon:
                                            const Icon(Icons.minimize_rounded))
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            /// Column , Row , Container , Stack , SafeArea , Lists , SizedBox , PlaceHolder
          );
        },
      ),
    );
  }
}
