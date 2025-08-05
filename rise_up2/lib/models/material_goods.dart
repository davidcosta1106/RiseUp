class MaterialGoods {
  int idMaterialGood;
  String materialGoodName;

  MaterialGoods(
     this.idMaterialGood,
     this.materialGoodName,
  );

  factory MaterialGoods.fromJson(Map<String, dynamic> json) {
    return MaterialGoods(
    json['id_material_good'],
    json['material_good_name']
    );
  }
}
