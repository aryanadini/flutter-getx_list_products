import 'dart:convert';

import 'package:mygetx/myproduct1/Myresiprod.dart';
import 'package:mygetx/myproduct1/Myresiprod.dart';
import 'package:mygetx/myproduct1/Products.dart';
import 'package:http/http.dart' as http;

import 'myproduct1/Products.dart';

class ApiService{
  Future<List<Products>?>fetchdata()async{
    var webdata=await http.get(Uri.parse("https://dummyjson.com/products"));
    var webdata_in_JSOnformat=jsonDecode(webdata.body);
    var FirstLevelData=Myresiprod.fromJson(webdata_in_JSOnformat);
    var list=FirstLevelData.products;
    return list;


  }
}