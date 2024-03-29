import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';

class ImagePickerDialog {
  Widget _roundedButton(
      {required String label,
      required Color bgColor,
      required Color txtColor}) {
    return Container(
      margin: const EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 0.0),
      padding: const EdgeInsets.all(15.0),
      alignment: FractionalOffset.center,
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: const BorderRadius.all(Radius.circular(100.0)),
        boxShadow: const <BoxShadow>[
          BoxShadow(
            color: Color(0xFF696969),
            offset: Offset(1.0, 6.0),
            blurRadius: 0.001,
          ),
        ],
      ),
      child: Text(
        label,
        style: TextStyle(
          color: txtColor,
          fontSize: 20.0,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  openCamera(
    ValueChanged<CroppedFile?> onGet,
    BuildContext context, {
    bool back = true,
    bool allowCrop = true,
  }) async {
    var image = await ImagePicker().pickImage(source: ImageSource.camera);
    if (image != null) {
      if (!back || !allowCrop) {
        onGet(CroppedFile(image.path));

        return;
      }
      _cropImage(XFile(image.path), onGet, context);
    } else {
      // NavigationService.goBack();
    }
  }
  openGallery(
    ValueChanged<CroppedFile?> onGet,
    BuildContext context, {
    bool back = true,
    bool allowCrop = true,
  }) async {
    var image = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (image != null) {
      if (!back || !allowCrop) {
        // var completePath = image.path;
        // var fileName = (completePath.split('/').last);
        // var filePath = completePath.replaceAll('/$fileName', '');
        // var imageNew = await XFile(image.path); //.rename('$filePath/name.jpg');
        // onGet(imageNew);
        onGet(CroppedFile(image.path));
        return;
      }
      _cropImage(XFile(image.path), onGet, context);
    } else {
      // NavigationService.goBack();
    }
  }

  _cropImage(XFile image, ValueChanged<CroppedFile?> onGet, BuildContext context) async {
    CroppedFile? croppedFile = await ImageCropper().cropImage(
      sourcePath: image.path,
      maxWidth: 512,
      maxHeight: 512,
      aspectRatioPresets: [
        CropAspectRatioPreset.square,
        CropAspectRatioPreset.ratio3x2,
        CropAspectRatioPreset.original,
        CropAspectRatioPreset.ratio4x3,
        CropAspectRatioPreset.ratio16x9
      ],
      uiSettings: [
        AndroidUiSettings(
            toolbarTitle: 'Cropper',
            activeControlsWidgetColor: Theme.of(context).primaryColor,
            // toolbarColor: Colors.deepOrange,
            backgroundColor: Theme.of(context).primaryColor,
            toolbarWidgetColor: Theme.of(context).primaryColor,
            initAspectRatio: CropAspectRatioPreset.square,
            lockAspectRatio: false),
        IOSUiSettings(
          title: 'Cropper',
        ),
        WebUiSettings(
          context: context,
        ),
      ],
    );
    // as File
    onGet(croppedFile);
    Navigator.pop(context);
  }

  show({
    required ValueChanged<CroppedFile?> onGet,
    required BuildContext context,
    bool allowCrop = true,
  }) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (_) {
        return Material(
          type: MaterialType.transparency,
          child: Opacity(
            opacity: 1.0,
            child: Container(
              padding: const EdgeInsets.fromLTRB(30.0, 0.0, 30.0, 20.0),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  GestureDetector(
                    onTap: () async => await openCamera(
                      onGet,
                      context,
                      allowCrop: allowCrop,
                    ),
                    child: _roundedButton(
                      label: 'camera', //"${localization.text('camera')}",
                      bgColor: Theme.of(context).primaryColor,
                      txtColor: Colors.white,
                    ),
                  ),
                  GestureDetector(
                    onTap: () async => await openGallery(
                      onGet,
                      context,
                      allowCrop: allowCrop,
                    ),
                    child: _roundedButton(
                      label: 'gallery', // "${localization.text('gallery')}",
                      bgColor: Theme.of(context).primaryColor,
                      txtColor: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 15.0),
                  GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(30.0, 0.0, 30.0, 0.0),
                      child: _roundedButton(
                        label: 'cancel', //"${localization.text('cancel')}",
                        bgColor: Colors.black,
                        txtColor: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
