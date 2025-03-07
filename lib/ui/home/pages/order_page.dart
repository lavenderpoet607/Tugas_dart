import 'package:flutter/material.dart';
import 'package:tugas_apk/core/components/spaces.dart';
import 'package:tugas_apk/ui/home/models/product_model.dart';
import 'package:tugas_apk/ui/home/widgets/order_card.dart';

class OrderPage extends StatelessWidget {
  const OrderPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Penjualan'),
        centerTitle: true,
      ),
      body: ListView.separated(
        padding: EdgeInsets.symmetric(horizontal: 20.0),
        separatorBuilder: (context, index) => const SpacesHeight(20.0), 
        itemCount: products.length,
        itemBuilder: (context, index) => OrderCard(
          items: products [index],
        ), 
      ),
    );
  }
}