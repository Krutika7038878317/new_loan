import 'dart:io';

import 'package:customerloan/constant/color_constant.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:images_picker/images_picker.dart';

class BottomSheetPicker extends StatelessWidget {
  final ImagePicker _picker = ImagePicker();
  String _paths = '';
  List image = [];

  final int place;
  bool showFile = true;

  BottomSheetPicker({required this.place, required this.showFile});

  Widget _row(String text, var _icon) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 22, 8, 8),
      child: Row(
        children: [
          Container(
              padding: const EdgeInsets.all(8),
              decoration: const BoxDecoration(
                  shape: BoxShape.circle, color: Color(0xFFEBEBEB)),
              child: Icon(
                _icon,
                color: ColorConstant.progressLine2Color,
                size: 22,
              )),
          const SizedBox(
            width: 10,
          ),
          Text(
            text,
            style: const TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w500,
                color: ColorConstant.secondaryTextColor),
          )
        ],
      ),
    );
  }


  void _cameraPicker(BuildContext context) async {
    // final XFile? photo = await _picker.pickImage(source: ImageSource.camera);
    List<Media>? res = await ImagesPicker.openCamera(
      // pickType: PickType.video,
      pickType: PickType.image,
      quality: 0.8,
      maxSize: 800,
      // cropOpt: CropOption(
      //   aspectRatio: CropAspectRatio.wh16x9,
      // ),
      maxTime: 15,
    );
    print(res);
    if (res != null) {
      print(res[0].path);

      _paths = res[0].thumbPath!;

    }
    if (res != null) {
      image = res;

      switch (place) {
        case 0:
          {
            Get.back(result: _paths);
          }
          break;
        case 1:
          {
            Get.back(result: _paths);
          }
          break;
        case 2:
          {
            Get.back(result: _paths);
          }
          break;
        default:
          break;
      }
    }
  }

  void _galleryPicker(BuildContext context) async {
    // List<XFile>? photos = await _picker.pickMultiImage();
    List<Media>? res = await ImagesPicker.pick(
      count: 1,
      pickType: PickType.all,
      language: Language.System,
      maxTime: 30,
      // maxSize: 500,
      cropOpt: CropOption(
        // aspectRatio: CropAspectRatio.wh16x9,
        cropType: CropType.circle,
      ),
    );
    print(res);
    if (res != null) {
      print(res.map((e) => e.path).toList());

      _paths = res[0].thumbPath!;
      // bool status = await ImagesPicker.saveImageToAlbum(File(res[0]?.path));
      // print(status);
    }
    if (res != null && res.isNotEmpty) {
      (res.forEach(
        (element) {
          _paths = element.path;

          switch (place) {
            case 0:
              {
                Get.back(result: _paths);
              }
              break;
            case 1:
              {
                Get.back(result: _paths);
              }
              break;
            case 2:
              {
                Get.back(result: _paths);
              }
              break;
            default:
              break;
          }
        },
      )
      );
    }
  }

  void pickFile(BuildContext context) async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      allowMultiple: false,
      type: FileType.custom,
      allowedExtensions: [
        'pdf',
      ],
    );
    _paths = result!.paths.first!;

    switch (place) {
      case 0:
        {
          Get.back(result: _paths);
        }
        break;
      case 1:
        {
          Get.back(result: _paths);
        }
        break;
      case 2:
        {
          Get.back(result: _paths);
        }
        break;
      default:
        break;
    }
  }



  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(right: 2, left: 2),
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(15), topRight: Radius.circular(15))),
      child: Container(
        height: showFile == false ? 150 : 200,
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
              "Upload a file",
              style: TextStyle(fontSize: 17, fontWeight: FontWeight.w500),
            ),
            showFile == true
                ? Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                GestureDetector(
                    onTap: () {
                     _cameraPicker(context);
                    },
                    child: _row("Camera", Icons.camera_alt)),
                const SizedBox(
                  width: 60,
                ),
                GestureDetector(
                    onTap: () => _galleryPicker(context),
                    child: _row("Gallery", Icons.photo_album)),
              ],
            ):const SizedBox(
              height: 0,
              width: 0,
            ),
            GestureDetector(
                    onTap: () => pickFile(context),
                    child: _row("File", Icons.folder))
          ],
        ),
      ),
    );
  }
}
