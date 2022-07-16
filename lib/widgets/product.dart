import 'package:flutter/material.dart';
import 'package:progulf/model/product.dart';
import 'package:progulf/repository/product_repository.dart';
import 'package:progulf/response/get_product_response.dart';

class ProductAll extends StatefulWidget {
  @override
  State<ProductAll> createState() => _ProductAllState();
}

class _ProductAllState extends State<ProductAll> {
  var size, height, width;

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    height = size.height;
    width = size.width;
    const textStyle = TextStyle(
        fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white);
    return FutureBuilder<ProductResponse?>(
      future: ProductRepository().getProducts(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          if (snapshot.data != null) {
            List<Product> lstProduct = snapshot.data!.data!;
            return ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: snapshot.data!.data!.length,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () => Navigator.of(context)
                      .pushNamed('/productinfo', arguments: lstProduct[index]),
                  child: Container(
                      margin: EdgeInsets.all(10),
                      height: height * 0.08,
                      width: width * 0.5,
                      decoration: BoxDecoration(
                        color: Colors.deepOrange,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Column(
                        children: [
                          Container(
                            height: height * 0.2,
                            width: width * 0.6,
                            margin: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: Colors.red,
                                width: 2.0,
                              ),
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(15),
                              child: Image.network(
                                'http://10.0.2.2:8080/' +
                                    lstProduct[index].image.toString(),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text(lstProduct[index].name.toString(),
                                  style: textStyle),
                              Text(
                                'RS ' + lstProduct[index].price.toString(),
                                style: textStyle,
                              ),
                            ],
                          ),
                          SizedBox(height: 10),
                          Text(
                            lstProduct[index].description.toString(),
                            style: TextStyle(fontSize: 16, color: Colors.white),
                          ),
                        ],
                      )),
                );
              },
            );
          } else {
            return const Center(
              child: Text("Data"),
            );
          }
        } else if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (snapshot.hasError) {
          return Text("${snapshot.error}");
        } else {
          return const Center(
            child: CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
            ),
          );
        }
      },
    );
  }
}
