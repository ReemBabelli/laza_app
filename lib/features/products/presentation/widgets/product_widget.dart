import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:laza_app/features/products/presentation/manager/product_bloc.dart';

class ProductWidget extends StatelessWidget {
  final String productId;
  final String image;
  final String productName;
  final String productType;
  final String productPrice;

  const ProductWidget(
      {super.key,
        required this.productId,
      required this.image,
      required this.productName,
      required this.productType,
      required this.productPrice});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
          width: 180,
          padding: const EdgeInsets.all(1),
          decoration: BoxDecoration(
              boxShadow: [
            BoxShadow(
                color: Colors.grey.withOpacity(0.1),
                blurRadius: 50,
                spreadRadius: 7,
                offset: const Offset(0, 2))
          ],
              borderRadius: BorderRadius.circular(15),
              color: Theme.of(context).colorScheme.primary
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: const EdgeInsets.only(bottom: 10),
                width: 180,
                decoration: BoxDecoration(
                  color: const Color(0xffececec),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Image.network(
                  image,
                  fit: BoxFit.contain,
                  width: 100,
                  height: 170,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      productName,
                      textAlign: TextAlign.start,
                      style: Theme.of(context).textTheme.labelLarge,
                      maxLines: 2,
                    ),

                    Text(
                      '\$ $productPrice',
                      textAlign: TextAlign.start,
                      style: Theme.of(context).textTheme.labelLarge,

                    ),
                  ],
                ),
              ),
            ],
          )),
      onTap: () {
         context.read<ProductBloc>().add(GetProductByIdEvent(productId:productId ));

      },
    );
  }
}
