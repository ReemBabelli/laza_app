import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:laza_app/core/theme/theme_utilities/colors.dart';
import 'package:laza_app/core/widgets/error_message_widget.dart';
import 'package:laza_app/core/widgets/space_widget.dart';
import 'package:laza_app/core/widgets/text_field_widget.dart';
import 'package:laza_app/features/products/presentation/manager/product_bloc.dart';
import 'package:laza_app/features/products/presentation/widgets/product_widget.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  TextEditingController searchCont = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        leading: const BackButton(),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            BorderedTextField(
              hintText: 'Search',
              controller: searchCont,
              onChange: (productName) {
                context
                    .read<ProductBloc>()
                    .add(SearchEvent(productName: productName));
              },
            ),
            VerticalSpace(5),
            BlocBuilder<ProductBloc, ProductState>(
              builder: (context, state) {
                if (state is ProductErrorState) {
                  return ErrorMessageWidget(errMessage: state.errMessage);
                } else if (state is ProductLoadingState) {
                  return const Center(
                    child: SizedBox(
                      height: 25,
                      width: 25,
                      child: CircularProgressIndicator(
                        color: mainColor,
                      ),
                    ),
                  );
                } else if (state is GetProductsByNameState) {
                  final products = state.proAndUser.productsModel;
                  return Expanded(
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
                            image:
                                products.products![index].productImages[1].url!,
                            productName: products.products![index].name,
                            productType: 'fleece',
                            productPrice:
                                products.products![index].price.toString()),
                  ));
                } else {
                  return const SizedBox();
                }
              },
            )
          ],
        ),
      ),
    ));
  }
}
