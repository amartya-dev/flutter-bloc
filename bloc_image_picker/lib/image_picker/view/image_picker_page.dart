import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker_bloc/image_picker/image_picker.dart';

class ImagePickerPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Image Picker'),
      ),
      body: Center(
        child: BlocBuilder<ImagePickerBloc, ImagePickerState>(
          builder: (context, state) {
            if (state is ImagePickerEmpty) {
              return Text('Pick an image');
            } else if (state is ImagePickerSuccess) {
              return Image.file(state.image);
            }
            return Container();
          },
        ),
      ),
      floatingActionButton: BlocBuilder<ImagePickerBloc, ImagePickerState>(
        builder: (context, state) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              if (state is ImagePickerSuccess)
                FloatingActionButton(
                  onPressed: () =>
                      context.bloc<ImagePickerBloc>().add(ImageDeleted()),
                  child: Icon(Icons.delete),
                  backgroundColor: Colors.red,
                ),
              SizedBox(height: 8.0),
              FloatingActionButton(
                onPressed: () =>
                    context.bloc<ImagePickerBloc>().add(CameraImagePicked()),
                child: Icon(Icons.camera_alt),
                backgroundColor: Colors.purple,
              ),
              SizedBox(height: 8.0),
              FloatingActionButton(
                onPressed: () =>
                    context.bloc<ImagePickerBloc>().add(GalleryImagePicked()),
                child: Icon(Icons.image),
                backgroundColor: Colors.blue,
              ),
            ],
          );
        },
      ),
    );
  }
}
