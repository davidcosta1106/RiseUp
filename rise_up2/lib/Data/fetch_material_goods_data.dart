import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:rise_up2/models/material_goods.dart';

class FetchDataMaterialGoods {
  //GET Material Goods
  static Future<List<MaterialGoods>> getMaterialGoods() async {
    Iterable iterable;
    List<MaterialGoods> materialGoods;

    const url = 'http://10.0.2.2:7014/api/Material_Goods';
    final uri = Uri.parse(url);
    final response = await http.get(uri);
    iterable = json.decode(response.body);
    materialGoods = List<MaterialGoods>.from(
        iterable.map((e) => MaterialGoods.fromJson(e)));
    return materialGoods;
  }
}
