import 'package:flutter/cupertino.dart';
import 'package:flutter_complete_guide/providers/products_provider.dart';
import 'package:flutter_complete_guide/widgets/product_item.dart';
import 'package:provider/provider.dart';

class ProductGrids extends StatelessWidget {
  final bool showFas;
  ProductGrids(this.showFas);
  @override
  Widget build(BuildContext context) {
    final productsData = Provider.of<ProductProvider>(context);
    final produt = showFas ? productsData.favoriteItems : productsData.item;
    return GridView.builder(
      padding: EdgeInsets.all(10),
      itemCount: produt.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 3 / 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10),
      itemBuilder: (ctx, i) => ChangeNotifierProvider.value(
        value: produt[i],
        child: ProductItem(
            // produt[i].id,
            // produt[i].title,
            // produt[i].imageUrl,
            ),
      ),
    );
  }
}
