import 'package:e_commerce/common/widgets/appbar/appbar.dart';
import 'package:e_commerce/common/widgets/products/cart/cart_menu_icon.dart';
import 'package:e_commerce/utils/constants/colors.dart';
import 'package:flutter/material.dart';

import '../../../../utils/helpers/helper_functions.dart';

class StoreScreen extends StatelessWidget {
  const StoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final darkMode = THelperFunctions.isDarkMode(context);

    return Scaffold(
      appBar: CustomAppBar(
        title: const Text('Store'),
        actions: [
          CartCounterIcon(
            onPressed: () {},
            iconColor: darkMode ? TColors.white : TColors.black,
          ),
        ],
      ),
    );
  }
}
