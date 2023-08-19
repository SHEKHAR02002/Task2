class Cart {
  List<CartData>? data;

  Cart({this.data});

  Cart.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <CartData>[];
      json['data'].forEach((v) {
        data!.add( CartData.fromJson(v));
      });
    }
  }


}

class CartData {
  int? id;
  int? menuId;
  String? customerId;
  int? partnerId;
  int? quantity;
  String? menuName;
  void menuImage;
  int? menuPrice;
  String? uploadedFrom;
  String? size;
  String? createdAt;
  String? updatedAt;
  String? hotelName;

  CartData(
      {this.id,
      this.menuId,
      this.customerId,
      this.partnerId,
      this.quantity,
      this.menuName,
      this.menuImage,
      this.menuPrice,
      this.uploadedFrom,
      this.size,
      this.createdAt,
      this.updatedAt,
      this.hotelName});

  CartData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    menuId = json['menu_id'];
    customerId = json['customer_id'];
    partnerId = json['partner_id'];
    quantity = json['quantity'];
    menuName = json['menu_name'];
    menuImage = json['menu_image'];
    menuPrice = json['menu_price'];
    uploadedFrom = json['uploaded_from'];
    size = json['size'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    hotelName = json['hotel_name'];
  }


}
