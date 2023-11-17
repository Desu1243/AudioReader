class Extension {
  late String extension;
  late bool isSelected;

  Extension({required this.extension, required this.isSelected});

  Map<String, dynamic> toMap(){
    return {
      "extension": extension,
      "isSelected": isSelected
    };
  }

  Extension.fromJson(Map<String, dynamic> json){
    extension = json['extension'];
    isSelected = json['isSelected'];
  }
}
