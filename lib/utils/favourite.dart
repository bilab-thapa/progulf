import 'package:hive/hive.dart';
import 'package:progulf/screens/main/favourite.dart';

class Boxes {
  static Box<Favourite> getFavourite() => Hive.box<Favourite>('favourite');
}
