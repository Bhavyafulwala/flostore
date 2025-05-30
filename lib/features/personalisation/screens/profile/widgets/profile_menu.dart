import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:mystore/utils/constants/sizes.dart';

class TprofileMenu extends StatelessWidget {
  const TprofileMenu({
    super.key,
    this.icon=Iconsax.arrow_right_34,
    required this.onpressed,
    required this.title,
    required this.value,
  });

  final IconData icon;
  final VoidCallback onpressed;
  final String title, value;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onpressed,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: TSizes.spaceBtwItems / 1.5,
        ),
        child: Row(
          children: [
            Expanded(
              flex: 4,
              child: Text(title, style: Theme.of(context).textTheme.bodySmall),
            ),
            Expanded(
              flex: 5,
              child: Text(value, style: Theme.of(context).textTheme.bodyMedium),
            ),
            Expanded(child: Icon(icon, size: 18)),
          ],
        ),
      ),
    );
  }
}
