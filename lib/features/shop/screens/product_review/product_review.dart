import 'package:flutter/material.dart';

import '../../../../common/widgets/appbar/appbar.dart';
import '../../../../common/widgets/products/ratings/rating_bar_indicator.dart';
import '../../../../utils/constants/sizes.dart';
import 'widget/overall_product_rating.dart';
import 'widget/user_review_card.dart';

class ProductReviewScreen extends StatelessWidget {
  const ProductReviewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: Text('Reviews & Ratings'),
        showBackArrow: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Ratings and review are verified and are from people who use the same type of device that you use',
              ),
              const SizedBox(height: TSizes.spaceBtwItems),

              // OVERALL PRODUCT RATING
              const OverallProductRating(),
              const CustomRatingBarIndicator(rating: 4.8),
              Text(
                '12,611',
                style: Theme.of(context).textTheme.bodySmall,
              ),
              const SizedBox(height: TSizes.spaceBtwSections),

              // USER REVIEW LIST
              const UserReviewCard(),
              const UserReviewCard(),
              const UserReviewCard(),
            ],
          ),
        ),
      ),
    );
  }
}
