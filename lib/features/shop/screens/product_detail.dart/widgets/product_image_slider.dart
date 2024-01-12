import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../common/widgets/appbar/appbar.dart';
import '../../../../../common/widgets/custom_shapes/curved_edges/curved_edge_widget.dart';
import '../../../../../common/widgets/icons/circular_icon.dart';
import '../../../../../common/widgets/images/rounded_image.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/image_strings.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/helpers/helper_functions.dart';

class ProductImageSlider extends StatelessWidget {
  const ProductImageSlider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final darkMode = THelperFunctions.isDarkMode(context);

    return CurvedEdgedWidget(
      child: Container(
        color: darkMode ? TColors.darkerGrey : TColors.light,
        child: Stack(
          children: [
            // MAIN LARGE IMAGE
            const SizedBox(
              height: 400,
              child: Padding(
                padding: EdgeInsets.all(TSizes.productImageRadius * 2),
                child: Center(
                  child: Image(image: AssetImage(TImages.productImage1)),
                ),
              ),
            ),

            // IMAGE SLIDER
            Positioned(
              right: 0,
              bottom: 30,
              left: TSizes.defaultSpace,
              child: SizedBox(
                height: 80,
                child: ListView.separated(
                  separatorBuilder: (_, __) =>
                      const SizedBox(width: TSizes.spaceBtwItems),
                  itemCount: 4,
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  physics: const AlwaysScrollableScrollPhysics(),
                  itemBuilder: (_, index) => RoundedImage(
                    width: 80,
                    backgroundColor: darkMode ? TColors.dark : TColors.white,
                    border: Border.all(color: TColors.primary),
                    padding: const EdgeInsets.all(TSizes.sm),
                    imageUrl: TImages.productImage3,
                  ),
                ),
              ),
            ),

            // APPBAR ICONS
            const CustomAppBar(
              showBackArrow: true,
              actions: [
                CircularIcon(
                  icon: Iconsax.heart5,
                  color: Colors.red,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
