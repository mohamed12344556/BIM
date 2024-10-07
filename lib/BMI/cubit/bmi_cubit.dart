// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sec2/BMI/cubit/bmi_state.dart';

class BmiCubit extends Cubit<BMIState> {
  BmiCubit() : super(BMIInitial());

  static BmiCubit get(context) => BlocProvider.of(context);

  double weight = 0.0;
  double sliderVal = 100;
  int age = 0;

  bool isMale = true;

  void Male() {
    if (!isMale) {
      isMale = !isMale;
      emit(BMIMale());
    }
  }

  void Female() {
    if (isMale) {
      isMale = !isMale;
      emit(BMIFemale());
    }
  }

  void IncreaseAge() {
    age++;
    emit(BMIIncreaseAge());
  }

  void DecreaseAge() {
    if (age > 0) {
      age = (age) - 1;
      emit(BMIDecrementsAge());
    } else {
      debugPrint('can not do this op');
    }
  }

  void IncreaseWight() {
    weight++;
    emit(BMIIncreaseWeight());
  }

  void DecreaseWight() {
    if (weight > 0) {
      weight--;
      emit(BMIDecrementsWeight());
    } else {
      debugPrint('can not do this op');
    }
  }

  void SliderIncreaseHeight({required double val}) {
    sliderVal = val;
    emit(BMIIncreaseHeight());
  }
}
