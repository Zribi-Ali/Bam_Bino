class Hospital {
  String? image;
  String? name;
  String? address;

  Hospital({this.image, this.name, this.address});

  Hospital.fromJson(Map<String, dynamic> json) {
    image = json['image'];
    name = json['name'];
    address = json['address'];
  }
}
