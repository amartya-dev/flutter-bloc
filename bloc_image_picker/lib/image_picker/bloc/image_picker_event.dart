part of 'image_picker_bloc.dart';

@immutable
abstract class ImagePickerEvent extends Equatable {
  const ImagePickerEvent();

  @override
  List<Object> get props => [];
}

class GalleryImagePicked extends ImagePickerEvent {}

class CameraImagePicked extends ImagePickerEvent {}

class ImageDeleted extends ImagePickerEvent {}
