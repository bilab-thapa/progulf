import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:progulf/model/favourite.dart';
import 'package:progulf/model/product.dart';
import 'package:progulf/utils/controller.dart';

class ProductDetail extends StatefulWidget {
  ProductDetail({Key? key}) : super(key: key);

  @override
  State<ProductDetail> createState() => _ProductDetailState();
}

class _ProductDetailState extends State<ProductDetail> {
  final CartController cartController = Get.put(CartController());
  final UserName name = Get.put(UserName());
  late Box box2;
  List<String> id = [];
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    final lstProduct = ModalRoute.of(context)!.settings.arguments as Product;

    @override
    String nameP = lstProduct.name.toString();
    String priceP = lstProduct.price.toString();
    String imageP = 'http://10.0.2.2:8080/' + lstProduct.image.toString();
    placeData() async {
      FavouriteM favourite = FavouriteM(
        name: nameP,
        price: priceP,
        image: imageP,
      );
      for (var i = 0; i < box2.length; i++) {
        id = id + [box2.getAt(i).name];
      }
      // debugPrint(id.toString());
      if (id.contains(nameP)) {
        return false;
      } else {
        await box2.add(favourite);
      }
    }

    @override
    void createBox() async {
      box2 = await Hive.openBox('favourite' + name.userName);
      placeData();
    }

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: height * 0.02),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: width * 0.05),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: width * 0.14,
                      height: height * 0.07,
                      child: ElevatedButton(
                        onPressed: () => Navigator.pop(context),
                        style: ElevatedButton.styleFrom(
                          primary: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                        child: const Align(
                          child: Icon(
                            Icons.arrow_back_ios,
                            size: 25,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: width * 0.14,
                      height: height * 0.07,
                      child: ElevatedButton(
                        onPressed: () {
                          Get.snackbar("Product", "Added to Favourite");
                          createBox();
                        },
                        style: ElevatedButton.styleFrom(
                          primary: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                        child: const Icon(
                          Icons.favorite_outlined,
                          size: 25,
                          color: Colors.red,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: height * 0.01),
              Text(
                lstProduct.name.toString(),
                style: const TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: height * 0.01),
              SizedBox(height: height * 0.01),
              SizedBox(
                height: 340,
                child: Stack(
                  children: [
                    Container(
                      height: 300,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: const BorderRadius.only(
                          bottomLeft: Radius.circular(200),
                          bottomRight: Radius.circular(200),
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 4,
                            blurRadius: 7,
                            offset: const Offset(
                                0, 10), // changes position of shadow
                          ),
                        ],
                      ),
                    ),
                    Center(
                      child: SizedBox(
                        width: 200,
                        child: Image.network(
                          'http://10.0.2.2:8080/' + lstProduct.image.toString(),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: height * 0.02),
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.center,
              //   children: [
              //     CircleAvatar(
              //       backgroundColor: Colors.red,
              //       child: IconButton(
              //         onPressed: () {
              //           c.decreament();
              //         },
              //         icon: Icon(
              //           Icons.remove,
              //           size: 25,
              //           color: Colors.white,
              //         ),
              //       ),
              //     ),
              //     SizedBox(width: 20),
              //     Obx(
              //       (() => Text(
              //             "${c.items.toString()}",
              //             style: TextStyle(
              //                 fontSize: 20, fontWeight: FontWeight.bold),
              //           )),
              //     ),
              //     SizedBox(width: 20),
              //     CircleAvatar(
              //       backgroundColor: Colors.green,
              //       child: IconButton(
              //         onPressed: () {
              //           c.increament();
              //         },
              //         icon: Icon(
              //           Icons.add,
              //           size: 25,
              //           color: Colors.white,
              //         ),
              //       ),
              //     ),
              //   ],
              // ),
              SizedBox(height: height * 0.02),
              Container(
                height: height * 0.17,
                child: Text(
                  lstProduct.description.toString(),
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ),
              SizedBox(height: height * 0.01),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Price',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                        Text(
                          'RS ${lstProduct.price}',
                          style: const TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    InkWell(
                      child: Container(
                        height: height * 0.07,
                        width: width * 0.5,
                        decoration: const BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.all(
                            Radius.circular(10),
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.add_box,
                              color: Colors.white,
                            ),
                            SizedBox(width: width * 0.05),
                            Text(
                              'Add to Cart',
                              style: TextStyle(color: Colors.white),
                            )
                          ],
                        ),
                      ),
                      onTap: () {
                        cartController.addProduct(lstProduct);
                        Get.snackbar(lstProduct.name.toString(),
                            "Successfully Added to Cart");
                      },
                    ),
                  ],
                ),
              ),
              SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }
}
