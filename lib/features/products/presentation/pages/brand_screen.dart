import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:laza_app/core/widgets/space_widget.dart';
import 'package:laza_app/features/products/domain/entities/products_entity.dart';
import '../widgets/product_widget.dart';

class BrandScreen extends StatefulWidget {
  final ProductsEntity productsEntity;
  final String brandImage;
  const BrandScreen({super.key, required this.brandImage, required this.productsEntity});

  @override
  State<BrandScreen> createState() => _BrandScreenState();
}

class _BrandScreenState extends State<BrandScreen> {

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
             BackButton(
              onPressed: (){
                context.pop();
              },
            ),
            Center(
              child: Column(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color:  Colors.white,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Image.network(widget.brandImage, fit: BoxFit.contain,width: 70 , height: 60,),
                  ),
                  const VerticalSpace(2),
                  Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('${widget.productsEntity.totalCount} Items',
                            // style: getBlackText15(context),
                            style: Theme.of(context).textTheme.labelLarge,
                            ),
                           Text('Available in stock' ,
                             style: Theme.of(context).textTheme.titleSmall,)
                        ],
                      ),
                      const Spacer(),
                      // Container(
                      //   decoration: BoxDecoration(
                      //     color: const Color(0xffF5F6FA),
                      //     borderRadius: BorderRadius.circular(15),
                      //   ),
                      //   child: Padding(
                      //     padding: const EdgeInsets.all(3),
                      //     child: Row(
                      //       children: [
                      //         const Icon(Icons.list, ),
                      //         TextButton(
                      //           onPressed: () {
                      //           },
                      //           child: const Text('Sort by',style: TextStyle(color: Colors.black),),
                      //         )
                      //       ],
                      //     ),
                      //   ),
                      // ),
                    ],
                  ),


                ],
              ),
            ),
            const SizedBox(height: 10,),
            Expanded(
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 16,
                      crossAxisSpacing: 16,
                      mainAxisExtent: 260
                  ),
                  itemCount: widget.productsEntity.totalCount,
                  itemBuilder: (BuildContext context, int index) =>
                      ProductWidget(
                        productId: widget.productsEntity.products![index].productId,
                          image: widget.productsEntity.products![index].productImages[1].url!,
                          productName: widget.productsEntity.products![index].name,
                          productType: 'fleece',
                          productPrice: widget.productsEntity.products![index].price.toString()),

                )
            )
          ],
        ),
      ),
    ));
  }
}
