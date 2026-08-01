class ShopModel {
  final String shopName;
  final String ownerName;
  final String mobileNumber;
  final String address;
  final String businessType;
  final String currency;

  const ShopModel({
    required this.shopName,
    required this.ownerName,
    required this.mobileNumber,
    required this.address,
    required this.businessType,
    required this.currency,
  });

  Map<String, dynamic> toMap() {
    return {
      'shopName': shopName,
      'ownerName': ownerName,
      'mobileNumber': mobileNumber,
      'address': address,
      'businessType': businessType,
      'currency': currency,
    };
  }

  factory ShopModel.fromMap(Map<String, dynamic> map) {
    return ShopModel(
      shopName: map['shopName'] ?? '',
      ownerName: map['ownerName'] ?? '',
      mobileNumber: map['mobileNumber'] ?? '',
      address: map['address'] ?? '',
      businessType: map['businessType'] ?? 'Grocery Shop',
      currency: map['currency'] ?? 'BDT',
    );
  }
}