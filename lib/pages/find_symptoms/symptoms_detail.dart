import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class SymptomsDetailPage extends StatelessWidget {
  final String symptom;
  final String detail;
  final String fullDetail;
  final String medicine;

  SymptomsDetailPage(
      {required this.symptom,
      required this.detail,
      required this.fullDetail,
      required this.medicine});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(symptom),
        actions: [
          IconButton(
            icon: Icon(Icons.info),
            onPressed: () {},
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            SizedBox(height: 16.0),
            Text(
              "Symptom Detail",
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8.0),
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(fullDetail),
              ),
            ),
            SizedBox(height: 16.0),
            Text(
              "Medicine Suggestion",
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8.0),
            Card(
              child: ListTile(
                title: Text(medicine),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
