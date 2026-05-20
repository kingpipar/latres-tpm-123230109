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
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 340),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                if (char.image != null && char.image!.isNotEmpty)
                  ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Image.network(
                      char.image!,
                      height: 500,
                      width: 500,
                      fit:BoxFit.contain,
                      errorBuilder: (context, error, stackTrace) => const Icon(Icons.person, size: 100),
                    ),
                  )
                else
                  const Icon(Icons.person, size: 100),
                const SizedBox(height: 4),
                Text(
                  char.fullName ?? 'Unknown',
                  style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 8),
                Text(
                  char.nickname != null && char.nickname!.isNotEmpty ? 'Nickname: ${char.nickname}' : 'Nickname: -',
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 8),
                Text(
                  'Hogwarts House: ${char.hogwartsHouse ?? '-'}',
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 8),
                Text(
                  'Interpreted By: ${char.interpretedBy ?? '-'}',
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 8),
                Text(
                  'Birthdate: ${char.birthdate ?? '-'}',
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 12),
                const Text('Children:', style: TextStyle(fontWeight: FontWeight.w600)),
                const SizedBox(height: 8),
                if (char.children != null && char.children!.isNotEmpty)
                  Column(
                    children: char.children!.map((child) => Text('- $child', textAlign: TextAlign.center)).toList(),
                  )
                else
                  const Text('-', textAlign: TextAlign.center),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
