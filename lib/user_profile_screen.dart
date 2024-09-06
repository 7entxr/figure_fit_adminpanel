import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:figure_fit_adminpanel/user_details.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class UserProfileScreen extends StatefulWidget {
  @override
  _UserProfileScreenState createState() => _UserProfileScreenState();
}

class _UserProfileScreenState extends State<UserProfileScreen> {
  TextEditingController _searchController = TextEditingController();
  String _searchQuery = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Users Profile',
              style: GoogleFonts.josefinSans(
                fontSize: 38,
                fontWeight: FontWeight.w600,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    decoration: BoxDecoration(
                      color: Color(0xFFF1F1F1),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: TextField(
                      controller: _searchController,
                      onChanged: (value) {
                        setState(() {
                          _searchQuery = value.toLowerCase();
                        });
                      },
                      decoration: InputDecoration(
                        hintText: 'Search...',
                        border: InputBorder.none,
                        icon: Icon(Icons.search, color: Colors.black54),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    color: Color(0xFFF1F1F1),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: IconButton(
                    icon: Icon(Icons.sort, color: Colors.black54),
                    onPressed: () {
                      // Add sorting functionality here
                    },
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                Expanded(child: Text('Profile Picture', style: _getTextStyle())),
                Expanded(child: Text('User Name', style: _getTextStyle())),
                Expanded(child: Text('Phone Number', style: _getTextStyle())),
                Expanded(child: Text('Email Address', style: _getTextStyle())),
                Expanded(child: Text('Joining Date', style: _getTextStyle())),
              ],
            ),
            const SizedBox(height: 10),
            Expanded(
              child: StreamBuilder<QuerySnapshot>(
                stream: FirebaseFirestore.instance.collection('Customer Data').snapshots(),
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    return Center(child: CircularProgressIndicator());
                  }

                  final users = snapshot.data!.docs;

                  // Filter users based on search query
                  final filteredUsers = users.where((user) {
                    final Map<String, dynamic> userData = user.data() as Map<String, dynamic>; // Cast the data to Map<String, dynamic>

                    final username = (userData['User Name'] ?? '').toLowerCase();
                    final phoneNumber = (userData['Phone Number'] ?? '').toLowerCase();
                    final phoneNumber1 = userData.containsKey('Phone Number 1')
                        ? (userData['Phone Number 1'] ?? '').toLowerCase()
                        : 'n/a';
                    final phoneNumber2 = userData.containsKey('Phone Number 2')
                        ? (userData['Phone Number 2'] ?? '').toLowerCase()
                        : 'n/a';
                    final phoneNumber3 = userData.containsKey('Phone Number 3')
                        ? (userData['Phone Number 3'] ?? '').toLowerCase()
                        : 'n/a';
                    final emailAddress = (userData['Email Address'] ?? '').toLowerCase();
                    final emailAddress1 = userData.containsKey('Email Address 1')
                        ? (userData['Email Address 1'] ?? '').toLowerCase()
                        : 'n/a';
                    final emailAddress2 = userData.containsKey('Email Address 2')
                        ? (userData['Email Address 2'] ?? '').toLowerCase()
                        : 'n/a';
                    final emailAddress3 = userData.containsKey('Email Address 3')
                        ? (userData['Email Address 3'] ?? '').toLowerCase()
                        : 'n/a';
                    final addressLine1 = (userData['Address Line 1'] ?? 'N/A').toLowerCase();
                    final addressLine2 = (userData['Address Line 2'] ?? 'N/A').toLowerCase();
                    final landmark = (userData['Landmark'] ?? 'N/A').toLowerCase();
                    final pinCode = (userData['Pin Code'] ?? 'N/A').toLowerCase();
                    final state = (userData['State'] ?? 'N/A').toLowerCase();

                    return username.contains(_searchQuery) ||
                        phoneNumber.contains(_searchQuery) ||
                        emailAddress.contains(_searchQuery) ||
                        phoneNumber1.contains(_searchQuery) ||
                        phoneNumber2.contains(_searchQuery) ||
                        phoneNumber3.contains(_searchQuery) ||
                        emailAddress1.contains(_searchQuery) ||
                        emailAddress2.contains(_searchQuery) ||
                        emailAddress3.contains(_searchQuery) ||
                        addressLine1.contains(_searchQuery) ||
                        addressLine2.contains(_searchQuery) ||
                        landmark.contains(_searchQuery) ||
                        pinCode.contains(_searchQuery) ||
                        state.contains(_searchQuery);
                  }).toList();

                  if (filteredUsers.isEmpty && _searchQuery.isNotEmpty) {
                    return Center(
                      child: Text(
                        'No user exists with "$_searchQuery"',
                        style: GoogleFonts.poppins(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: Colors.black,
                        ),
                      ),
                    );
                  }

                  return ListView.builder(
                    itemCount: filteredUsers.length,
                    itemBuilder: (context, index) {
                      final user = filteredUsers[index];
                      final Map<String, dynamic> userData = user.data() as Map<String, dynamic>; // Explicitly casting to Map
                      final String profileImageUrl = userData['Profile Image'] ?? '';
                      final String username = userData['User Name'] ?? 'Unknown';
                      final String firstLetter = username.isNotEmpty ? username[0].toUpperCase() : '';
                      final String phoneNumber = userData['Phone Number'] ?? 'N/A';
                      final String emailAddress = userData['Email Address'] ?? 'N/A';
                      final Timestamp? timestamp = userData['Timing of giving order'] as Timestamp?;
                      final String formattedDate = timestamp != null
                          ? DateFormat('yyyy-MM-dd').format(timestamp.toDate())
                          : 'N/A';


                      return Container(
                        margin: const EdgeInsets.only(bottom: 10), // Space between each container
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.black), // Black border
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Row(
                          children: [
                            Expanded(
                              child: profileImageUrl.isNotEmpty
                                  ? CircleAvatar(
                                backgroundImage: NetworkImage(profileImageUrl),
                                radius: 25,
                                onBackgroundImageError: (_, __) {
                                  // Display an error message or a placeholder in case of failure
                                  print('Error loading profile image');
                                },
                              )
                                  : CircleAvatar(
                                radius: 25,
                                backgroundColor: Colors.lightBlueAccent,
                                child: Text(
                                  firstLetter,
                                  style: GoogleFonts.poppins(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(width: 10),
                            Expanded(
                              child: Text(
                                username,
                                style: GoogleFonts.poppins(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                            const SizedBox(width: 10),
                            Expanded(
                              child: Text(
                                phoneNumber,
                                style: GoogleFonts.poppins(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                            const SizedBox(width: 10),
                            Expanded(
                              child: Text(
                                emailAddress,
                                style: GoogleFonts.poppins(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                            const SizedBox(width: 10),
                            Expanded(
                              child: Row(
                                children: [
                                  Text(
                                    formattedDate,
                                    style: GoogleFonts.poppins(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.black,
                                    ),
                                  ),
                                  const SizedBox(width: 30),
                                  GestureDetector(
                                    onTap: () {
                                      // Navigate to UserDetailScreen with user data
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => UserDetailScreen(
                                              userData: user.data() as Map<String, dynamic>),
                                        ),
                                      );
                                    },
                                    child: Container(
                                      padding: EdgeInsets.all(6),
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Colors.lightBlueAccent,
                                      ),
                                      child: Icon(
                                        Icons.arrow_forward, // Arrow icon next to the date
                                        color: Colors.white,
                                        size: 24,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Text style for headers
  TextStyle _getTextStyle() {
    return GoogleFonts.poppins(
      fontSize: 18,
      fontWeight: FontWeight.w600,
      color: Colors.black,
    );
  }

  // Truncate email if it exceeds a certain length
  String _truncateEmail(String email) {
    return email.length > 20 ? '${email.substring(0, 17)}...' : email;
  }
}
