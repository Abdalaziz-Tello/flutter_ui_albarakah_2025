import 'package:flutter/material.dart';

class ProductPage extends StatelessWidget {
  const ProductPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            pinned: true,
            title: Text("Hello"),
            backgroundColor: Colors.blue,
          ),
          SliverList.builder(
            itemCount: 4,
            itemBuilder: (context, index) => ListTile(title: Text("Hello")),
          ),
          SliverToBoxAdapter(child: Container(height: 100, color: Colors.red)),
          SliverGrid.builder(
            itemCount: 10,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
            ),
            itemBuilder: (context, index) => FlutterLogo(),
          ),
        ],
      ),
    );
  }
}
