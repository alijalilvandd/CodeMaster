


class AdModel{
  int? id;
  String? title;
  String? image;
  String? price;
  String? creatBy;
  bool? off;
  bool? favorite;
  int? creatByUserId;
  String? date;
  String? fileType;
  String? typeImage;
  List? images;
  String? userImage;

  AdModel({
    this.id,
    this.title,
    this.image,
    this.price,
    this.creatBy,
    this.creatByUserId,
    this.date,
    this.fileType,
    this.typeImage,
    this.images,
    this.userImage,
  });
}