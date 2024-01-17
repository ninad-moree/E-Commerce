import 'package:flutter/material.dart';

import '../../../../../common/widgets/products/cart/add_remove_button.dart';
import '../../../../../common/widgets/products/cart/cart_item.dart';
import '../../../../../common/widgets/texts/product_price_text.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/helpers/helper_functions.dart';

class CartsItem extends StatelessWidget {
  const CartsItem({
    super.key,
    this.showAddRemovebutton = true,
  });

  final bool showAddRemovebutton;

  @override
  Widget build(BuildContext context) {
    final darkMode = THelperFunctions.isDarkMode(context);

    return ListView.separated(
      shrinkWrap: true,
      separatorBuilder: (_, __) =>
          const SizedBox(height: TSizes.spaceBtwSections),
      itemCount: 4,
      itemBuilder: (_, index) => Column(
        children: [
          // Cart Item
          CartItem(darkMode: darkMode),

          if (showAddRemovebutton) const SizedBox(height: TSizes.spaceBtwItems),

          // ADD AND REMOVE BUTTON WITH PRICE
          if (showAddRemovebutton)
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    const SizedBox(width: 70),

                    // ADD REMOVE BUTTON
                    ProductQuantityWithAddRemove(darkMode: darkMode),
                  ],
                ),

                // PRODUCT PRICE TEXT
                const ProductPriceText(price: '250'),
              ],
            ),
        ],
      ),
    );
  }
}
