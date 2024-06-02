import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:laza_app/core/widgets/space_widget.dart';
import 'package:laza_app/features/products/data/models/brands_model.dart';
import 'package:laza_app/features/products/presentation/widgets/brand_grid_widget.dart';

class BrandsScreen extends StatefulWidget {
  final BrandsModel brands;

  const BrandsScreen({
    super.key,
    required this.brands,
  });

  @override
  State<BrandsScreen> createState() => _BrandsScreenState();
}

class _BrandsScreenState extends State<BrandsScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              BackButton(
                onPressed: () {
                  context.pop();
                },
              ),
              const SizedBox(height: 10),
              Center(
                child: Text(
                  'Brands',
                  style: Theme.of(context).textTheme.headlineSmall,
                  // style: getBlackText17b(context),
                ),
              ),
              const VerticalSpace(2),
              Text(
                '${widget.brands.totalCount} brands',
                style: Theme.of(context).textTheme.labelLarge,
                // style: getBlackText15(context),
              ),
              const VerticalSpace(1),
              Expanded(
                child: GridView.builder(
                  gridDelegate:
                      const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3,
                          mainAxisSpacing: 16,
                          crossAxisSpacing: 16,
                          mainAxisExtent: 100),
                  itemCount: widget.brands.totalCount,
                  itemBuilder: (BuildContext context, int index) =>
                      BrandGridWidget(
                    brandId: widget.brands.brands![index].id!,
                        brandName: widget.brands.brands![index].brandName!,
                        image: widget.brands.brands![index].brandImage!.url,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
