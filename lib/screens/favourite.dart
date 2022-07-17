import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

class Favourite extends StatefulWidget {
  const Favourite({Key? key}) : super(key: key);

  @override
  State<Favourite> createState() => _FavouriteState();
}

class _FavouriteState extends State<Favourite> {
  var box2 = Hive.box('favourite');
  _deleteInfo(int index) {
    box2.deleteAt(index);
    print('Item deleted from box at index: $index');
  }

  @override
  Widget build(BuildContext context) {
    // var name = box.get('name');
    // var price = box.get('price');
    // var image = box.get('image');
    return Scaffold(
      body: ValueListenableBuilder(
        valueListenable: box2.listenable(),
        builder: (context, Box box, widget) {
          if (box.isEmpty) {
            return Center(
              child: Text(
                'Add Some Items to Your Favourites',
                style: TextStyle(fontSize: 20),
              ),
            );
          } else {
            return ListView.builder(
              itemCount: box.length,
              itemBuilder: (context, index) {
                var data = box2.getAt(index)!;
                return ListTile(
                  leading: Image(image: NetworkImage(data.image)),
                  title: Text(data.name),
                  subtitle: Text(data.price),
                  trailing: IconButton(
                    onPressed: () => _deleteInfo(index),
                    icon: Icon(
                      Icons.delete,
                      color: Colors.red,
                    ),
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }

  // Future addFavourite(String name, String price, String image) async {
  //   final favourite = Favourite()
  //     ..name = name
  //     ..createdDate = DateTime.now()
  //     ..price = amount
  //     ..image = image;

  //   final box = Boxes.getFavourite();
  //   box.add(favourite);
  //   //box.put('mykey', transaction);

  //   // final mybox = Boxes.getTransactions();
  //   // final myTransaction = mybox.get('key');
  //   // mybox.values;
  //   // mybox.keys;
  // }
}
