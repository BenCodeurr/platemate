import 'package:image_picker/image_picker.dart';

class CameraRepository {
  final ImagePicker _imagePicker;

  CameraRepository({ImagePicker? imagePicker}) 
      : _imagePicker = imagePicker ?? ImagePicker();

  Future<String?> captureImage() async {
    final XFile? image = await _imagePicker.pickImage(source: ImageSource.camera);
    return image?.path;
  }
}