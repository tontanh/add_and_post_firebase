class Publicmodels {
  String placename, detail, time, pathimage, timenow;
  Publicmodels(
      this.placename, this.detail, this.time, this.pathimage, this.timenow);
  Publicmodels.fromMap(Map<String, dynamic> map) {
    placename = map['placename'];
    detail = map['detail'];
    time = map['time'];
    pathimage = map['pathimage'];
    timenow = map['timenow'];
    // id = map['id'];
  }
}
