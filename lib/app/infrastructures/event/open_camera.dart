class OpenCameraEvent {
  String type;
  bool reactivate;

  OpenCameraEvent(this.type, {this.reactivate = false});
}