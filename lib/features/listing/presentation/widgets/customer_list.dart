import 'package:flutter/material.dart';

import 'customer_card.dart';

class CustomerList extends StatelessWidget {
  const CustomerList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      itemCount: 10,
      itemBuilder: (BuildContext context, int index) {
        return const CustomerCard();
      },
    );
  }
}
