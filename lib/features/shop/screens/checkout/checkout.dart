import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../common/widgets/appbar/appbar.dart';
import '../../../../common/widgets/custom_shapes/container/rounded_container.dart';
import '../../../../common/widgets/products/cart/coupon_code.dart';
import '../../../../common/widgets/success_screen/success_screen.dart';
import '../../../../navigation_menubar.dart';
import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/image_strings.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/helpers/helper_functions.dart';
import '../cart/widget/carts_items.dart';
import 'widget/billing_address_section.dart';
import 'widget/billing_amount_section.dart';
import 'widget/billing_payment_section.dart';

class CheckoutScreen extends StatelessWidget {
  const CheckoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final darkMode = THelperFunctions.isDarkMode(context);

    return Scaffold(
      appBar: CustomAppBar(
        showBackArrow: true,
        title:
            Text('Checkout', style: Theme.of(context).textTheme.headlineSmall),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              // ITEMS IN THE CART
              const CartsItem(showAddRemovebutton: false),
              const SizedBox(height: TSizes.spaceBtwSections),

              // COUPON TEXTFIELD
              const CouponCode(),
              const SizedBox(height: TSizes.spaceBtwSections),

              // Billing Section
              RoundedContainer(
                showBorder: true,
                padding: const EdgeInsets.all(TSizes.md),
                backgroundColor: darkMode ? TColors.black : TColors.white,
                child: const Column(
                  children: [
                    // PRICING
                    BillingAmountSection(),
                    SizedBox(height: TSizes.spaceBtwItems),

                    // DIVIDER
                    Divider(),
                    SizedBox(height: TSizes.spaceBtwItems),

                    // PAYMENT METHODS
                    BillingPaymentSection(),
                    SizedBox(height: TSizes.spaceBtwItems),

                    // ADDRESS
                    BillingAddressSection(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),

      // CHECKOUT BUTTON
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(TSizes.defaultSpace),
        child: ElevatedButton(
          onPressed: () => Get.to(
            () => SuccessScreen(
              image: TImages.successfulPaymentIcon,
              title: 'Payment Success',
              subTitle: 'Your Item will be Shipped sson!!',
              onPressed: () => Get.offAll(() => const NavigationMenubar()),
            ),
          ),
          child: const Text('Checkout \$256'),
        ),
      ),
    );
  }
}
