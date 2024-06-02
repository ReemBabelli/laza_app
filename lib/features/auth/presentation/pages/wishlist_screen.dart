import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:laza_app/core/utilities/router2.dart';
import 'package:laza_app/core/widgets/error_message_widget.dart';
import 'package:laza_app/core/widgets/loading_widget.dart';
import 'package:laza_app/core/widgets/space_widget.dart';
import 'package:laza_app/features/auth/presentation/manager/auth_bloc.dart';
import 'package:laza_app/features/auth/presentation/manager/auth_event.dart';
import 'package:laza_app/features/auth/presentation/manager/auth_state.dart';

import '../../../../resources/resources.dart';
import '../../../products/presentation/widgets/product_widget.dart';

class WishlistScreen extends StatefulWidget {
  // final int itemNum;
  const WishlistScreen({
    super.key,
  });

  @override
  State<WishlistScreen> createState() => _WishlistScreenState();
}

class _WishlistScreenState extends State<WishlistScreen> {

  @override
  Widget build(BuildContext context) {
    context.read<AuthBloc>().add(GetProfileEvent());
    return BlocConsumer<AuthBloc, AuthState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        if(state is AuthLoadingState){
          return const LoadingWidget();
        }
        else if(state is AuthErrorState){
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
                          context.read<AuthBloc>().add(GetProfileEvent());
                        },
                      ),
                    )
                  ],
                ),
              ));
        }
        else if(state is GettingProfileSuccessState){
          print("GettingProfileSuccessState");
          final wishList = state.userEntity.wishList;
          print(wishList);
          int itemNum = wishList!.length;

          return SafeArea(
            child: Scaffold(
              body: Padding(
                padding: const EdgeInsets.all(15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    BackButton(
                      onPressed: () {
                        context.pop();
                      },
                    ),
                    Center(
                      child: Column(
                        children: [
                           Text(
                            'WishList',
                            style: Theme.of(context).textTheme.headlineSmall,
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Row(
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    '$itemNum Items',
                                    style: Theme.of(context).textTheme.labelLarge,
                                  ),
                                   Text(
                                    'in wishlist',
                                    style: Theme.of(context).textTheme.titleSmall,
                                  )
                                ],
                              ),
                              // const Spacer(),
                              // Container(
                              //   decoration: BoxDecoration(
                              //     color: const Color(0xffF5F6FA),
                              //     borderRadius: BorderRadius.circular(15),
                              //   ),
                              //   child: Padding(
                              //     padding: const EdgeInsets.all(3),
                              //     child: Row(
                              //       children: [
                              //         const Icon(
                              //           Icons.edit,
                              //         ),
                              //         TextButton(
                              //           onPressed: () {},
                              //           child: const Text(
                              //             'Edit',
                              //             style: TextStyle(color: Colors.black),
                              //           ),
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
                    const SizedBox(
                      height: 10,
                    ),
                    Expanded(
                        child: GridView.builder(
                          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              mainAxisSpacing: 16,
                              crossAxisSpacing: 16,
                              mainAxisExtent: 288),
                          itemCount: itemNum,
                          itemBuilder: (BuildContext context, int index) =>
                              ProductWidget(
                                  productId: wishList[index].productId,
                                  image: wishList[index].productImages[1].url!,
                                  productName: wishList[index].name,
                                  productType: 'fleece',
                                  productPrice: wishList[index].price.toString()),
                        ))
                  ],
                ),
              ),
            ),

          );
        }
        return Container();
      },
    );
  }
}
