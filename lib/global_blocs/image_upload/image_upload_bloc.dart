import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:gotaxi/data/repositories/helper_repository.dart';
import 'package:image_picker/image_picker.dart';

part 'image_upload_event.dart';

part 'image_upload_state.dart';

class ImageUploadBloc extends Bloc<ImageUploadEvent, ImageUploadState> {
  ImageUploadBloc({required HelperRepository helperRepository})
      : _helperRepository = helperRepository,
        super(const ImageUploadState()) {
    on<UploadImage>(_uploadImage);
    on<UploadMultipleImage>(_uploadMultipleImage);
    on<EmptyImageUrl>(_emptyImageUrl);
    on<EmptyMultipleList>(_emptyMultipleList);
  }

  final HelperRepository _helperRepository;

  Future<void> _uploadImage(
    UploadImage event,
    Emitter<ImageUploadState> emit,
  ) async {
    emit(state.copyWith(status: FormzStatus.submissionInProgress));
    try {
      var downloadUrl = await _helperRepository.uploadImage(
        pickedFile: event.pickedFile,
        oldFileUrl: event.oldFileUrl,
      );
      emit(state.copyWith(
        imageUrl: downloadUrl,
        status: FormzStatus.submissionSuccess,
      ));
    } on FirebaseException catch (e) {
      emit(
        state.copyWith(
          errorText: e.message.toString(),
          status: FormzStatus.submissionFailure,
        ),
      );
      rethrow;
    }
  }

  Future<void> _uploadMultipleImage(
    UploadMultipleImage event,
    Emitter<ImageUploadState> emit,
  ) async {
    emit(state.copyWith(status: FormzStatus.submissionInProgress));
    try {
      List<String> images = await _helperRepository.uploadFiles();
      emit(
        state.copyWith(
          imagePaths: images,
          status: FormzStatus.submissionSuccess,
        ),
      );
    } catch (e) {
      emit(
        state.copyWith(
          errorText: e.toString(),
          status: FormzStatus.submissionFailure,
        ),
      );
    }
  }

  void _emptyImageUrl(
      EmptyImageUrl event, Emitter<ImageUploadState> emit) async {
    emit(state.copyWith(imageUrl: "", status: FormzStatus.pure));
  }

  void _emptyMultipleList(
      EmptyMultipleList event, Emitter<ImageUploadState> emit) async {
    emit(state.copyWith(imagePaths: [], status: FormzStatus.pure));
  }
}
