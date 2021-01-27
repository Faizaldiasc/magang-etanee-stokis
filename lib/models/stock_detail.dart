
class DetailStock {
  String id;
  String code;
  String name;
  String image;
  String date;
  String description;
  int quantity;
  String suplier;

  DetailStock({
    this.id,
    this.code,
    this.name,
    this.image,
    this.date,
    this.description,
    this.quantity,
    this.suplier
  });

  factory DetailStock.fromMap(Map data){
    return DetailStock(
      id: data['product']['id'],
      name: data['product']['name'],
      image: data['product']['thumbnail'],
      description: data['product']['description'],
      quantity: data['quantity']
    );
  }
}