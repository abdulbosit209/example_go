import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:gotaxi/global_blocs/image_upload/image_upload_bloc.dart';
import 'package:gotaxi/global_blocs/passenger_bloc/passenger_bloc.dart';
import 'package:gotaxi/utils/my_utils.dart';
import 'package:image_picker/image_picker.dart';

import 'select_person_image.dart';

class ImageSelect extends StatefulWidget {
  const ImageSelect({Key? key}) : super(key: key);

  @override
  State<ImageSelect> createState() => _ImageSelectState();
}

class _ImageSelectState extends State<ImageSelect> {
  final ImagePicker _picker = ImagePicker();
  late String personImageUrl;

  @override
  Widget build(BuildContext context) {
    personImageUrl = context.select(
          (PassengerBloc bloc) => bloc.state.passengerModel.passengerPhoto,
    );
    return BlocConsumer<ImageUploadBloc, ImageUploadState>(
      builder: (context, state) {
        return state.status == FormzStatus.submissionInProgress
            ? const Center(child: CircularProgressIndicator())
            : SelectImage(
          onEditTap: () {
            MyUtils.selectImageDialog(
                context: context,
                onCameraTap: () async {
                  await _getFromCamera().then(
                        (value) {
                      Navigator.of(context).pop();
                    },
                  );
                },
                onGalleryTap: () async {
                  await _getFromGallery().then((value) {
                    Navigator.of(context).pop();
                  });
                });
          },
        );
      },
      listener: (context, state) {
        var image = state.imageUrl;
        if (image.isNotEmpty) {
          context.read<PassengerBloc>().add(
            UpdatePassengerModel(
              passengerModel: context
                  .read<PassengerBloc>()
                  .state
                  .passengerModel
                  .copyWith(passengerPhoto: image),
              docID: context
                  .read<PassengerBloc>()
                  .state
                  .passengerModel
                  .passengerDocId,
            ),
          );
        }
      },
    );
  }

  Future<void> _getFromCamera() async {
    final selectedImage = await _picker.pickImage(
      maxWidth: 720,
      maxHeight: 720,
      source: ImageSource.camera,
    );
    if (!mounted) return;
    if (selectedImage != null) {
      context.read<ImageUploadBloc>().add(
        UploadImage(
          pickedFile: selectedImage,
          oldFileUrl: personImageUrl,
        ),
      );
    }
  }

  Future<void> _getFromGallery() async {
    final selectedImage = await _picker.pickImage(
      maxWidth: 720,
      maxHeight: 720,
      source: ImageSource.gallery,
    );
    if (!mounted) return;
    if (selectedImage != null) {
      context.read<ImageUploadBloc>().add(
        UploadImage(
          pickedFile: selectedImage,
          oldFileUrl: personImageUrl,
        ),
      );
    }
  }
}
