import 'package:flutter/material.dart';

import 'customer_card_item.dart';

class CustomerCard extends StatelessWidget {
  const CustomerCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 8.0,
      margin: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
      child: Container(
        decoration: const BoxDecoration(color: Color.fromRGBO(64, 75, 96, .9)),
        child: CustomerCardItem(),
      ),
    );
  }
}
