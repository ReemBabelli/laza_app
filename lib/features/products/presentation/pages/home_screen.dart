import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:laza_app/core/utilities/router2.dart';
import 'package:laza_app/core/utilities/size_config.dart';
import 'package:laza_app/core/widgets/error_message_widget.dart';
import 'package:laza_app/core/widgets/loading_widget.dart';
import 'package:laza_app/core/widgets/space_widget.dart';
import 'package:laza_app/features/products/presentation/manager/product_bloc.dart';
import 'package:laza_app/features/products/presentation/widgets/brand_list_widget.dart';
import 'package:laza_app/features/products/presentation/widgets/product_widget.dart';
import 'package:laza_app/features/products/presentation/widgets/side_bar_widget.dart';
import 'package:laza_app/resources/resources.dart';

class HomeScreen extends StatefulWidget {
  // final String username;

  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController searchCont = TextEditingController();

  @override
  Widget build(BuildContext context) {
    context.read<ProductBloc>().add(GetProductsAndBrandsEvent());
    // context.read<AuthBloc>().add(GetProfileEvent());
    return BlocConsumer<ProductBloc, ProductState>(
      listener: (context, state) {
        // if (state is ProductErrorState) {
        //   ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        //        content: Text(state.errMessage)));
        // }
        if (state is ProductsByBrandIdSuccessState) {
          final productsEntity = state.productsEntity;
          final brandImage = state.brandImg;

          context.pushNamed(MyRouter2.brand,
              pathParameters: {'brandImage': brandImage},
              extra: productsEntity);
        } else if (state is ProductDetailsSuccessState) {
          final productEntity = state.productEntity;
          // final isAddedToWishList = state.isAddedToWishList;
          context.goNamed(MyRouter2.productDetails, extra: productEntity);
        }
      },
      builder: (context, state) {
        if (state is ProductLoadingState) {
          return const LoadingWidget();
        } else if (state is ProductErrorState) {
          return Scaffold(
              body: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                ErrorMessageWidget(errMessage: state.errMessage),
                VerticalSpace(2),
                CircleAvatar(
                  child: IconButton(
                    icon: Icon(Icons.refresh),
                    color: Theme.of(context).colorScheme.secondary,
                    onPressed: () {
                      context.read<ProductBloc>().add(GetProductsAndBrandsEvent());
                    },
                  ),
                )
                            ],
                          ),
              ));
        } else if (state is ProductAndBrandsSuccessState) {
          final products = state.productsAndBrands.productsModel;
          final brands = state.productsAndBrands.brandsModel;
          final username = state.productsAndBrands.username;
          return SafeArea(
            child: Scaffold(
              //backgroundColor: Theme.of(context).colorScheme.background,
              appBar: AppBar(
                leading: Builder(builder: (context) {
                  return IconButton(
                    icon: Theme.of(context).brightness == Brightness.dark
                        ? SvgPicture.asset(Images.menuWhite)
                        : SvgPicture.asset(Images.menuBlack),
                    onPressed: () => Scaffold.of(context).openDrawer(),
                  );
                }),
              ),
              drawer: SideBarWidget(
                username: username,
              ),
              body: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const VerticalSpace(1),
                    Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Hello',
                              // style: getBlackTitle28b(context),
                              style: Theme.of(context).textTheme.headlineMedium,
                            ),
                            Text(
                              'Welcome to laza',
                              // style: getGreyText15(context),
                              style: Theme.of(context).textTheme.titleSmall,
                              maxLines: 2,
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                        Spacer(),
                        CircleAvatar(
                          child: IconButton(
                            icon: Icon(Icons.search,
                                color: Theme.of(context).colorScheme.secondary),
                            onPressed: () {
                              context.pushNamed(MyRouter2.search);
                            },
                          ),
                        )
                      ],
                    ),
                    Column(
                      children: [
                        brands != null
                            ? Row(
                                children: [
                                  Text(
                                    'Choose Brand',
                                    // style: getBlackText17b(context),
                                    style:
                                        Theme.of(context).textTheme.titleLarge,
                                  ),
                                  const Spacer(),
                                  TextButton(
                                      onPressed: () {
                                        context.pushNamed(MyRouter2.brands,
                                            extra: brands);
                                      },
                                      child: Text(
                                        'view all',
                                        // style: getGreyText13(context),
                                        style: Theme.of(context)
                                            .textTheme
                                            .titleSmall,
                                      ))
                                ],
                              )
                            : VerticalSpace(3),
                      ],
                    ),
                    SizedBox(
                      height: SizeConfig.defaultSize! * 6,
                      child: ListView.separated(
                          shrinkWrap: true,
                          //physics: NeverScrollableScrollPhysics(),
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) => BrandListWidget(
                                image: brands.brands![index].brandImage!.url,
                                brandName: brands.brands![index].brandName!,
                                brandId: brands.brands![index].id!,
                              ),
                          separatorBuilder: (context, index) => const SizedBox(
                                width: 10.0,
                              ),
                          itemCount: brands!.totalCount!),
                    ),
                    VerticalSpace(1),
                    Text(
                      'New Arrival',
                      // style: getBlackText17b(context),
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    VerticalSpace(1),
                    Expanded(
                        child: GridView.builder(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              mainAxisSpacing: 16,
                              crossAxisSpacing: 16,
                              mainAxisExtent: 260),
                      itemCount: products.totalCount,
                      itemBuilder: (BuildContext context, int index) =>
                          ProductWidget(
                              productId: products.products![index].productId,
                              image: products
                                  .products![index].productImages[1].url!,
                              productName: products.products![index].name,
                              productType: 'fleece',
                              productPrice:
                                  products.products![index].price.toString()),
                    ))
                  ],
                ),
              ),
            ),
          );
        } else {
          return Container();
        }
      },
    );
  }
}
