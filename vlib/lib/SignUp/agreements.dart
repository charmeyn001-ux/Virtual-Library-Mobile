import 'package:flutter/material.dart';
import 'package:vlib/Animation/fade_animation.dart';
import 'package:vlib/Home/home_page.dart';

void main() =>
    runApp(MaterialApp(debugShowCheckedModeBanner: false, home: Agreement()));

class Agreement extends StatefulWidget {
  const Agreement({super.key});

  @override
  State<Agreement> createState() => AgreementState();
}

class AgreementState extends State<Agreement> {
  bool isChecked = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color.fromARGB(255, 250, 250, 250),
              Color.fromARGB(255, 3, 28, 99),
            ],
          ),
        ),
        child: Stack(
          children: <Widget>[
            Column(
              children: [
                SizedBox(height: 150),
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 4, 19, 104),
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(50),
                        topRight: Radius.circular(50),
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.2),
                          spreadRadius: 5,
                          blurRadius: 7,
                          offset: Offset(0, 3),
                        ),
                      ],
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(35),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          FadeAnimation(
                            1,
                            Text(
                              'Agreement of Terms',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 40,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          SizedBox(height: 10),

                          FadeAnimation(
                            1.2,
                            Text(
                              'This agreement governs your use of the Virtual Library System. '
                              'By accessing it, you agree to these terms, which mirror our physical library policies.',
                              style: TextStyle(
                                color: const Color.fromARGB(179, 248, 248, 248),
                                fontSize: 17,
                              ),
                              textAlign: TextAlign.start,
                            ),
                          ),

                          SizedBox(height: 20),
                          FadeAnimation(
                            1.3,
                            Text(
                              '1. Borrowing & Circulation:\n'
                              '- Borrow up to 3 books and 1 reserved book at a time.\n'
                              '-Loan Periods: General (3 days), Overnight (borrow 3-5 PM, return by 9 AM next day).\n'
                              '-Fines: P5.00/day for overdue general e-books; P5.00 first hour and P0.50/hour thereafter for overdue overnight e-books.\n'
                              '-Borrowing is recorded digitally; due dates are shown in the system.\n',
                              style: TextStyle(
                                color: Colors.white70,
                                fontSize: 16,
                              ),
                              textAlign: TextAlign.justify,
                            ),
                          ),

                          SizedBox(height: 5),

                          FadeAnimation(
                            1.4,
                            Text(
                              '2. Clearance:\n'
                              '-Failure to comply with these rules, including settling fines, will result in denial of clearance.',
                              style: TextStyle(
                                color: Colors.white70,
                                fontSize: 16,
                              ),
                              textAlign: TextAlign.justify,
                            ),
                          ),

                          SizedBox(height: 20),

                          Row(
                            children: [
                              FadeAnimation(
                                1.5,
                                Checkbox(
                                  value: isChecked,
                                  onChanged: (bool? value) {
                                    setState(() {
                                      isChecked = value ?? false;
                                    });
                                  },
                                ),
                              ),

                              FadeAnimation(
                                1.6,

                                Text(
                                  'I Accept Terms & Conditions',
                                  style: TextStyle(
                                    color: Colors.white70,
                                    fontSize: 14,
                                  ),
                                ),
                              ),
                            ],
                          ),

                          //buttn
                          SizedBox(height: 30),

                          FadeAnimation(
                            1.7,
                            ElevatedButton(
                              onPressed: isChecked
                                  ? () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => HomePage(),
                                        ),
                                      );
                                    }
                                  : null,

                              style: ElevatedButton.styleFrom(
                                backgroundColor: isChecked
                                    ? Colors.white
                                    : const Color.fromARGB(255, 187, 186, 186),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30),
                                ),
                                padding: EdgeInsets.symmetric(
                                  horizontal: 156,
                                  vertical: 25,
                                ),
                              ),

                              child: Text(
                                'Create Account',
                                style: TextStyle(
                                  color: Color.fromARGB(255, 4, 19, 104),
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            FadeAnimation(
              1,
              Positioned(
                top: 5,
                left: 0,
                right: 0,
                child: Image.asset(
                  'images/layingDown.png',
                  height: 200,
                  width: 210,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
