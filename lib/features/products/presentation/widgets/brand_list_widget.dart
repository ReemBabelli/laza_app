import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:laza_app/core/widgets/space_widget.dart';
import 'package:laza_app/features/products/presentation/manager/product_bloc.dart';

class BrandListWidget extends StatelessWidget {
  final String image;
  final String brandName;
  final String brandId;
  const BrandListWidget({super.key, required this.image, required this.brandName, required this.brandId});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.primary,
          borderRadius: BorderRadius.circular(15),
        ),
        padding: const EdgeInsets.all(5),
        child: Row(
          children: [
            Container(
                decoration: BoxDecoration(
                  color:Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Image.network(image , fit: BoxFit.contain,width: 50 , height: 40,)),
            const HorizontalSpace(1),
            Text(brandName,style: Theme.of(context).textTheme.labelLarge,)
          ],
        ),
      ),
      onTap:   (){
        context.read<ProductBloc>().add(GetProductsAndBrandsEvent(brandId:brandId, brandImage: image ));

      },
    );
  }
}
