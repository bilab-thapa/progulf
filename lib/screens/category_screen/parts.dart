import 'package:flutter/material.dart';

import '../../model/product.dart';
import '../../repository/product_repository.dart';
import '../../response/get_product_response.dart';

class Parts extends StatefulWidget {
  const Parts({Key? key}) : super(key: key);

  @override
  State<Parts> createState() => _PartsState();
}

class _PartsState extends State<Parts> {
  var size, height, width;
  @override
  Widget build(BuildContext context) {
    const textStyle = TextStyle(
        fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white);
    size = MediaQuery.of(context).size;
    height = size.height;
    width = size.width;
    final host = 'http://127.0.0.1:8080/'; //mobile
    // final host = 'http://10.0.2.2:8080/'; //laptop

    return FutureBuilder<ProductResponse?>(
      future: ProductRepository().getProducts(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          if (snapshot.data != null) {
            List<Product> lstProduct = snapshot.data!.data!;
            for (int a = lstProduct.length - 1; a > -1; a--) {
              if (lstProduct[a].category != 'Parts') {
                lstProduct.removeAt(a);
              }
            }
            return GridView.builder(
                gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: 200,
                  childAspectRatio: 0.7,
                  crossAxisSpacing: 0,
                  mainAxisSpacing: 0,
                ),
                itemCount: lstProduct.length,
                itemBuilder: (BuildContext ctx, index) {
                  return InkWell(
                    onTap: () => Navigator.of(context).pushNamed('/productinfo',
                        arguments: lstProduct[index]),
                    child: Container(
                      margin: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        border: Border.all(),
                        color: Colors.deepOrange,
                        borderRadius: BorderRadius.all(
                          Radius.circular(20),
                        ),
                      ),
                      child: Column(
                        children: [
                          SizedBox(height: height * 0.01),
                          Container(
                            height: height * 0.2,
                            width: width * 0.37,
                            child: ClipRRect(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20)),
                              child: Image(
                                image: NetworkImage(
                                  host + lstProduct[index].image.toString(),
                                ),
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                          SizedBox(height: height * 0.01),
                          Text(lstProduct[index].name.toString(),
                              style: textStyle),
                          Text(
                            lstProduct[index].price.toString(),
                            style: textStyle,
                          ),
                        ],
                      ),
                    ),
                  );
                });
          } else {
            return const Center(
              child: Text("Data"),
            );
          }
        } else if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(
              color: Colors.deepOrange,
            ),
          );
        } else if (snapshot.hasError) {
          return Text("${snapshot.error}");
        } else {
          return const Center(
            child: CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(Colors.deepOrange),
            ),
          );
        }
      },
    );
  }
}
