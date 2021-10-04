import 'dart:io';

import 'package:image_picker/image_picker.dart';
import 'package:injectable/injectable.dart';

@injectable
class MediaService {
  ImagePicker get picker {
    return ImagePicker();
  }

  /// One off call to get image from camera or gallery
  Future<File?> getImage({ImageSource source = ImageSource.gallery}) async {
    File? _image;
    final pickedFile = await picker.getImage(source: source,);

    if (pickedFile != null) {
      _image = File(pickedFile.path);
    } else {
      print('No image selected.');
    }

    return _image;
  }

  /// One off call to get video from gallery or camera
  Future<File?> getVideo({ImageSource source = ImageSource.gallery}) async {
    File? _image;
    final pickedFile = await picker.getVideo(source: source,);

    if (pickedFile != null) {
      _image = File(pickedFile.path);
    } else {
      print('No video selected.');
    }

    return _image;
  }



}
