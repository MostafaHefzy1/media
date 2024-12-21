import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:image_picker/image_picker.dart';
import 'package:multimedia/sharedpref_helper.dart';
import 'package:file_picker/file_picker.dart';

part 'multi_media_state.dart';

class MultiMediaCubit extends Cubit<MultiMediaState> {
  MultiMediaCubit() : super(MultiMediaInitial());

  static MultiMediaCubit get(context) => BlocProvider.of(context);
  final ImagePicker picker = ImagePicker();
  XFile? image;

  void getMedia() async {
    XFile? selectImage = await picker.pickImage(source: ImageSource.gallery);
    if (selectImage != null) {
      SharedprefHelper.saveData(key: "image", value: selectImage.path);
      image = selectImage;
      emit(GetImageSuccessState());
    }
  }

  //   void getMedia() async {
  //   List<XFile>? selectImage = await picker.pickMultipleMedia();
  //   if (selectImage.isNotEmpty) {
  //     listImage = selectImage;
  //     emit(GetImageSuccessState());
  //   }
  // }

  File? file;
  pickFile() async {
    FilePickerResult? selectedFile = await FilePicker.platform.pickFiles(
        type: FileType.custom, allowedExtensions: ['dox', 'doc', 'pdf']);
    if (selectedFile != null) {
      file = File((selectedFile.files.first.path)!);
    }
    emit(PickFileSuccessState());
  }
}
