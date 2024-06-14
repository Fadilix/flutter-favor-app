import 'package:flutter_favor_app/models/favor.dart';

class FavorService {
  static List<Favor> favors = [];

  static void addFavor(Favor favor) {
    favors.add(favor);
  }

  // static void removeFavor(String id) {
  //   favors = favors.where((favor) => favor.id != id).toList();
  // }
}
