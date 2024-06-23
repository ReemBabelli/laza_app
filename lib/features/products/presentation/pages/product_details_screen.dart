import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:laza_app/core/theme/theme_utilities/colors.dart';
import 'package:laza_app/core/utilities/router2.dart';
import 'package:laza_app/core/utilities/size_config.dart';
import 'package:laza_app/core/widgets/custom_buttons.dart';
import 'package:laza_app/core/widgets/space_widget.dart';
import 'package:laza_app/features/auth/presentation/manager/auth_bloc.dart';
import 'package:laza_app/features/auth/presentation/manager/auth_event.dart';
import 'package:laza_app/features/auth/presentation/manager/auth_state.dart';
import 'package:laza_app/features/products/domain/entities/product_entity.dart';
import 'package:laza_app/features/products/presentation/manager/product_bloc.dart';
import 'package:laza_app/features/products/presentation/widgets/review_widget.dart';
import 'package:laza_app/resources/resources.dart';
import 'package:laza_app/widgets/size_widget.dart';

class ProductDetailsScreen extends StatefulWidget {
  final ProductEntity productEntity;

  // final String isAddedToWishList;

  const ProductDetailsScreen({
    super.key,
    required this.productEntity,
  });

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late int currentImage;
  late int previousImage;
  int selectedIndex = 1;

