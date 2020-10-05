# image_picker_bloc

Image upload feature using [bloc library](https://bloclibrary.dev/#/).

This project demonstrate how to use bloc to implement image uploading features. It has 3 Event which is `GalleryImagePicked` , `CameraImagePicked`, and `ImageDeleted` which occurs when you pressed each one of it corresponding button (add image from gallery, add image from camera, and delete image).  

The `ImagePickerBloc` then will handle the event and doing the image uploading process, yield `ImagePickerSuccess` state or deleting it and yield `ImagePickerEmpty` state.

The UI will show the uploaded image and delete button when the state is `ImagePickerSuccess` and showing no picture when the state is `ImagePickerEmpty`.



## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://flutter.dev/docs/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://flutter.dev/docs/cookbook)

For help getting started with Flutter, view flutter
[online documentation](https://flutter.dev/docs), which offers tutorials,
samples, guidance on mobile development, and a full API reference.
