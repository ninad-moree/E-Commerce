import 'package:flutter/material.dart';

import '../../../../../common/widgets/custom_shapes/container/rounded_container.dart';
import '../../../../../common/widgets/images/circular_image.dart';
import '../../../../../common/widgets/texts/brand_title_text_with_verified_icon.dart';
import '../../../../../common/widgets/texts/product_price_text.dart';
import '../../../../../common/widgets/texts/product_title_text.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/enums.dart';
import '../../../../../utils/constants/image_strings.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/helpers/helper_functions.dart';

class ProductMetaData extends StatelessWidget {
  const ProductMetaData({super.key});

  @override
  Widget build(BuildContext context) {
    final darkMode = THelperFunctions.isDarkMode(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // PRICE AND SALE PRICE
        Row(
          children: [
            // SALE TAG
            RoundedContainer(
              radius: TSizes.sm,
              backgroundColor: TColors.secondary.withOpacity(0.8),
              padding: const EdgeInsets.symmetric(
                horizontal: TSizes.sm,
                vertical: TSizes.xs,
              ),
              child: Text(
                '25%',
                style: Theme.of(context)
                    .textTheme
                    .labelLarge!
                    .apply(color: TColors.black),
              ),
            ),

            const SizedBox(width: TSizes.spaceBtwItems),

            // PRICE
            Text(
              '\$250',
              style: Theme.of(context)
                  .textTheme
                  .titleSmall!
                  .apply(decoration: TextDecoration.lineThrough),
            ),

            const SizedBox(width: TSizes.spaceBtwItems),

            const ProductPriceText(
              price: '175',
              isLarge: true,
            ),
          ],
        ),

        const SizedBox(height: TSizes.spaceBtwItems / 1.5),

        // TITLE
        const ProductTitleText(title: 'Green Nike  Sports Shirt'),
        const SizedBox(height: TSizes.spaceBtwItems / 1.5),

        // STOCK STATUS
        Row(
          children: [
            const ProductTitleText(title: 'Status'),
            const SizedBox(width: TSizes.spaceBtwItems),
            Text('In Stock', style: Theme.of(context).textTheme.titleMedium),
          ],
        ),
        const SizedBox(height: TSizes.spaceBtwItems / 1.5),

        // BRAND
        Row(
          children: [
            CircularImage(
              image: TImages.shoeIcon,
              width: 32,
              height: 32,
              overlayColor: darkMode ? TColors.white : TColors.black,
            ),
            const BrandTitleTextWithVerifiedIcon(
              title: 'Nike',
              brandTextSize: TextSizes.medium,
            ),
          ],
        ),
      ],
    );
  }
}
