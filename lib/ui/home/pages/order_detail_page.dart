import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

void main() {
  runApp(const OrderDetailPage());
}

class OrderDetailPage extends StatelessWidget {
  const OrderDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light().copyWith(
        scaffoldBackgroundColor: Colors.white,
      ),
      home: MyWidget(
        selectedTickets: [
          Ticket(name: 'VIP Ticket', category: 'Nusantara', price: 100000, quantity: 2),
          Ticket(name: 'Regular Ticket', category: 'Nusantara', price: 50000, quantity: 1),
        ],
      ),
    );
  }
}

// Format harga ke Rupiah
String formatCurrency(int amount) {
  return NumberFormat.currency(locale: 'id_ID', symbol: 'Rp. ', decimalDigits: 0).format(amount);
}

// Class Ticket untuk menyimpan informasi tiket
class Ticket {
  final String name;
  final String category;
  final int price;
  final int quantity;

  Ticket({required this.name, required this.category, required this.price, required this.quantity});
}

class MyWidget extends StatelessWidget {
  final List<Ticket> selectedTickets;

  const MyWidget({super.key, required this.selectedTickets});

  @override
  Widget build(BuildContext context) {
    int totalAmount = selectedTickets.fold(0, (sum, item) => sum + (item.price * item.quantity));

    return Scaffold(
      appBar: AppBar(
        title: const Text('Detail Pesanan'),
        backgroundColor: const Color(0xFF6200EE),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            ...selectedTickets.map((ticket) => TicketInfo(
                  title: ticket.name,
                  category: ticket.category,
                  priceInfo: '${formatCurrency(ticket.price)} x ${ticket.quantity}',
                  total: formatCurrency(ticket.price * ticket.quantity),
                )),
            const SizedBox(height: 20),
            PaymentSummary(total: formatCurrency(totalAmount)),
          ],
        ),
      ),
    );
  }
}

class TicketInfo extends StatelessWidget {
  final String title;
  final String category;
  final String priceInfo;
  final String total;

  const TicketInfo({
    required this.title,
    required this.category,
    required this.priceInfo,
    required this.total,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16.0),
      margin: const EdgeInsets.only(bottom: 8.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(width: 1, color: const Color(0xFFE7E9EC)),
        boxShadow: [
          BoxShadow(color: Colors.grey.shade200, blurRadius: 5, spreadRadius: 1)
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
          const SizedBox(height: 4),
          Text(category, style: const TextStyle(fontSize: 12, color: Color(0xFF4F555C))),
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(priceInfo, style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w600)),
              Text(total, style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Colors.green)),
            ],
          ),
        ],
      ),
    );
  }
}

class PaymentSummary extends StatelessWidget {
  final String total;

  const PaymentSummary({required this.total, super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Order Summary', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        const SizedBox(height: 8),
        Text(total, style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.blue)),
        const SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            PaymentButton(label: 'QRIS', color: Colors.purple),
            PaymentButton(label: 'Tunai', color: Colors.orange),
            PaymentButton(label: 'Transfer', color: Colors.blue),
          ],
        ),
        const SizedBox(height: 20),
        ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFF6200EE),
            minimumSize: const Size(double.infinity, 50), // Full width
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          ),
          child: const Text('Process', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
        ),
      ],
    );
  }
}

class PaymentButton extends StatelessWidget {
  final String label;
  final Color color;

  const PaymentButton({required this.label, required this.color, super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {},
      style: ElevatedButton.styleFrom(
        backgroundColor: color,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      ),
      child: Text(label),
    );
  }
}
