import 'dart:async';
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:image_picker/image_picker.dart';
import 'package:meta/meta.dart';

part 'image_picker_event.dart';
part 'image_picker_state.dart';

class ImagePickerBloc extends Bloc<ImagePickerEvent, ImagePickerState> {
  ImagePickerBloc() : super(ImagePickerEmpty());

  @override
  Stream<ImagePickerState> mapEventToState(
    ImagePickerEvent event,
  ) async* {
    if (event is GalleryImagePicked || event is CameraImagePicked) {
      ImageSource source = (event is GalleryImagePicked)
          ? ImageSource.gallery
          : ImageSource.camera;

      PickedFile pickedFile = await ImagePicker().getImage(source: source);
      if (pickedFile != null && pickedFile.path != null) {
        yield ImagePickerSuccess(image: File(pickedFile.path));
      }
    } else if (event is ImageDeleted) {
      yield ImagePickerEmpty();
    }
  }
}
