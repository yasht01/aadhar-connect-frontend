import 'package:flutter/material.dart';

class HistoryPage extends StatelessWidget {
  const HistoryPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(4)),
          margin: const EdgeInsets.symmetric(horizontal: 2, vertical: 1),
          padding: const EdgeInsets.only(left: 10, top: 25, right: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Previous Requests',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
              ),
              const SizedBox(height: 20),
              ListTile(
                tileColor: Colors.red[100],
                title: const Text('Biometric Updation'),
                subtitle: Row(children: const [
                  Expanded(child: Text('id: 25486215')),
                  Text('Status: Request Pending')
                ]),
              ),
              const SizedBox(height: 10),
              ListTile(
                tileColor: Colors.yellow[50],
                title: const Text('Demographic Registration'),
                subtitle: Row(children: const [
                  Expanded(child: Text('id: 25486582')),
                  Text('Status:  Service Pending')
                ]),
              ),
              const SizedBox(height: 10),
              ListTile(
                tileColor: Colors.green[50],
                title: const Text('Biometric Updation'),
                subtitle: Row(children: const [
                  Expanded(child: Text('id: 25874169')),
                  Text('Status: Completed')
                ]),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
