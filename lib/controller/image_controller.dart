import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class ImagePicController extends GetxController {
  ImagePicker picker = ImagePicker();
  RxString? imagePath="".obs;
  //get image from Gellary====================================>
  Future pickImageGellary() async {
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      imagePath!.value = image.path;
    }
  }
  //get image from Camera====================================>
  Future pickImageCemara() async {
    final XFile? image = await picker.pickImage(source: ImageSource.camera);
    if (image != null) {
      imagePath!.value = image.path;
    }
  }
}
