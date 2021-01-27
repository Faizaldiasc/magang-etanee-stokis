class Stock{
  String id;
  String name;
  String description;
  String code;
  double weight;
  double lowestPrice;
  String image;
  int quantity;

  Stock({
  this.id,
  this.name,
  this.description,
  this.code,
  this.weight,
  this.lowestPrice,
  this.image,
  this.quantity,
  });

  factory Stock.fromMap(Map data){
    return Stock(
      id: data['product']['id'],
      name: data['product']['name'],
      description: data['product']['description'],
      code: data['product']['code'],
      weight: data['product']['weight'],
      lowestPrice: data['product']['lowestPrice'],
      image: data['product']['thumbnail'],
      quantity: data['quantity']
    );
  }
  
}

