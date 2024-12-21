import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:multimedia/cubit/multi_media_cubit.dart';
import 'package:multimedia/sharedpref_helper.dart';

class MediaScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MultiMediaCubit(),
      child: BlocBuilder<MultiMediaCubit, MultiMediaState>(
        builder: (context, state) {
          var cubit = MultiMediaCubit.get(context);
          return Scaffold(
            appBar: AppBar(),
            body: Column(
              children: [
                Center(
                  child: InkWell(
                    onTap: () {
                      cubit.getMedia();
                    },
                    child: CircleAvatar(
                        radius: 60,
                        backgroundImage: cubit.image != null
                            ? Image.file(File(cubit.image!.path)).image
                            : SharedprefHelper.getData(key: "image") != null
                                ? Image.file(File(
                                        SharedprefHelper.getData(key: "image")))
                                    .image
                                : null),
                  ),
                ),
                SizedBox(height: 20,) , 
                Center(
                  child: InkWell(
                    onTap: () {
                      cubit.pickFile();
                    },
                        ),
                  ),
              ],
            ),
          );
        },
      ),
    );
  }
}
