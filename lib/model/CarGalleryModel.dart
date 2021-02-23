class CarGalleryModel {
  String _imgPath,_title,_text;
  CarGalleryModel(this._imgPath, this._title, this._text);

  get text => _text;

  get title => _title;

  String get imgPath => _imgPath;

}