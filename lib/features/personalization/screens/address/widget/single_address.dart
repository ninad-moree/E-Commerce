import 'package:e_commerce/utils/constants/colors.dart';
import 'package:e_commerce/utils/constants/sizes.dart';
import 'package:e_commerce/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../common/widgets/custom_shapes/container/rounded_container.dart';

class SingleAddress extends StatelessWidget {
  const SingleAddress({super.key, required this.selectedAdress});

  final bool selectedAdress;

  @override
  Widget build(BuildContext context) {
    final darkMode = THelperFunctions.isDarkMode(context);

    return RoundedContainer(
      padding: const EdgeInsets.all(TSizes.md),
      width: double.infinity,
      showBorder: true,
      backgroundColor: selectedAdress
          ? TColors.primary.withOpacity(0.5)
          : Colors.transparent,
      borderColor: selectedAdress
          ? Colors.transparent
          : darkMode
              ? TColors.darkerGrey
              : TColors.grey,
      margin: const EdgeInsets.only(bottom: TSizes.spaceBtwItems),
      child: Stack(
        children: [
          Positioned(
            right: 5,
            top: 0,
            child: Icon(
              selectedAdress ? Iconsax.tick_circle3 : null,
              color: selectedAdress
                  ? darkMode
                      ? TColors.light
                      : TColors.dark.withOpacity(0.6)
                  : null,
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Abcde Ghk',
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const SizedBox(height: TSizes.sm / 2),
              const Text(
                '(+123) 456 7890',
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(height: TSizes.sm / 2),
              const Text(
                '82644 Timmy Caves, South Liana, Maine, 87665, USA',
                softWrap: true,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
