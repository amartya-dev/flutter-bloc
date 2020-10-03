import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:image_picker_bloc/image_picker/image_picker.dart';
import 'package:image_picker_bloc/utils/simple_bloc_observer.dart';

void main() {
  Bloc.observer = SimpleBlocObserver();
  runApp(ImagePickerApp());
}
