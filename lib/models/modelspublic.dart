class Publicmodels {
  String placename, detail, time, pathimage;
  Publicmodels(this.placename, this.detail, this.time, this.pathimage);
  Publicmodels.fromMap(Map<String, dynamic> map) {
    placename = map['placename'];
    detail = map['detail'];
    time = map['time'];
    pathimage = map['pathimage'];
    // id = map['id'];
  }
}
