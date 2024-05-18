import 'package:flutter/material.dart';

class CustomCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final String imageUrl;

  const CustomCard({
    super.key,
    required this.title,
    required this.subtitle,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      child: ListTile(
        title: Text(title),
        subtitle: Text(subtitle),
        trailing: imagePlace,
      ),
    );
  }

  get imagePlace{
    return imageUrl == "" ? const SizedBox(width: 100, child: Placeholder(),) : Image.network(imageUrl);
  }

}