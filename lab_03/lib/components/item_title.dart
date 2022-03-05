import 'package:flutter/material.dart';
import 'package:lab_03/data.dart';
import 'package:lab_03/providers/cart_provider.dart';
import 'package:provider/provider.dart';

class ItemTitle extends StatelessWidget {
  final Item item;

  const ItemTitle({Key? key, required this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool canAddToCart = !Provider.of<CartProvider>(context).isItemAdded(item);
    return Card(
      elevation: 5,
      child: Padding(
        padding: const EdgeInsets.only(top: 8.0),
        child: Column(
          children: [
            Expanded(child: Image.network(item.image)),
            Text(
              item.name,
              style: Theme.of(context).textTheme.headline6,
            ),
            Text(
              '${item.price}',
              style: Theme.of(context).textTheme.caption,
            ),
            IconButton(
                onPressed: canAddToCart
                    ? () {
                        Provider.of<CartProvider>(context, listen: false)
                            .addItem(item);
                      }
                    : null,
                icon: const Icon(
                  Icons.add_shopping_cart,
                  color: Colors.orange,
                ))
          ],
        ),
      ),
    );
  }
}
