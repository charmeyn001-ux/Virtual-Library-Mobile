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
                  "Limits: Borrow up to 3 general e-books and 1 reserved e-book at a time.\n"
                  "Renewals: General e-books can be renewed twice.\n"
                  "Loan Periods: General (3 days), Overnight (3-5 PM to 9 AM).\n"
                  "Fines: P5/day for overdue.\n"
                  "Non-Compliance: Overdue materials suspend privileges.",
            ),

            PolicyItem(
              title: "2. Lost or Damaged Books",
              content:
                  "If borrowed materials are lost, you will be required to replace them.",
            ),

            PolicyItem(
              title: "3. Clearance",
              content:
                  "All students must follow policies.\nFailure results in denial of clearance.\nLibrary will notify departments.",
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
