import 'package:flutter/material.dart';

class CustomerCardItem extends StatelessWidget {
  const CustomerCardItem({super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
        leading: Container(
          padding: const EdgeInsets.only(right: 12.0),
          decoration: const BoxDecoration(
              border:
                  Border(right: BorderSide(width: 1.0, color: Colors.white24))),
          child: const Icon(Icons.person, color: Colors.white),
        ),
        title: const Text(
          "Customer Title",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        // subtitle: Text("Intermediate", style: TextStyle(color: Colors.white)),

        subtitle: const Row(
          children: <Widget>[
            Icon(Icons.linear_scale, color: Colors.yellowAccent),
            Text("Customer Details", style: TextStyle(color: Colors.white))
          ],
        ),
        trailing: const Icon(Icons.keyboard_arrow_right,
            color: Colors.white, size: 30.0));
  }
}
