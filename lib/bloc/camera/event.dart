sealed class PictureEvent {}

class LoadKeys extends PictureEvent {}

class PictureEmpty extends PictureEvent {}

class PictureInit extends PictureEvent {
  final bool backCamera;

  PictureInit(this.backCamera);
}

class PictureTaken extends PictureEvent {}

class PickPictureFromGallery extends PictureEvent {}

class PictureUpload extends PictureEvent {}

class ChangeFlash extends PictureEvent {}
