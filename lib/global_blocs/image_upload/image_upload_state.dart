part of 'image_upload_bloc.dart';

class ImageUploadState extends Equatable {
  const ImageUploadState({
    this.status = FormzStatus.pure,
    this.errorText = "",
    this.imageUrl = "",
    this.uploadPathName = "",
    this.imagePaths = const []
});

  final FormzStatus status;
  final String imageUrl;
  final String uploadPathName;
  final String errorText;
  final List<String> imagePaths;

  ImageUploadState copyWith({
    FormzStatus? status,
    String? imageUrl,
    String? uploadPathName,
    String? errorText,
    List<String>? imagePaths
  }) =>
      ImageUploadState(
        imageUrl: imageUrl ?? this.imageUrl,
        uploadPathName: uploadPathName ?? this.uploadPathName,
        status: status ?? this.status,
        errorText: errorText ?? this.errorText,
        imagePaths: imagePaths ?? this.imagePaths
      );


  @override
  List<Object> get props => [imageUrl, uploadPathName, status, errorText, imagePaths];
}

