class Product{
  String _id;
  String _name;
  int _price;
  String _image;
  String _description;

  Product(this._id, this._name, this._price, this._image, this._description);

  String get description => _description;
  String get image => _image;
  int get price => _price;
  String get name => _name;
  String get id => _id;

  set description(String value) {
    _description = value;
  }
  set image(String value) {
    _image = value;
  }
  set price(int value) {
    _price = value;
  }
  set name(String value) {
    _name = value;
  }
  set id(String value) {
    _id = value;
  }



}