class ProductInfo {
  String? id;
  String? name;
  String? moq;
  String? price;
  String? discountedPrice;

  ProductInfo({this.id, this.name, this.moq, this.price, this.discountedPrice});

  ProductInfo.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    moq = json['moq'];
    price = json['price'];
    discountedPrice = json['discounted_price'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['moq'] = this.moq;
    data['price'] = this.price;
    data['discounted_price'] = this.discountedPrice;
    return data;
  }
}
