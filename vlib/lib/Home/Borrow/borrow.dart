import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class BorrowPage extends StatefulWidget {
  const BorrowPage({super.key});

  @override
  State<BorrowPage> createState() => _BorrowPageState();
}

class _BorrowPageState extends State<BorrowPage> {
  TextEditingController bookTitleController = TextEditingController();
  TextEditingController authorController = TextEditingController();
  TextEditingController studentNameController = TextEditingController();

  bool isFormValid() {
    return bookTitleController.text.isNotEmpty &&
        authorController.text.isNotEmpty &&
        studentNameController.text.isNotEmpty;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // ✅ BACKGROUND COLOR HERE
      backgroundColor: Color.fromARGB(255, 9, 34, 88),

      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 3, 33, 97),
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.white),
      ),

      body: Padding(
        padding: const EdgeInsets.all(30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 🔥 TITLE
            Text(
              "Borrow",
              style: TextStyle(
                fontSize: 50,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),

            SizedBox(height: 30),

            // Book Title
            TextField(
              controller: bookTitleController,
              style: TextStyle(color: Colors.white),
              cursorColor: Colors.white,
              inputFormatters: [
                FilteringTextInputFormatter.allow(RegExp(r'[a-zA-Z ]')),
              ],
              decoration: InputDecoration(
                labelText: "Book Title",
                labelStyle: TextStyle(color: Colors.white),

                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(color: Colors.white),
                ),

                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(color: Colors.white, width: 2),
                ),
              ),
              onChanged: (_) => setState(() {}),
            ),

            SizedBox(height: 20),

            // Author
            TextField(
              controller: authorController,
              style: TextStyle(color: Colors.white),
              cursorColor: Colors.white,
              inputFormatters: [
                FilteringTextInputFormatter.allow(RegExp(r'[a-zA-Z ]')),
              ],
              decoration: InputDecoration(
                labelText: "Author",
                labelStyle: TextStyle(color: Colors.white),

                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(color: Colors.white),
                ),

                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(color: Colors.white, width: 2),
                ),
              ),
              onChanged: (_) => setState(() {}),
            ),

            SizedBox(height: 20),

            // Student Name
            TextField(
              controller: studentNameController,
              style: TextStyle(color: Colors.white),
              cursorColor: Colors.white,
              inputFormatters: [
                FilteringTextInputFormatter.allow(RegExp(r'[a-zA-Z ]')),
              ],
              decoration: InputDecoration(
                labelText: "Student Name",
                labelStyle: TextStyle(color: Colors.white),

                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(color: Colors.white),
                ),

                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(color: Colors.white, width: 2),
                ),
              ),
              onChanged: (_) => setState(() {}),
            ),

            SizedBox(height: 30),

            // Borrow Button
            ElevatedButton(
              onPressed: isFormValid()
                  ? () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text("Book Borrowed Successfully!")),
                      );

                      bookTitleController.clear();
                      authorController.clear();
                      studentNameController.clear();
                      setState(() {});
                    }
                  : null,
              style: ElevatedButton.styleFrom(
                minimumSize: Size(double.infinity, 60),
                backgroundColor: Color.fromARGB(255, 22, 163, 74),
              ),
              child: Text(
                "Borrow",
                style: TextStyle(fontSize: 18, color: Colors.white),
              ),
            ),

            SizedBox(height: 20),
            ElevatedButton(
              onPressed: isFormValid()
                  ? () {
                      Navigator.pushNamed(context, '/reserve');
                    }
                  : null,
              style: ElevatedButton.styleFrom(
                minimumSize: Size(double.infinity, 60),
                backgroundColor: const Color.fromARGB(255, 129, 11, 56),
              ),
              child: Text(
                "Reserve",
                style: TextStyle(fontSize: 18, color: Colors.white),
              ),
            ),

            SizedBox(height: 80),

            Text(
              '                 \t \t If a book is not found, please consult the librarian.',
              style: TextStyle(
                color: const Color.fromARGB(255, 197, 197, 197),
                fontSize: 12,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
