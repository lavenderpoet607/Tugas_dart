import 'package:flutter/material.dart';
import 'package:tugas_apk/core/constants/colors.dart';
// import 'package:tugas_apk/core/assets/assets.gen.dart';
// import 'package:tugas_apk/core/components/spaces.dart';
// import 'package:tugas_apk/core/constants/colors.dart';
import 'package:tugas_apk/ui/home/models/product_model.dart';
import '../../../core/core.dart';

class OrderCard extends StatelessWidget {
  final ProductModel items;
  const OrderCard({super.key, required this.items});

  @override
  Widget build(BuildContext context) {
    final quantityNotifier = ValueNotifier(0);
    return Container(
      padding: const EdgeInsets.all(24.0),
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.stroke),
        borderRadius: BorderRadius.circular(16.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  items.productName,
                  style: const TextStyle(fontSize: 15.0),
                ),
              ),
              InkWell(
                onTap: () {
                  if (quantityNotifier.value > 0) {
                    quantityNotifier.value--;
                  }
                },
                child: Assets.icons.reduceQuantity.svg(),
              ),
              ValueListenableBuilder(
                valueListenable: quantityNotifier,
                builder: (context, value, _) => Text(
                  '$value',
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              InkWell(
                onTap: () => quantityNotifier.value++,
                child: Assets.icons.addQuantity.svg(),
              ),
            ],
          ),
          Text(
            items.type,
            style: const TextStyle(fontSize: 11.0),
          ),
          const SpacesHeight(8.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                items.price.currencyFormatRp,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              ValueListenableBuilder(
                valueListenable: quantityNotifier,
                builder: (context, value, _) => Text(
                  (items.price * value).currencyFormatRp,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}