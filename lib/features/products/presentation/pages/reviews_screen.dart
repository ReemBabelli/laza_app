import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:go_router/go_router.dart';
import 'package:laza_app/core/theme/theme_utilities/colors.dart';
import 'package:laza_app/core/theme/theme_utilities/styles.dart';
import 'package:laza_app/core/utilities/router2.dart';
import 'package:laza_app/core/utilities/size_config.dart';
import 'package:laza_app/core/widgets/custom_buttons.dart';
import 'package:laza_app/core/widgets/space_widget.dart';
import 'package:laza_app/features/products/domain/entities/product_entity.dart';
import 'package:laza_app/features/products/presentation/widgets/review_widget.dart';
import 'package:responsive_framework/responsive_framework.dart';

class ReviewsScreen extends StatefulWidget {
  final ProductEntity productEntity;

  const ReviewsScreen({
    super.key,
    required this.productEntity,
  });

  @override
  State<ReviewsScreen> createState() => _ReviewsScreenState();
}

class _ReviewsScreenState extends State<ReviewsScreen> {
  List dates = [
    DateTime.now(),
    DateTime.now(),
    DateTime.now(),
    DateTime.now(),
    DateTime.now(),
    DateTime.now(),
    DateTime.now(),
    DateTime.now(),
    DateTime.now(),
  ];

  @override
  Widget build(BuildContext context) {
    double rating = 0;
    for (int i = 0; i < widget.productEntity.reviews!.length; i++) {
      rating = rating + widget.productEntity.reviews![i].rating;
    }
    double totalRating = rating / widget.productEntity.reviews!.length;
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
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
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    children: [
                      Text(
                        'Reviews',
                        // style: getBlackText17b(context),
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                      const VerticalSpace(2),
                      Row(
                        children: [
                          Column(
                            children: [
                              Text(
                                '${widget.productEntity.reviews!.length} Reviews',
                                style: Theme.of(context).textTheme.labelLarge,
                                // style: getBlackText15(context),
                              ),
                              Row(
                                children: [
                                  Text(
                                    totalRating.toStringAsFixed(1),
                                    style: Theme.of(context).textTheme.labelLarge,
                                    // style: getBlackText13(context),
                                  ),
                                  const HorizontalSpace(0.8),
                                  RatingBar.builder(
                                    initialRating: totalRating,
                                    minRating: 1,
                                    direction: Axis.horizontal,
                                    allowHalfRating: true,
                                    itemCount: 5,
                                    itemSize: ResponsiveBreakpoints.of(context)
                                            .largerThan(MOBILE)
                                        ? 15
                                        : 10,
                                    itemBuilder: (context, _) => const Icon(
                                      Icons.star,
                                      color: Colors.amber,
                                    ),
                                    onRatingUpdate: (rating) {},
                                  )
                                ],
                              )
                            ],
                          ),
                          const Spacer(),
                          GeneralButton(
                            text: 'Add review',
                            onPressed: () {
                              context.pushNamed(MyRouter2.addingReview,
                                  extra: widget.productEntity,
                                  );
                            },
                            color: mainColor,
                            width: SizeConfig.defaultSize! * 13,
                            icon: const Icon(
                              Icons.edit_note,
                              color: Colors.white,
                            ),
                            textStyle: getWhiteText13(context),
                          )
                        ],
                      ),
                      const VerticalSpace(3),
                      ListView.separated(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemBuilder: (context, index) => ReviewWidget(
                            productId: widget.productEntity.productId,
                            reviewId: widget.productEntity.reviews![index].reviewId,
                              // image: images[index],
                              userName:
                                  widget.productEntity.reviews![index].username,
                              review:
                                  widget.productEntity.reviews![index].review,
                              date: widget
                                  .productEntity.reviews![index].createdAt!,
                              rating:
                                  widget.productEntity.reviews![index].rating),
                          separatorBuilder: (context, index) => const SizedBox(
                                height: 10.0,
                              ),
                          itemCount: widget.productEntity.reviews!.length),
                    ],
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
