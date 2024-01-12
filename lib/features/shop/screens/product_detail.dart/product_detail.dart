import 'package:flutter/material.dart';

import '../../../../utils/constants/sizes.dart';
import 'widgets/product_image_slider.dart';
import 'widgets/product_meta_data.dart';
import 'widgets/rating_share_widget.dart';

class ProductDetailScreen extends StatelessWidget {
  const ProductDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            // PRODUCT IMAGE SLIDER
            ProductImageSlider(),

            // PRODUCT DETAILS
            Padding(
              padding: EdgeInsets.only(
                right: TSizes.defaultSpace,
                left: TSizes.defaultSpace,
                bottom: TSizes.defaultSpace,
              ),
              child: Column(
                children: [
                  // RATING AND SHARE
                  RatingAndShare(),

                  // PRICE, TITLE< STACK AND BRAND
                  ProductMetaData(),

                  // ATTRIBUTES

                  // CHECKOUT BUTTON

                  // DESCRIPTION

                  // REVIEWS
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
