import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker_bloc/image_picker/image_picker.dart';
import 'package:image_picker_bloc/image_picker/view/image_picker_page.dart';

class ImagePickerApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Image Picker',
      home: BlocProvider(
        create: (context) => ImagePickerBloc(),
        child: ImagePickerPage(),
      ),
    );
  }
}