  @override
  void initState() {
    super.initState();
    currentImage = 1;
    previousImage = 1;
    animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 500));
  }

  @override
  void dispose() {
    super.dispose();
    animationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    late bool isExistInCart = false;
    late bool isExistInWishlist = false;
    context
        .read<ProductBloc>()
        .add(IsExistInCartEvent(productId: widget.productEntity.productId));
    context
        .read<ProductBloc>()
        .add(IsExistInWishlistEvent(productId: widget.productEntity.productId));
    context.read<AuthBloc>().add(GetProfileEvent());
    return BlocConsumer<ProductBloc, ProductState>(listener: (context, state) {
      if (state is SuccessState) {
        context.read<AuthBloc>().add(GetProfileEvent());
        context
            .read<ProductBloc>()
            .add(IsExistInCartEvent(productId: widget.productEntity.productId));
        context.read<ProductBloc>().add(
            IsExistInWishlistEvent(productId: widget.productEntity.productId));
        // ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        //     duration: Duration(seconds: 2), content: Text(state.sucMessage)));
      } else if (state is IsExistInCartState) {
        isExistInCart = state.isExists;
      } else if (state is IsExistInWishlistState) {
        isExistInWishlist = state.isExists;
      }
    }, builder: (context, state) {
      return SafeArea(
          child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  Container(
                      color: dirtyWhiteColor,
                      child: Image.network(
                        // widget.productEntity.productImages[selectedIndex].url!,
                        widget.productEntity.productImages[previousImage].url!,
                        fit: BoxFit.cover,
                        width: SizeConfig.screenWidth,
                        height: SizeConfig.screenWidth,
                      )),
                  AnimatedBuilder(
                      animation: animationController,
                      builder: (context, _) {
                        return ClipPath(
                          clipper: CustomPath(value: animationController.value),
                          child: Container(
                              color: dirtyWhiteColor,
                              child: Image.network(
                                // widget.productEntity.productImages[selectedIndex].url!,
                                widget.productEntity.productImages[currentImage]
                                    .url!,
                                fit: BoxFit.cover,
                                width: SizeConfig.screenWidth,
                                height: SizeConfig.screenWidth,
                              )),
                        );
                      }),
                  Positioned(
                    top: 30,
                    left: 30,
                    right: 30,
                    child: Row(
                      children: [
                        CircleAvatar(
                          backgroundColor: blueWhiteColor,
                          child: BackButton(
                            color: Colors.black,
                            // onPressed: () {
                            //   context.pop();
                            // },
                          ),
                        ),
                        Spacer(),
                        InkWell(
                          child: isExistInWishlist
                              ? SvgPicture.asset(
                                  Images.heartFill,
                                  height: 30,
                                  width: 30,
                                  fit: BoxFit.cover,
                                )
                              : SvgPicture.asset(
                                  Images.heartThin,
                                  height: 30,
                                  width: 30,
                                  fit: BoxFit.cover,
                                ),
                          onTap: () {
                            context.read<ProductBloc>().add(AddToWishListEvent(
                                productId: widget.productEntity.productId));
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Container(
                          width: SizeConfig.defaultSize! * 30,
                          child: Text(
                            widget.productEntity.name,
                            maxLines: 2,
                            style: Theme.of(context).textTheme.headlineSmall,
                            // style: getBlackTitle22b(context),
                          ),
                        ),
                        const Spacer(),
                        Text(
                          '\$ ${widget.productEntity.price}',
                          style: Theme.of(context).textTheme.titleLarge,
                          // style: getBlackText15(context),
                        )
                      ],
                    ),
                    const VerticalSpace(2),
                    SizedBox(
                      height: SizeConfig.defaultSize! * 7,
                      child: ListView.separated(
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) => InkWell(
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: const Color(0xffececec),
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  child: Image.network(
                                    widget.productEntity.productImages[index]
                                        .url!,
                                    fit: BoxFit.contain,
                                    width: 80,
                                    height: 80,
                                  ),
                                ),
                                // Inside the InkWell widget onTap callback
                                onTap: () {
                                  setState(() {
                                    // selectedIndex = index;
                                    currentImage = index;
                                    animationController
                                        .forward(from: 0.0)
                                        .whenComplete(() {
                                      previousImage = currentImage;
                                    });
                                  });
                                },
                              ),
                          separatorBuilder: (context, index) => const SizedBox(
                                width: 10.0,
                              ),
                          itemCount: 5),
                    ),
                    const VerticalSpace(1),
                    Row(
                      children: [
                        Text(
                          'Size',
                          style: Theme.of(context).textTheme.titleLarge,
                        ),
                        const Spacer(),
                        Text(
                          'Size Guide',
                          style: Theme.of(context).textTheme.bodyMedium,
                          // style: getGreyText13(context),
                        )
                      ],
                    ),
                    const VerticalSpace(1),
                    SizedBox(
                      height: SizeConfig.defaultSize! * 7,
                      child: ListView.separated(
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) => SizeWidget(
                              size: widget.productEntity.size[index]),
                          separatorBuilder: (context, index) => const SizedBox(
                                width: 10.0,
                              ),
                          itemCount: widget.productEntity.size.length),
                    ),
                    const VerticalSpace(1),
                    Text(
                      'Description',
                      style: Theme.of(context).textTheme.titleLarge,
                      // style: getBlackText17b(context)
                    ),
                    const VerticalSpace(1),
                    Text(
                      widget.productEntity.description,
                      maxLines: 3,
                      style: Theme.of(context).textTheme.titleSmall,
                      // style: getGreyText15(context),
                    ),
                    const VerticalSpace(1),
                    Row(
                      children: [
                        Text(
                          'Reviews',
                          style: Theme.of(context).textTheme.titleLarge,
                          // style: getBlackText17b(context),
                        ),
                        const Spacer(),
                        TextButton(
                            onPressed: () {
                              context.pushNamed(MyRouter2.reviews,
                                  extra: widget.productEntity);
                            },
                            child: Text(
                              'view all',
                              style: Theme.of(context).textTheme.bodyMedium,
                              // style: getGreyText13(context),
                            ))
                      ],
                    ),
                    const VerticalSpace(1),
                    widget.productEntity.reviews!.isEmpty
                        ? Center(
                            child: Text(
                              "No reviews yet",
                              style: Theme.of(context).textTheme.titleSmall,
                            ),
                          )
                        : ReviewWidget(
                            productId: widget.productEntity.productId,
                            reviewId: widget.productEntity.reviews![0].reviewId,
                            userName: widget.productEntity.reviews![0].username,
                            review: widget.productEntity.reviews![0].review,
                            date: widget.productEntity.reviews![0].createdAt!,
                            rating: 4.5),
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: Row(
                        children: [
                          Text(
                            'Total Price',
                            style: Theme.of(context).textTheme.titleLarge,
                            // style: getBlackText15b(context),
                          ),
                          const Spacer(),
                          BlocBuilder<AuthBloc, AuthState>(
                              builder: (context, state) {
                            if (state is GettingProfileSuccessState) {
                              return Text(
                                '\$ ${state.userEntity.totalPrice} ',
                                style: Theme.of(context).textTheme.titleLarge,
                                // style: getBlackText17b(context),
                              );
                            }
                            return CircularProgressIndicator();
                          })
                          // Text(
                          //   '\$ ${widget.totalPrice} ',
                          //   style: getBlackText17b(context),
                          // )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              CartBottomButton(
                isExistInCart: isExistInCart,
                  text1: 'Add to cart',
                  text2: 'Remove  from cart',
                  onPressed: () {
                    context.read<ProductBloc>().add(AddToCartEvent(
                        productId: widget.productEntity.productId));
                  }),
            ],
          ),
        ),
      ));
    });
  }
}

class CustomPath extends CustomClipper<Path> {
  final double value;

  CustomPath({super.reclip, required this.value});

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }

  @override
  Path getClip(Size size) {
    Path path = Path();
    // path.addRect(
        // Rect.fromCircle(center: Offset(0, 0), radius: size.width * 2 * value));
    path.addOval(Rect.fromCenter(
      center: Offset(0,0),
      width: size.width * 2 * value,
      height: size.height * 2 * value,
    ));
    return path;
  }
}
