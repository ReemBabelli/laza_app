import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:laza_app/core/theme/theme_utilities/colors.dart';
import 'package:laza_app/core/utilities/router2.dart';
import 'package:laza_app/core/utilities/size_config.dart';
import 'package:laza_app/core/widgets/custom_buttons.dart';
import 'package:laza_app/core/widgets/loading_widget.dart';
import 'package:laza_app/core/widgets/space_widget.dart';
import 'package:laza_app/core/widgets/text_field_widget.dart';
import 'package:laza_app/features/products/domain/entities/adding_review_entity.dart';
import 'package:laza_app/features/products/domain/entities/product_entity.dart';
import 'package:laza_app/features/products/presentation/manager/product_bloc.dart';

class AddingReviewScreen extends StatefulWidget {
  final ProductEntity productEntity;


  const AddingReviewScreen(
      {super.key, required this.productEntity, });

  @override
  State<AddingReviewScreen> createState() => _AddingReviewScreenState();
}

class _AddingReviewScreenState extends State<AddingReviewScreen> {
  TextEditingController nameCont = TextEditingController();
  TextEditingController reviewCont = TextEditingController();

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  double ratingValue = 3.0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: BlocConsumer<ProductBloc, ProductState>(
      listener: (context, state) {
        if (state is AddingReviewSuccessState) {
          ScaffoldMessenger.of(context)
              .showSnackBar(const SnackBar(content: Text("review was added")));
          context.read<ProductBloc>().add(GetProductByIdEvent(productId: widget.productEntity.productId));
          // context.goNamed(MyRouter2.home,);
        }else if(state is ProductErrorState){
          ScaffoldMessenger.of(context)
              .showSnackBar( SnackBar(content: Text(state.errMessage)));
        }
      },
      builder: (context, state) {
        if (state is ProductLoadingState) {
          return LoadingWidget();
        }
        return Scaffold(
          bottomNavigationBar: BottomButton(
              text: 'Submit review',
              onPressed: () {
                if (formKey.currentState!.validate()) {
                  final addingReviewEntity = AddingReviewEntity(
                      productId: widget.productEntity.productId,
                      review: reviewCont.text,
                      rating: ratingValue);
                  context.read<ProductBloc>().add(
                      AddReviewEvent(addingReviewEntity: addingReviewEntity));
                }
              }),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const BackButton(),
                  const SizedBox(height: 10),
                  Center(
                    child: Text(
                      'Add Review',
                      style: Theme.of(context).textTheme.titleLarge,
                      // style: getBlackText17b(context),
                    ),
                  ),
                  const VerticalSpace(7),
                  Text(
                    'How was your experience ?',
                    style: Theme.of(context).textTheme.titleLarge,
                    // style: getBlackText15(context),
                  ),
                  const VerticalSpace(1),
                  Form(
                    key: formKey,
                    child: Center(
                      child: BorderedTextField(
                        hintText: 'Describe your experience',
                        controller: reviewCont,
                        maxLines: 5,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "the review must not be empty";
                          } else {
                            return null;
                          }
                        },
                      ),
                    ),
                  ),
                  const VerticalSpace(2),
                  Text(
                    'Star',
                    style: Theme.of(context).textTheme.titleLarge,
                    // style: getBlackText15(context),
                  ),
                  Center(
                      child: Text(
                    ratingValue.toStringAsFixed(1),
                     style: const TextStyle(fontSize: 15, color: mainColor),
                  )),
                  Row(
                    children: [
                       Text(
                        '0.0',
                        style: Theme.of(context).textTheme.labelLarge,
                        // style: TextStyle(fontSize: 10),
                      ),
                      const Spacer(),
                      SizedBox(
                        width: SizeConfig.screenWidth! * 0.8,
                        child: Slider(
                            min: 1,
                            max: 5,
                            activeColor: mainColor,
                            value: ratingValue,
                            onChanged: (value) {
                              setState(() {
                                ratingValue = value;
                              });
                            }),
                      ),
                      const Spacer(),
                       Text(
                        '5.0',
                        style: Theme.of(context).textTheme.labelLarge,
                        // style: TextStyle(fontSize: 10),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        );
      },
    ));
  }
}

