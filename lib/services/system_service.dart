import 'package:image_picker/image_picker.dart';

class SystemService {
  final picker = ImagePicker();

  Future<XFile> imageFromCamera() async {
    return await picker.pickImage(source: ImageSource.camera);
  }

  Future<XFile> imageFromGallery() async {
    return await picker.pickImage(source: ImageSource.gallery);
  }
}
