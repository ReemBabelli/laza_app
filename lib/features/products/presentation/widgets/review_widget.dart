import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:laza_app/core/utilities/size_config.dart';
import 'package:laza_app/core/widgets/custom_buttons.dart';
import 'package:laza_app/core/widgets/space_widget.dart';
import 'package:laza_app/features/auth/presentation/widgets/dialog_widget.dart';
import 'package:laza_app/features/products/presentation/manager/product_bloc.dart';
import 'package:laza_app/resources/resources.dart';

class ReviewWidget extends StatefulWidget {
  final String productId;
  final String reviewId;
  final String userName;
  final String review;
  final DateTime date;
  final double rating;

  const ReviewWidget(
      {super.key,
      required this.reviewId,
      required this.userName,
      required this.review,
      required this.date,
      required this.rating,
      required this.productId});

  @override
  State<ReviewWidget> createState() => _ReviewWidgetState();
}

class _ReviewWidgetState extends State<ReviewWidget> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return InkWell(
      onLongPress: () {
        showModalBottomSheet(
            context: context,
            builder: (BuildContext context) {
              return SizedBox(
                  height: SizeConfig.defaultSize! * 6,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SideBarButton(
                          image: Images.trashThin,
                          text: 'Delete',
                          onPressed: () {
                            showDialog(
                                context: context,
                                builder: (context) {
                                  return BlocConsumer<ProductBloc,
                                      ProductState>(builder: (context, state) {
                                    return DialogWidget(
                                      text:
                                          "Are you sure sore want to delete this comment ?",
                                      eventText: "Delete",
                                      event: () {
                                        context.read<ProductBloc>().add(
                                            DeletingReviewEvent(
                                                reviewId: widget.reviewId));
                                      },
                                    );
                                  }, listener: (context, state) {
                                    if (state is SuccessState) {
                                      context.pop();
                                      context.pop();
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(SnackBar(
                                              content: Text(state.sucMessage)));
                                      context.read<ProductBloc>().add(
                                          GetProductByIdEvent(
                                              productId: widget.productId));
                                    } else if (state is ProductErrorState) {
                                      context.pop();
                                      context.pop();
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(SnackBar(
                                              content: Text(state.errMessage)));
                                    }
                                  });
                                });
                          },
                        ),
                      ],
                    ),
                  ));
            });
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Theme.of(context).colorScheme.background,
          boxShadow: [
            BoxShadow(
                color: Colors.grey.withOpacity(0.1),
                blurRadius: 50,
                spreadRadius: 7,
                offset: const Offset(0, 2))
          ],
        ),
        width: screenWidth * 0.9,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.userName,
                        style: Theme.of(context).textTheme.labelLarge,
                        // style: getBlackText15b(context),
                      ),
                      Row(
                        children: [
                           Icon(
                            Icons.access_time,
                            size: 15,
                            color: Theme.of(context).colorScheme.secondary,
                          ),
                          const HorizontalSpace(0.8),
                          Text(
                            DateFormat.yMd().format(widget.date),
                            style: Theme.of(context).textTheme.titleSmall,
                            // style: const TextStyle(color: Colors.black54),
                          ),
                        ],
                      )
                    ],
                  ),
                  const Spacer(),
                  Column(
                    children: [
                      Row(
                        children: [
                          Text(
                            widget.rating.toString(),
                            style: Theme.of(context).textTheme.titleLarge,
                          ),
                          const HorizontalSpace(0.8),
                          Text(
                            'rating',
                            style: Theme.of(context).textTheme.titleSmall,
                            // style:
                            // TextStyle(fontSize: 17, color: Colors.black54),
                          ),
                        ],
                      ),
                      RatingBar.builder(
                        initialRating: widget.rating,
                        minRating: 1,
                        direction: Axis.horizontal,
                        allowHalfRating: true,
                        itemCount: 5,
                        itemSize: 12,
                        itemBuilder: (context, _) => const Icon(
                          Icons.star,
                          color: Colors.amber,
                        ),
                        onRatingUpdate: (rating) {
                          print(rating);
                        },
                      )
                    ],
                  )
                ],
              ),
              const VerticalSpace(1),
              Text(
                widget.review,
                maxLines: 3,
                style: Theme.of(context).textTheme.titleMedium,
                // style: getBlackText15(context),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
