import 'package:hive/hive.dart';
import 'package:progulf/screens/favourite.dart';

class Boxes {
  static Box<Favourite> getFavourite() => Hive.box<Favourite>('favourite');
}
