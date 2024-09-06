import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ProductDetail extends StatefulWidget {

  @override
  _ProductDetailState createState() => _ProductDetailState();
}

class _ProductDetailState extends State<ProductDetail> {
 Set <String> _selectedSizes = {}; // Variable to track selected size

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text('ProductDetail', style: TextStyle(color: Colors.black)),
        elevation: 0,
      ),
      body: Row(
        children: [
          Expanded(
            child: Container(
              color: Color(0xFFF1F1F1), // Left container color
              padding: EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Product Images',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 16), // Space between text and grid
                  Expanded(
                    child: Column(
                      children: [
                        Expanded(
                          child: GridView(
                            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2, // 2 columns
                              crossAxisSpacing: 16,
                              mainAxisSpacing: 16,
                            ),
                            children: [
                              GridItem1(),
                              GridItem2(),
                              GridItem3(),
                              GridItem4(),
                              GridItem5(),
                              GridItem6(),
                            ],
                          ),
                        ),
                        SizedBox(height: 16), // Space between grid and text
                        Text(
                          'Accessroes Images',
                          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 16), // Space between text and next grid
                        Expanded(
                          child: GridView(
                            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2, // 2 columns
                              crossAxisSpacing: 16,
                              mainAxisSpacing: 16,
                            ),
                            children: [
                              GridItem7(),
                              GridItem8(),
                              GridItem9(),
                              GridItem10(),
                              GridItem11(),
                              GridItem12(),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),





          Expanded(
            child: Column(
              children: [
                Expanded(
                  flex: 9,
                  child: Container(
                    color: Colors.white,
                    child: SingleChildScrollView(
                      padding: EdgeInsets.all(16),
                      child: Column(
                        children: [
                          Text('Product Details', style: GoogleFonts.josefinSans(
                              fontSize: 25,
                              fontWeight: FontWeight.bold
                          )),
                          Padding(
                            padding: const EdgeInsets.only(bottom: 8.0),
                            child: Row(
                              children: [
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.only(right: 8.0),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [

                                        Text('Label 1', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                                        SizedBox(height: 4),
                                        Container(
                                          decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius: BorderRadius.circular(12),
                                            boxShadow: [
                                              BoxShadow(
                                                color: Colors.grey.withOpacity(0.5),
                                                spreadRadius: 1,
                                                blurRadius: 8,
                                                offset: Offset(0, 4),
                                              ),
                                            ],
                                          ),
                                          child: TextField(
                                            decoration: InputDecoration(
                                              border: InputBorder.none,
                                              contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                                              hintText: 'Field 1',
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.only(left: 8.0),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text('Label 2', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                                        SizedBox(height: 4),
                                        Container(
                                          decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius: BorderRadius.circular(12),
                                            boxShadow: [
                                              BoxShadow(
                                                color: Colors.grey.withOpacity(0.5),
                                                spreadRadius: 1,
                                                blurRadius: 8,
                                                offset: Offset(0, 4),
                                              ),
                                            ],
                                          ),
                                          child: TextField(
                                            decoration: InputDecoration(
                                              border: InputBorder.none,
                                              contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                                              hintText: 'Field 2',
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 20,),
                          Text('Accesories Price', style: GoogleFonts.josefinSans(
                              fontSize: 24,
                              fontWeight: FontWeight.bold)),
                          SizedBox(height: 20,),
                          Padding(
                            padding: const EdgeInsets.only(bottom: 8.0),
                            child: Row(
                              children: [
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.only(right: 8.0),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [

                                        Text('Label 3', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),

                                        SizedBox(height: 4),
                                        Container(
                                          decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius: BorderRadius.circular(12),
                                            boxShadow: [
                                              BoxShadow(
                                                color: Colors.grey.withOpacity(0.5),
                                                spreadRadius: 1,
                                                blurRadius: 8,
                                                offset: Offset(0, 4),
                                              ),
                                            ],
                                          ),
                                          child: TextField(
                                            decoration: InputDecoration(
                                              border: InputBorder.none,
                                              contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                                              hintText: 'Field 3',
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.only(left: 8.0),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text('Label 4', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                                        SizedBox(height: 4),
                                        Container(
                                          decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius: BorderRadius.circular(12),
                                            boxShadow: [
                                              BoxShadow(
                                                color: Colors.grey.withOpacity(0.5),
                                                spreadRadius: 1,
                                                blurRadius: 8,
                                                offset: Offset(0, 4),
                                              ),
                                            ],
                                          ),
                                          child: TextField(
                                            decoration: InputDecoration(
                                              border: InputBorder.none,
                                              contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                                              hintText: 'Field 4',
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          // Row for TextFields 5 and 6
                          Padding(
                            padding: const EdgeInsets.only(bottom: 8.0),
                            child: Row(
                              children: [
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.only(right: 8.0),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text('Label 5', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                                        SizedBox(height: 4),
                                        Container(
                                          decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius: BorderRadius.circular(12),
                                            boxShadow: [
                                              BoxShadow(
                                                color: Colors.grey.withOpacity(0.5),
                                                spreadRadius: 1,
                                                blurRadius: 8,
                                                offset: Offset(0, 4),
                                              ),
                                            ],
                                          ),
                                          child: TextField(
                                            decoration: InputDecoration(
                                              border: InputBorder.none,
                                              contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                                              hintText: 'Field 5',
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.only(left: 8.0),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text('Label 6', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                                        SizedBox(height: 4),
                                        Container(
                                          decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius: BorderRadius.circular(12),
                                            boxShadow: [
                                              BoxShadow(
                                                color: Colors.grey.withOpacity(0.5),
                                                spreadRadius: 1,
                                                blurRadius: 8,
                                                offset: Offset(0, 4),
                                              ),
                                            ],
                                          ),
                                          child: TextField(
                                            decoration: InputDecoration(
                                              border: InputBorder.none,
                                              contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                                              hintText: 'Field 6',
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          // Row for TextFields 7 and 8
                          Padding(
                            padding: const EdgeInsets.only(bottom: 8.0),
                            child: Row(
                              children: [
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.only(right: 8.0),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text('Label 7', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                                        SizedBox(height: 4),
                                        Container(
                                          decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius: BorderRadius.circular(12),
                                            boxShadow: [
                                              BoxShadow(
                                                color: Colors.grey.withOpacity(0.5),
                                                spreadRadius: 1,
                                                blurRadius: 8,
                                                offset: Offset(0, 4),
                                              ),
                                            ],
                                          ),
                                          child: TextField(
                                            decoration: InputDecoration(
                                              border: InputBorder.none,
                                              contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                                              hintText: 'Field 7',
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.only(left: 8.0),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text('Label 8', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                                        SizedBox(height: 4),
                                        Container(
                                          decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius: BorderRadius.circular(12),
                                            boxShadow: [
                                              BoxShadow(
                                                color: Colors.grey.withOpacity(0.5),
                                                spreadRadius: 1,
                                                blurRadius: 8,
                                                offset: Offset(0, 4),
                                              ),
                                            ],
                                          ),
                                          child: TextField(
                                            decoration: InputDecoration(
                                              border: InputBorder.none,
                                              contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                                              hintText: 'Field 8',
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          // Row for TextFields 9 and 10
                          SizedBox(height: 20,),
                          Text('Description and guide', style: GoogleFonts.josefinSans(fontSize: 24, fontWeight: FontWeight.bold)),

                          Padding(
                            padding: const EdgeInsets.only(bottom: 8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Label 9', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                                SizedBox(height: 4),
                                Container(
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(12),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.grey.withOpacity(0.5),
                                        spreadRadius: 1,
                                        blurRadius: 8,
                                        offset: Offset(0, 4),
                                      ),
                                    ],
                                  ),
                                  child: TextField(
                                    minLines: 1,
                                    maxLines: null, // Makes the TextField grow as the user types
                                    decoration: InputDecoration(
                                      border: InputBorder.none,
                                      contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                                      hintText: 'Field 9',
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),

                          Padding(
                            padding: const EdgeInsets.only(bottom: 8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Label 10', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                                SizedBox(height: 4),
                                Container(
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(12),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.grey.withOpacity(0.5),
                                        spreadRadius: 1,
                                        blurRadius: 8,
                                        offset: Offset(0, 4),
                                      ),
                                    ],
                                  ),
                                  child: TextField(
                                    minLines: 1,
                                    maxLines: null, // Makes the TextField grow as the user types
                                    decoration: InputDecoration(
                                      border: InputBorder.none,
                                      contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                                      hintText: 'Field 10',
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),

                          Padding(
                            padding: const EdgeInsets.only(bottom: 8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Label 11', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                                SizedBox(height: 4),
                                Container(
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(12),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.grey.withOpacity(0.5),
                                        spreadRadius: 1,
                                        blurRadius: 8,
                                        offset: Offset(0, 4),
                                      ),
                                    ],
                                  ),
                                  child: TextField(
                                    minLines: 1,
                                    maxLines: null, // Makes the TextField grow as the user types
                                    decoration: InputDecoration(
                                      border: InputBorder.none,
                                      contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                                      hintText: 'Field 11',
                                    ),
                                  ),
                                ),
                                SizedBox(height: 20), // Space between Field 11 and the size selector

                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          if (_selectedSizes.contains("XS")) {
                                            _selectedSizes.remove("XS");
                                          } else {
                                            _selectedSizes.add("XS");
                                          }
                                        });
                                      },
                                      child: Container(
                                        height: 60,
                                        width: 80,
                                        padding: EdgeInsets.all(16),
                                        decoration: BoxDecoration(
                                          color: _selectedSizes.contains("XS") ? Colors.red : Colors.white,
                                          border: Border.all(
                                            color: _selectedSizes.contains("XS") ? Colors.red : Colors.black,
                                            width: 1,
                                          ),
                                        ),
                                        child: Center(
                                          child: Text(
                                            "XS",
                                            style: TextStyle(
                                              fontSize: 15,
                                              color: _selectedSizes.contains("XS") ? Colors.white : Colors.black,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(width: 10),
                                    GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          if (_selectedSizes.contains("S")) {
                                            _selectedSizes.remove("S");
                                          } else {
                                            _selectedSizes.add("S");
                                          }
                                        });
                                      },
                                      child: Container(
                                        height: 60,
                                        width: 90,
                                        padding: EdgeInsets.all(16),
                                        decoration: BoxDecoration(
                                          color: _selectedSizes.contains("S") ? Colors.red : Colors.white,
                                          border: Border.all(
                                            color: _selectedSizes.contains("S") ? Colors.red : Colors.black,
                                            width: 1,
                                          ),
                                        ),
                                        child: Center(
                                          child: Text(
                                            "S",
                                            style: TextStyle(
                                              fontSize: 15,
                                              color: _selectedSizes.contains("S") ? Colors.white : Colors.black,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(width: 10),
                                    GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          if (_selectedSizes.contains("M")) {
                                            _selectedSizes.remove("M");
                                          } else {
                                            _selectedSizes.add("M");
                                          }
                                        });
                                      },
                                      child: Container(
                                        height: 60,
                                        width: 80,
                                        padding: EdgeInsets.all(16),
                                        decoration: BoxDecoration(
                                          color: _selectedSizes.contains("M") ? Colors.red : Colors.white,
                                          border: Border.all(
                                            color: _selectedSizes.contains("M") ? Colors.red : Colors.black,
                                            width: 1,
                                          ),
                                        ),
                                        child: Center(
                                          child: Text(
                                            "M",
                                            style: TextStyle(
                                              fontSize: 15,
                                              color: _selectedSizes.contains("M") ? Colors.white : Colors.black,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(width: 10),
                                    GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          if (_selectedSizes.contains("L")) {
                                            _selectedSizes.remove("L");
                                          } else {
                                            _selectedSizes.add("L");
                                          }
                                        });
                                      },
                                      child: Container(
                                        height: 60,
                                        width: 80,
                                        padding: EdgeInsets.all(16),
                                        decoration: BoxDecoration(
                                          color: _selectedSizes.contains("L") ? Colors.red : Colors.white,
                                          border: Border.all(
                                            color: _selectedSizes.contains("L") ? Colors.red : Colors.black,
                                            width: 1,
                                          ),
                                        ),
                                        child: Center(
                                          child: Text(
                                            "L",
                                            style: TextStyle(
                                              fontSize: 15,
                                              color: _selectedSizes.contains("L") ? Colors.white : Colors.black,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(width: 10),
                                    GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          if (_selectedSizes.contains("XL")) {
                                            _selectedSizes.remove("XL");
                                          } else {
                                            _selectedSizes.add("XL");
                                          }
                                        });
                                      },
                                      child: Container(
                                        height: 60,
                                        width: 90,
                                        padding: EdgeInsets.all(16),
                                        decoration: BoxDecoration(
                                          color: _selectedSizes.contains("XL") ? Colors.red : Colors.white,
                                          border: Border.all(
                                            color: _selectedSizes.contains("XL") ? Colors.red : Colors.black,
                                            width: 1,
                                          ),
                                        ),
                                        child: Center(
                                          child: Text(
                                            "XL",
                                            style: TextStyle(
                                              fontSize: 15,
                                              color: _selectedSizes.contains("XL") ? Colors.white : Colors.black,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(width: 10),
                                    GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          if (_selectedSizes.contains("XXL")) {
                                            _selectedSizes.remove("XXL");
                                          } else {
                                            _selectedSizes.add("XXL");
                                          }
                                        });
                                      },
                                      child: Container(
                                        height: 60,
                                        width: 100,
                                        padding: EdgeInsets.all(16),
                                        decoration: BoxDecoration(
                                          color: _selectedSizes.contains("XXL") ? Colors.red : Colors.white,
                                          border: Border.all(
                                            color: _selectedSizes.contains("XXL") ? Colors.red : Colors.black,
                                            width: 1,
                                          ),
                                        ),
                                        child: Center(
                                          child: Text(
                                            "XXL",
                                            style: TextStyle(
                                              fontSize: 15,
                                              color: _selectedSizes.contains("XXL") ? Colors.white : Colors.black,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(width: 10),
                                    GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          if (_selectedSizes.contains("Free Size")) {
                                            _selectedSizes.remove("Free Size");
                                          } else {
                                            _selectedSizes.add("Free Size");
                                          }
                                        });
                                      },
                                      child: Container(
                                        height: 60,
                                        width: 100,
                                        padding: EdgeInsets.all(16),
                                        decoration: BoxDecoration(
                                          color: _selectedSizes.contains("Free Size") ? Colors.red : Colors.white,
                                          border: Border.all(
                                            color: _selectedSizes.contains("Free Size") ? Colors.red : Colors.black,
                                            width: 1,
                                          ),
                                        ),
                                        child: Center(
                                          child: Text(
                                            "Free Size",
                                            style: TextStyle(
                                              fontSize: 15,
                                              color: _selectedSizes.contains("Free Size") ? Colors.white : Colors.black,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                )

                              ],
                            ),
                          )






                        ],
                      ),
                    ),
                  ),
                ),
                Container(
                  color: Colors.white,
                  padding: EdgeInsets.all(16),
                  child: Align(
                    alignment: Alignment.center,
                    child: SizedBox(
                      width: 200,  // Set desired width
                      height: 50,  // Set desired height
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12), // Match with button corners for consistency
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5), // Shadow color
                              spreadRadius: 1, // Spread radius
                              blurRadius: 8, // Blur radius
                              offset: Offset(0, 4), // Shadow offset
                            ),
                          ],
                        ),
                        child: ElevatedButton(
                          onPressed: () {
                            // Add your onPressed code here!
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.blue,
                            elevation: 0, // Set to 0 to avoid double shadow
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(3),  // Set corner radius
                            ),
                          ),
                          child: Text(
                            'Done',
                            style: GoogleFonts.josefinSans(
                              fontSize: 20,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )







        ],
      ),
    );
  }
}

// Define separate widgets for each grid item
class GridItem1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 5,
            offset: Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.image,
            color: Colors.red[600],
            size: 40,
          ),
          SizedBox(height: 8),
          Text(
            'Item 1',
            style: TextStyle(color: Colors.red[600]),
          ),
        ],
      ),
    );
  }
}

class GridItem2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 5,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.image,
            color: Colors.pink[600],
            size: 40,
          ),
          SizedBox(height: 8),
          Text(
            'Item 2',
            style: TextStyle(color: Colors.pink[600]),
          ),
        ],
      ),
    );
  }
}

class GridItem3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 5,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.image,
            color: Colors.green[600],
            size: 40,
          ),
          SizedBox(height: 8),
          Text(
            'Item 3',
            style: TextStyle(color: Colors.green[600]),
          ),
        ],
      ),
    );
  }
}

class GridItem4 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 5,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.image,
            color: Colors.orange[600],
            size: 40,
          ),
          SizedBox(height: 8),
          Text(
            'Item 4',
            style: TextStyle(color: Colors.orange[600]),
          ),
        ],
      ),
    );
  }
}

class GridItem5 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 5,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.image,
            color: Colors.purple[600],
            size: 40,
          ),
          SizedBox(height: 8),
          Text(
            'Item 5',
            style: TextStyle(color: Colors.purple[600]),
          ),
        ],
      ),
    );
  }
}

class GridItem6 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 5,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.image,
            color: Colors.yellow[600],
            size: 40,
          ),
          SizedBox(height: 8),
          Text(
            'Item 6',
            style: TextStyle(color: Colors.yellow[600]),
          ),
        ],
      ),
    );
  }
}

class GridItem7 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 5,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.image,
            color: Colors.cyan[600],
            size: 40,
          ),
          SizedBox(height: 8),
          Text(
            'Item 7',
            style: TextStyle(color: Colors.cyan[600]),
          ),
        ],
      ),
    );
  }
}

class GridItem8 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 5,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.image,
            color: Colors.teal[600],
            size: 40,
          ),
          SizedBox(height: 8),
          Text(
            'Item 8',
            style: TextStyle(color: Colors.teal[600]),
          ),
        ],
      ),
    );
  }
}

class GridItem9 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 5,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.image,
            color: Colors.indigo[600],
            size: 40,
          ),
          SizedBox(height: 8),
          Text(
            'Item 9',
            style: TextStyle(color: Colors.indigo[600]),
          ),
        ],
      ),
    );
  }
}

class GridItem10 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 5,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.image,
            color: Colors.brown[600],
            size: 40,
          ),
          SizedBox(height: 8),
          Text(
            'Item 10',
            style: TextStyle(color: Colors.brown[600]),
          ),
        ],
      ),
    );
  }
}

class GridItem11 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 5,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.image,
            color: Colors.grey[600],
            size: 40,
          ),
          SizedBox(height: 8),
          Text(
            'Item 11',
            style: TextStyle(color: Colors.grey[600]),
          ),
        ],
      ),
    );
  }
}

class GridItem12 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 5,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.image,
            color: Colors.deepOrange[600],
            size: 40,
          ),
          SizedBox(height: 8),
          Text(
            'Item 12',
            style: TextStyle(color: Colors.deepOrange[600]),
          ),
        ],
      ),
    );
  }
}
