import 'package:flutter/material.dart';

void main() {
  runApp(const TicketApp());
}

class TicketApp extends StatelessWidget {
  const TicketApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const HomePage(),
    );
  }
}

// ========================== HomePage ==========================

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Home Page')),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const TicketPage()),
            );
          },
          child: const Text('Buka Penjualan Tiket'),
        ),
      ),
    );
  }
}

// ========================== TicketPage ==========================

class TicketPage extends StatefulWidget {
  const TicketPage({super.key});

  @override
  _TicketPageState createState() => _TicketPageState();
}

class _TicketPageState extends State<TicketPage> {
  final List<Ticket> tickets = [
    Ticket(name: 'Tiket Masuk Dewasa', category: 'Nusantara', price: 50000),
    Ticket(name: 'Tiket Masuk Anak', category: 'Nusantara', price: 20000),
    Ticket(name: 'Tiket Masuk Dewasa', category: 'Mancanegara', price: 150000),
    Ticket(name: 'Tiket Masuk Anak', category: 'Mancanegara', price: 40000),
  ];

  bool isProcessing = false;

  int getTotalPrice() {
    return tickets.fold(0, (total, ticket) => total + (ticket.price * ticket.quantity));
  }

  void processOrder() {
    if (tickets.every((ticket) => ticket.quantity == 0)) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Pilih tiket terlebih dahulu!')),
      );
      return;
    }

    setState(() => isProcessing = true);

    Future.delayed(const Duration(seconds: 2), () {
      if (!mounted) return;
      setState(() => isProcessing = false);

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Pesanan diproses!')),
      );

      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => OrderDetailPage(
            selectedTickets: tickets.where((t) => t.quantity > 0).toList(),
          ),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Penjualan Tiket')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: tickets.length,
                itemBuilder: (context, index) {
                  final ticket = tickets[index];
                  return TicketCard(
                    ticket: ticket,
                    onQuantityChanged: (int value) {
                      setState(() => ticket.quantity = value);
                    },
                  );
                },
              ),
            ),
            const Divider(),
            ProcessButtonGroup(
              totalPrice: getTotalPrice(),
              onProcess: processOrder,
              isProcessing: isProcessing,
            ),
          ],
        ),
      ),
    );
  }
}

// ========================== TicketCard ==========================

class TicketCard extends StatelessWidget {
  final Ticket ticket;
  final ValueChanged<int> onQuantityChanged;

  const TicketCard({super.key, required this.ticket, required this.onQuantityChanged});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: const Color(0xFFE7E9EC)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(ticket.name, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
          Text(ticket.category, style: const TextStyle(color: Colors.grey)),
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Rp. ${ticket.price}', style: const TextStyle(fontWeight: FontWeight.bold)),
              Row(
                children: [
                  IconButton(
                    icon: const Icon(Icons.remove_circle_outline),
                    onPressed: () {
                      if (ticket.quantity > 0) {
                        onQuantityChanged(ticket.quantity - 1);
                      }
                    },
                  ),
                  Text(ticket.quantity.toString(), style: const TextStyle(fontSize: 16)),
                  IconButton(
                    icon: const Icon(Icons.add_circle_outline),
                    onPressed: () => onQuantityChanged(ticket.quantity + 1),
                  ),
                ],
              ),
              Text(
                'Rp. ${ticket.price * ticket.quantity}',
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

// ========================== Ticket Model ==========================

class Ticket {
  final String name;
  final String category;
  final int price;
  int quantity;

  Ticket({required this.name, required this.category, required this.price, this.quantity = 0});

  @override
  String toString() => '$name ($category) - Rp. $price x $quantity';
}

// ========================== ProcessButtonGroup ==========================

class ProcessButtonGroup extends StatelessWidget {
  final int totalPrice;
  final VoidCallback onProcess;
  final bool isProcessing;

  const ProcessButtonGroup({super.key, required this.totalPrice, required this.onProcess, required this.isProcessing});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('Total Harga', style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400, color: Colors.black54)),
          Text('Rp. $totalPrice', style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w700, color: Colors.black87)),
          const SizedBox(height: 12),
          Center(
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF3949AB),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 50),
              ),
              onPressed: isProcessing ? null : onProcess,
              child: Text(isProcessing ? 'Processing...' : 'Process', style: const TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold)),
            ),
          ),
        ],
      ),
    );
  }
}

// ========================== OrderDetailPage ==========================

class OrderDetailPage extends StatelessWidget {
  final List<Ticket> selectedTickets;

  const OrderDetailPage({super.key, required this.selectedTickets});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Detail Pesanan')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: selectedTickets.length,
          itemBuilder: (context, index) {
            final ticket = selectedTickets[index];
            return Card(
              margin: const EdgeInsets.symmetric(vertical: 8),
              child: ListTile(
                title: Text(ticket.name, style: const TextStyle(fontWeight: FontWeight.bold)),
                subtitle: Text('${ticket.category} - Rp. ${ticket.price} x ${ticket.quantity}'),
                trailing: Text('Rp. ${ticket.price * ticket.quantity}', style: const TextStyle(fontWeight: FontWeight.bold)),
              ),
            );
          },
        ),
      ),
    );
  }
}
