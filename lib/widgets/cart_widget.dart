import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:laza_app/core/utilities/size_config.dart';
import 'package:laza_app/core/widgets/space_widget.dart';
import 'package:laza_app/features/products/presentation/manager/product_bloc.dart';

class CartWidget extends StatefulWidget {
  final String image;
  final String itemName;
  final String itemPrice;
  final String itemId;
  final double itemTax;

  const CartWidget(
      {super.key,
      required this.image,
      required this.itemName,
      required this.itemPrice,
      required this.itemTax,
      required this.itemId});

  @override
  State<CartWidget> createState() => _CartWidgetState();
}

class _CartWidgetState extends State<CartWidget> {
  int itemNum = 1;

  @override
  Widget build(BuildContext context) {
    return body(context);
  }

  Widget body(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primary,
        borderRadius: BorderRadius.circular(15),
      ),
      padding: const EdgeInsets.all(5),
      child: Row(
        children: [
          Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Image.network(
                widget.image,
                fit: BoxFit.contain,
                width: 120,
                height: 120,
              )),
          HorizontalSpace(2),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: SizeConfig.defaultSize! * 20,
                child: Text(
                  widget.itemName,
                  style: Theme.of(context).textTheme.labelLarge,
                  maxLines: 2,
                ),
              ),
              Text(
                ' \$ ${widget.itemPrice} , ( - \$ ${widget.itemTax.toString()} Tax )',
                style: Theme.of(context).textTheme.titleSmall,
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  IconButton(
                    onPressed: () {
                      setState(() {
                        itemNum += 1;
                      });
                    },
                    icon: Icon(
                      Icons.keyboard_arrow_up_outlined,
                      color: Theme.of(context).colorScheme.secondary,
                    ),
                  ),
                  Text(
                    "$itemNum",
                    style: Theme.of(context).textTheme.labelLarge,
                  ),
                  IconButton(
                    onPressed: () {
                      setState(() {
                        if (itemNum > 0) {
                          itemNum -= 1;
                        }
                      });
                    },
                    icon: const Icon(Icons.keyboard_arrow_down_outlined),
                    color: Theme.of(context).colorScheme.secondary,
                  ),
                  SizedBox(
                    width: SizeConfig.defaultSize! * 7,
                  ),
                  IconButton(
                      onPressed: () {
                        context
                            .read<ProductBloc>()
                            .add(AddToCartEvent(productId: widget.itemId));
                      },
                      icon: Theme.of(context).brightness == Brightness.dark
                          ? Icon(Icons.delete_outline,color: Color(0xff808080),)
                          : Icon(Icons.delete_outline,color: Color(0xff29363D),),
                      color: Colors.black54),
                ],
              )
            ],
          ),
        ],
      ),
    );
  }
}
