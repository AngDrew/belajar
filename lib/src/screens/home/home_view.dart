import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

import 'product_model.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  void initState() {
    super.initState();

    getProduct();
  }

  Future<void> getProduct() async {
    ProductApi? tempProduct = await DioClient().getProducts();

    setState(() {
      product = tempProduct;
    });
  }

  ProductApi? product;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          children: [
            ElevatedButton(
              onPressed: getProduct,
              child: Text('get prod'),
            ),
            //
            if (product?.products != null)
              for (var prod in product!.products!) Text(prod.title),
          ],
        ),
      ),
    );
  }
}

class DioClient {
  String baseUrl = 'https://dummyjson.com';

  Future<ProductApi?> getProducts() async {
    final Dio dio = Dio(
      BaseOptions(baseUrl: baseUrl),
    );

    Response response = await dio.request(
      '/products',
      options: Options(
        method: 'get',
      ),
    );

    if (response.data != null) {
      // print(response.data);
      return ProductApi.fromJson(response.data);
    }
    return null;
  }
}
