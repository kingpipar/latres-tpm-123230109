import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../models/char.dart';

class CharDetail extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Character char = Get.arguments;

    return Scaffold(
      appBar: AppBar(
        title: Text(char.fullName ?? 'Details'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            if (char.image != null && char.image!.isNotEmpty)
              Image.network(char.image!, height: 200, fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) => const Icon(Icons.person, size: 100))
            else
              const Icon(Icons.person, size: 100),
            const SizedBox(height: 16),
            Text('Name: ${char.fullName}', style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            Text('Nickname: ${char.nickname ?? '-'}'),
            const SizedBox(height: 8),
            Text('Hogwarts House: ${char.hogwartsHouse ?? '-'}'),
            const SizedBox(height: 8),
            Text('Interpreted By: ${char.interpretedBy ?? '-'}'),
            const SizedBox(height: 8),
            Text('Birthdate: ${char.birthdate ?? '-'}'),
            const SizedBox(height: 8),
            const Text('Children:'),
            if (char.children != null && char.children!.isNotEmpty)
              ...char.children!.map((child) => Text('- $child')).toList()
            else
              const Text('-'),
          ],
        ),
      ),
    );
  }
}
