class GetProduct {
  List<Data>? data;

  GetProduct({this.data});

  GetProduct.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(Data.fromJson(v));
      });
    }
  }

}

class Data {
  int? id;
  String? name;
  String? description;
  int? partnerId;
  String? partnerName;
  String? hotelName;
  int? foodCategoryId;
  String? foodCategoryName;
  String? foodType;
  String? sizeType;
  int? originalPrice;
  int? discountedPrice;
  int? regularOriginalPrice;
  int? regularDiscountedPrice;
  int? mediumOriginalPrice;
  int? mediumDiscountedPrice;
  int? largeOriginalPrice;
  int? largeDiscountedPrice;
  int? originalPriceAfterCommission;
  int? discountedPriceAfterCommission;
  String? image;
  String? status;
  int? numberOfOrder;
  int? rating;
  String? uploadedFrom;
  String? createdAt;
  String? updatedAt;
  int? cartQuantity;
  int? cartId;
  String? hotelStatus;

  Data(
      {this.id,
      this.name,
      this.description,
      this.partnerId,
      this.partnerName,
      this.hotelName,
      this.foodCategoryId,
      this.foodCategoryName,
      this.foodType,
      this.sizeType,
      this.originalPrice,
      this.discountedPrice,
      this.regularOriginalPrice,
      this.regularDiscountedPrice,
      this.mediumOriginalPrice,
      this.mediumDiscountedPrice,
      this.largeOriginalPrice,
      this.largeDiscountedPrice,
      this.originalPriceAfterCommission,
      this.discountedPriceAfterCommission,
      this.image,
      this.status,
      this.numberOfOrder,
      this.rating,
      this.uploadedFrom,
      this.createdAt,
      this.updatedAt,
      this.cartQuantity,
      this.cartId,
      this.hotelStatus});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    partnerId = json['partner_id'];
    partnerName = json['partner_name'];
    hotelName = json['hotel_name'];
    foodCategoryId = json['food_category_id'];
    foodCategoryName = json['food_category_name'];
    foodType = json['food_type'];
    sizeType = json['size_type'];
    originalPrice = json['original_price'];
    discountedPrice = json['discounted_price'];
    regularOriginalPrice = json['regular_original_price'];
    regularDiscountedPrice = json['regular_discounted_price'];
    mediumOriginalPrice = json['medium_original_price'];
    mediumDiscountedPrice = json['medium_discounted_price'];
    largeOriginalPrice = json['large_original_price'];
    largeDiscountedPrice = json['large_discounted_price'];
    originalPriceAfterCommission = json['original_price_after_commission'];
    discountedPriceAfterCommission = json['discounted_price_after_commission'];
    image = json['image'];
    status = json['status'];
    numberOfOrder = json['number_of_order'];
    rating = json['rating'];
    uploadedFrom = json['uploaded_from'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    cartQuantity = json['cart_quantity'];
    cartId = json['cart_id'];
    hotelStatus = json['hotel_status'];
  }


}
