part of 'image_upload_bloc.dart';

abstract class ImageUploadEvent extends Equatable {
  const ImageUploadEvent();

  @override
  List<Object?> get props => [];
}

class UploadImage extends ImageUploadEvent {
  const UploadImage({
    required this.pickedFile,
    required this.oldFileUrl,
  });

  final XFile pickedFile;
  final String oldFileUrl;

  @override
  List<Object?> get props => [pickedFile, oldFileUrl];
}

class UploadMultipleImage extends ImageUploadEvent {}

class EmptyMultipleList extends ImageUploadEvent {}

class EmptyImageUrl extends ImageUploadEvent {}