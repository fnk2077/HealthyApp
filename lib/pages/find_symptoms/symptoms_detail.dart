// import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class SymptomsDetailPage extends StatelessWidget {
  final String symptom;
  final String detail;

  SymptomsDetailPage({required this.symptom, required this.detail});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(symptom),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(detail),
      ),
    );
  }
}