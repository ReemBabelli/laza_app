import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:laza_app/core/widgets/custom_buttons.dart';
import 'package:laza_app/core/widgets/error_message_widget.dart';
import 'package:laza_app/core/widgets/loading_widget.dart';
import 'package:laza_app/core/widgets/space_widget.dart';
import 'package:laza_app/features/auth/presentation/manager/auth_bloc.dart';
import 'package:laza_app/features/auth/presentation/manager/auth_event.dart';
import 'package:laza_app/features/auth/presentation/manager/auth_state.dart';
import 'package:laza_app/features/products/presentation/manager/product_bloc.dart';
import 'package:laza_app/widgets/cart_widget.dart';
import 'package:laza_app/widgets/option_widget.dart';

import '../../../../resources/resources.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  List tax = [4.00, 5.00, 4.00, 2.00, 5.00, 2.00];
  List num = [1, 2, 1, 1, 3, 1];

  @override
  Widget build(BuildContext context) {
    context.read<AuthBloc>().add(GetProfileEvent());
    return BlocConsumer<AuthBloc, AuthState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        if (state is AuthLoadingState) {
          return const LoadingWidget();
        }
        else if(state is AuthErrorState){
          return Scaffold(
              body: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ErrorMessageWidget(errMessage: state.errMessage),
                    const VerticalSpace(2),
                    CircleAvatar(
                      child: IconButton(
                        icon: const Icon(Icons.refresh),
                        color: Theme.of(context).colorScheme.secondary,
                        onPressed: () {
                          context.read<AuthBloc>().add(GetProfileEvent());
                        },
                      ),
                    )
                  ],
                ),
              ));
        }
        else if (state is GettingProfileSuccessState) {
          final cart = state.userEntity.cart;

          int totalPrice = state.userEntity.totalPrice!;
          return BlocListener<ProductBloc, ProductState>(
            listener: (context, state) {
           if(state is SuccessState){
             context.read<AuthBloc>().add(GetProfileEvent());
           }
            },
            child: SafeArea(
                child: Scaffold(
                    bottomNavigationBar:
                    BottomButton(text: 'Checkout', onPressed: () {}),
                    body: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          BackButton(
                            onPressed: () {
                              context.pop();
                            },
                          ),
                          Center(
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  left: 15, right: 15, bottom: 15),
                              child: Column(
                                children: [
                                  Text(
                                    'Cart',
                                    style: Theme.of(context).textTheme.headlineSmall,
                                    // style: getBlackText17b(context),
                                  ),
                                  const VerticalSpace(2),
                                  ListView.separated(
                                      shrinkWrap: true,
                                      physics:
                                      const NeverScrollableScrollPhysics(),
                                      itemBuilder: (context, index) =>
                                          CartWidget(
                                              image:
                                              cart[index].productImages[1].url!,
                                              itemName: cart[index].name,
                                              itemPrice: cart[index].price
                                                  .toString(),
                                              itemId: cart[index].productId,
                                              // itemNum: num[index],
                                              itemTax: tax[index]),
                                      separatorBuilder: (context, index) =>
                                      const SizedBox(
                                        height: 10.0,
                                      ),
                                      itemCount: cart!.length),
                                ],
                              ),
                            ),
                          ),

                          Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 5, horizontal: 15),
                            child: Text(
                              'Delivery Address',
                              style: Theme.of(context).textTheme.labelLarge,
                              // style: getBlackText15b(context),
                            ),
                          ),
                          const Padding(
                            padding:
                            EdgeInsets.symmetric(vertical: 5, horizontal: 15),
                            child: Center(
                              child: OptionWidget(
                                  image: Images.location,
                                  title: 'Chhatak, Sunamgonj 12/8AB',
                                  subtitle: 'Sylhet'),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 5, horizontal: 15),
                            child: Text(
                              'Payment Method',
                              style: Theme.of(context).textTheme.labelLarge,
                              // style: getBlackText15b(context),
                            ),
                          ),
                          const Padding(
                            padding:
                            EdgeInsets.symmetric(vertical: 5, horizontal: 15),
                            child: Center(
                              child: OptionWidget(
                                  image: Images.visa,
                                  title: 'Visa Classic',
                                  subtitle: '**** 7690'),
                            ),
                          ),
                          const VerticalSpace(1),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 5, horizontal: 15),
                            child: Text(
                              'Order Info',
                              style: Theme.of(context).textTheme.labelLarge,
                              // style: getBlackText15b(context),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 5, horizontal: 15),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Text(
                                      'Subtotal',
                                      style: Theme.of(context).textTheme.titleSmall,
                                      // style: getGreyText15(context),
                                    ),
                                    const Spacer(),
                                    Text(
                                      '\$ 110',
                                      style: Theme.of(context).textTheme.labelLarge,
                                      // style: getBlackText15b(context),
                                    )
                                  ],
                                ),
                                const VerticalSpace(1),
                                Row(
                                  children: [
                                    Text(
                                      'Shipping cost',
                                      style: Theme.of(context).textTheme.titleSmall,
                                      // style: getGreyText15(context),
                                    ),
                                    const Spacer(),
                                    Text(
                                      '\$ 10',
                                      style: Theme.of(context).textTheme.labelLarge,
                                      // style: getBlackText15b(context),
                                    )
                                  ],
                                ),
                                const VerticalSpace(1),
                                Row(
                                  children: [
                                    Text(
                                      'Total',
                                      style: Theme.of(context).textTheme.titleSmall,
                                      // style: getGreyText15(context),
                                    ),
                                    const Spacer(),
                                    Text(
                                      '\$ ${totalPrice.toStringAsFixed(1)}',
                                      style: Theme.of(context).textTheme.labelLarge,
                                      // style: getBlackText15b(context),
                                    )
                                  ],
                                ),
                                const VerticalSpace(1),
                              ],
                            ),
                          ),
                          // BottomButton(text: 'Checkout', onPressed: (){}),
                        ],
                      ),
                    ))),
          );
        }
        return Container();
      },
    );
  }


}
