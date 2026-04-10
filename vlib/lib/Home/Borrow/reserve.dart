import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() =>
    runApp(MaterialApp(debugShowCheckedModeBanner: false, home: Reserve()));

class Reserve extends StatefulWidget {
  const Reserve({super.key});

  @override
  State<Reserve> createState() => ReserveState();
}

class ReserveState extends State<Reserve> {
  DateTime? selectedDate;
  TextEditingController timeController = TextEditingController();
  String? period; // AM or PM

  // Validate form
  bool isValid() {
    if (selectedDate == null || timeController.text.isEmpty || period == null) {
      return false;
    }

    int hour = int.tryParse(timeController.text) ?? 0;

    //  Restriction of time
    if (period == "PM" && hour >= 5) return false;
    if (period == "PM" && hour >= 6) return false;
    if (period == "PM" && hour >= 7) return false;
    if (period == "AM" && hour == 12) return false;
    if (period == "AM" && hour == 1) return false;
    if (period == "AM" && hour == 2) return false;
    if (period == "AM" && hour == 3) return false;
    if (period == "AM" && hour == 4) return false;
    if (period == "AM" && hour == 5) return false;
    if (period == "AM" && hour == 6) return false;
    if (period == "AM" && hour == 7) return false;

    return true;
  }

  //  Date Picker
  Future<void> pickDate() async {
    DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2100),
    );

    if (picked != null) {
      setState(() {
        selectedDate = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 9, 34, 88),

      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 3, 33, 97),
        iconTheme: IconThemeData(color: Colors.white),
      ),

      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 🔥 TITLE
            Text(
              "Reserve Book",
              style: TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),

            SizedBox(height: 30),

            // DATE PICKER
            GestureDetector(
              onTap: pickDate,
              child: Container(
                padding: EdgeInsets.all(15),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.white),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      selectedDate == null
                          ? "Select Date"
                          : "${selectedDate!.toLocal()}".split(' ')[0],
                      style: TextStyle(color: Colors.white),
                    ),
                    Icon(Icons.calendar_today, color: Colors.white),
                  ],
                ),
              ),
            ),

            SizedBox(height: 40),

            // TIME INPUT + AM/PM
            Row(
              children: [
                // TIME FIELD
                Expanded(
                  child: TextField(
                    controller: timeController,
                    style: TextStyle(color: Colors.white),
                    cursorColor: Colors.white,
                    keyboardType: TextInputType.number,
                    inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                    decoration: InputDecoration(
                      labelText: "Hour (Library opens in 8 AM - 5 P.M)",
                      labelStyle: TextStyle(color: Colors.white),

                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: Colors.white),
                      ),

                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: Colors.white),
                      ),
                    ),
                    onChanged: (_) => setState(() {}),
                  ),
                ),

                SizedBox(width: 30),

                // AM/PM DROPDOWN
                DropdownButton<String>(
                  dropdownColor: Color.fromARGB(255, 3, 33, 97),
                  value: period,
                  hint: Text("AM/PM", style: TextStyle(color: Colors.white)),
                  items: ["AM", "PM"].map((value) {
                    return DropdownMenuItem(
                      value: value,
                      child: Text(value, style: TextStyle(color: Colors.white)),
                    );
                  }).toList(),
                  onChanged: (value) {
                    setState(() {
                      period = value;
                    });
                  },
                ),
              ],
            ),

            SizedBox(height: 30),

            //  RESERVE BUTTON
            ElevatedButton(
              onPressed: isValid()
                  ? () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text("Reservation Successful!")),
                      );
                    }
                  : null,
              style: ElevatedButton.styleFrom(
                minimumSize: Size(double.infinity, 60),
                backgroundColor: Color.fromARGB(255, 22, 163, 74),
              ),
              child: Text(
                "Reserve",
                style: TextStyle(fontSize: 18, color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
