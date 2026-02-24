import 'package:camera/camera.dart';
import 'package:equatable/equatable.dart';

class PictureDatasource extends Equatable {
  final CameraController? controller;
  final XFile? image;
  final bool? cameraLensDirection;
  final String? errorMessage;

  const PictureDatasource({
    this.controller,
    this.image,
    this.errorMessage,
    this.cameraLensDirection,
  });

  PictureDatasource copyWith({
    CameraController? controller,
    XFile? image,
    String? errorMessage,
    bool? cameraLensDirection,
  }) {
    return PictureDatasource(
      controller: controller ?? this.controller,
      image: image ?? this.image,
      errorMessage: errorMessage ?? this.errorMessage,
      cameraLensDirection: cameraLensDirection ?? this.cameraLensDirection,
    );
  }

  @override
  List<Object?> get props => [
    errorMessage,
    image,
    controller,
    cameraLensDirection,
  ];
}
