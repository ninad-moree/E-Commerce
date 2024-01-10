import 'package:flutter/material.dart';

import '../../../../../common/widgets/brands/brand_showcase.dart';
import '../../../../../common/widgets/layouts/grid_layout.dart';
import '../../../../../common/widgets/products/product_card/product_card_vertical.dart';
import '../../../../../common/widgets/texts/section_heading.dart';
import '../../../../../utils/constants/image_strings.dart';
import '../../../../../utils/constants/sizes.dart';

class CategoryTab extends StatelessWidget {
  const CategoryTab({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      children: [
        Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              // BRANDS
              const BrandShowcase(
                images: [
                  TImages.productImage2,
                  TImages.productImage3,
                  TImages.productImage1,
                ],
              ),
              const BrandShowcase(
                images: [
                  TImages.productImage2,
                  TImages.productImage3,
                  TImages.productImage1,
                ],
              ),

              const SizedBox(height: TSizes.spaceBtwItems),

              // Products
              SectionHeading(
                title: 'You Might Like',
                showActionButton: true,
                onPressed: () {},
              ),

              const SizedBox(height: TSizes.spaceBtwItems),

              GridLayout(
                itemCount: 4,
                itemBuilder: (_, index) => const ProductCardVertical(),
              ),

              const SizedBox(height: TSizes.spaceBtwSections),
            ],
          ),
        ),
      ],
    );
  }
}
