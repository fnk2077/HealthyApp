import 'package:good_healthy/pages/find_symptoms/symptoms_detail.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class FindSymptomsWidget extends StatefulWidget {
  @override
  _FindSymptomsWidgetState createState() => _FindSymptomsWidgetState();
}

class _FindSymptomsWidgetState extends State<FindSymptomsWidget> {
  TextEditingController searchController = TextEditingController();
  String searchText = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFAA77FF),
        title: Text("Symptoms", style: TextStyle(color: Colors.white)),
        automaticallyImplyLeading: false, // Add this line
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: searchController,
              decoration: InputDecoration(
                hintText: 'Search Symptoms',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              onChanged: (value) {
                setState(() {
                  searchText = value;
                });
              },
            ),
          ),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 4,
                    blurRadius: 10,
                    offset: Offset(0, 3), // changes position of shadow
                  ),
                ],
                color: Colors.white,
              ),
              child: StreamBuilder(
                stream: FirebaseFirestore.instance
                    .collection("symptoms")
                    .snapshots(),
                builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                  if (!snapshot.hasData) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  } else {
                    var filteredDocs = snapshot.data?.docs?.where((doc) {
                          return doc['symptom']
                              .toString()
                              .toLowerCase()
                              .contains(searchText.toLowerCase());
                        })?.toList() ??
                        [];

                    return ListView.builder(
                      itemCount: filteredDocs.length,
                      itemBuilder: (context, index) {
                        var document = filteredDocs[index];
                        return GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => SymptomsDetailPage(
                                  symptom: document["symptom"],
                                  detail: document["detail"],
                                  fullDetail: document["fullDetail"],
                                  medicine: document["medicine"],
                                ),
                              ),
                            );
                          },
                          child: SizedBox(
                            height: 100,
                            child: Card(
                              elevation: 5,
                              child: ListTile(
                                title: Text(document["symptom"]),
                                subtitle: Text(
                                  document["detail"],
                                  maxLines: 3,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              margin: const EdgeInsets.symmetric(
                                  vertical: 10, horizontal: 25),
                            ),
                          ),
                        );
                      },
                    );
                  }
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
