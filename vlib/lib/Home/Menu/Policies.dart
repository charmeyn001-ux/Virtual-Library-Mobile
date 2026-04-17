// ignore: file_names
import 'package:flutter/material.dart';

void main() =>
    runApp(MaterialApp(debugShowCheckedModeBanner: false, home: Policies()));

class Policies extends StatefulWidget {
  const Policies({super.key});

  @override
  State<Policies> createState() => PoliciesState();
}

class PoliciesState extends State<Policies> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 9, 34, 88),
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 3, 33, 97),
        iconTheme: IconThemeData(color: Colors.white),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //  TITLE
            Padding(
              padding: const EdgeInsets.all(30),
              child: Text(
                "Policies",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

            SizedBox(height: 5),

            //  DESCRIPTION
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Text(
                'These policies are designed to ensure a fair, efficient, and accessible experience for all students utilizing our Virtual Library resources. By engaging with the system, you agree to uphold these guidelines.',
                style: TextStyle(color: Colors.white, fontSize: 16),
                textAlign: TextAlign.justify,
              ),
            ),

            SizedBox(height: 20),

            //  POLICY ITEMS
            PolicyItem(
              title: "1. Borrowing and Circulation",
              content:
                  "Limits: Borrow up to 3 general books and 1 reserved book at a time.\n"
                  "\n"
                  "Renewals: General e-books can be renewed twice.\n"
                  "\n"
                  "Loan Periods: General (3 days), Overnight (3-5 PM to 9 AM).\n"
                  "\n"
                  "Fines:  ₱5.00 day for overdue.\n"
                  "\n"
                  "Non-Compliance: Overdue materials suspend privileges.",
            ),

            PolicyItem(
              title: "2. Lost or Damaged Books",
              content:
                  "If a borrowed book is lost or damaged while under your care, you will be required to replace it..",
            ),

            PolicyItem(
              title: "3. Clearance",
              content:
                  " Students who fail to meet these requirements will not be eligible for semesters clearance. The library will communicate any outstanding issues to the relevant university departments to facilitate the clearance process upon resolution.",
            ),

            SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}

// This is for the read more and readless

class PolicyItem extends StatefulWidget {
  final String title;
  final String content;

  const PolicyItem({super.key, required this.title, required this.content});

  @override
  State<PolicyItem> createState() => _PolicyItemState();
}

class _PolicyItemState extends State<PolicyItem> {
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Design for the TextContent
          //Title
          Text(
            widget.title,
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),

          SizedBox(height: 5),

          // CONTENT
          Text(
            isExpanded
                ? widget.content
                : (widget.content.length > 80
                      ? "${widget.content.substring(0, 80)}..."
                      : widget.content),
            style: TextStyle(color: Colors.white, fontSize: 14),
            textAlign: TextAlign.justify,
          ),

          //  READ MORE BUTTON
          TextButton(
            onPressed: () {
              setState(() {
                isExpanded = !isExpanded;
              });
            },
            child: Text(
              isExpanded ? "Read less" : "Read more",
              style: TextStyle(color: Colors.lightBlueAccent),
            ),
          ),
        ],
      ),
    );
  }
}
