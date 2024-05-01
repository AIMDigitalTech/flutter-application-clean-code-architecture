import 'package:flutter/material.dart';

import '../widgets/customer_list.dart';
import '../widgets/search_field.dart';

class ListingPage extends StatefulWidget {
  const ListingPage({super.key});

  @override
  ListingPageState createState() => ListingPageState();
}

class ListingPageState extends State<ListingPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Customer listing'),
      ),
      body: const Column(
        children: <Widget>[
          SearchField(),
          Expanded(child: CustomerList()),
        ],
      ),
    );
  }
}
