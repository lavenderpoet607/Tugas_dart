import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

import '../../../core/core.dart';

class PaymentSuccessPage extends StatelessWidget {
  const PaymentSuccessPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primary,
        title: const Text(
          'Payment Receipt',
          style: TextStyle(color: AppColors.white),
        ),
        leading: GestureDetector(
          onTap: () => context.pop(),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Assets.images.back.image(color: AppColors.white),
          ),
        ),
      ),
      body: Stack(
        children: [
          Container(
            height: context.deviceHeight / 2,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.vertical(
                bottom: Radius.circular(12.0),
              ),
              color: AppColors.primary,
            ),
          ),
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: Assets.images.receiptCard.provider(),
                alignment: Alignment.topCenter,
                fit: BoxFit.cover, // Menyesuaikan gambar dengan layar
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(40.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text(
                    'PAYMENT RECEIPT',
                    style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 2.5,
                    ),
                  ),
                  const SpaceHeight(16.0),
                  Expanded(
                    child: QrImageView(
                      data: 'payment-receipt',
                      version: QrVersions.auto,
                      size: context.deviceWidth * 0.6, // Agar QR Code sinkron dengan lebar layar
                    ),
                  ),
                  const SpaceHeight(16.0),
                  const Text('Scan this QR code to verify tickets'),
                  const SpaceHeight(20.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text('Tagihan'),
                      Text(120000.currencyFormatRp),
                    ],
                  ),
                  const SpaceHeight(40.0),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Metode Bayar'),
                      Text('QRIS'),
                    ],
                  ),
                  const SpaceHeight(8.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text('Waktu'),
                      Text(DateTime.now().toFormattedDate()),
                    ],
                  ),
                  const SpaceHeight(8.0),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Status'),
                      Text('Lunas'),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Padding(
        padding: const EdgeInsets.fromLTRB(36, 0, 36, 20),
        child: Button.filled(
          onPressed: () {},
          label: 'Cetak Transaksi',
          borderRadius: 10.0,
        ),
      ),
    );
  }
}
