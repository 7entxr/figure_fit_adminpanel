import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class UserDetailScreen extends StatelessWidget {
  final Map<String, dynamic> userData;

  UserDetailScreen({required this.userData});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('User Details'),
        backgroundColor: Colors.blueAccent,
      ),
      body: Row(
        children: [
          Expanded(
            flex: 1, // 1/2 of the screen width
            child: Container(
              color: Colors.white, // Background color for the detail section
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      if (userData['Profile Image'] != null && userData['Profile Image'].isNotEmpty)
                        Center(
                          child: CircleAvatar(
                            radius: 60,
                            backgroundImage: NetworkImage(userData['Profile Image']),
                          ),
                        ),
                      SizedBox(height: 20),
                      _buildUserInfoCard('Name', userData['User Name'] ?? 'N/A'),
                      _buildUserInfoCard('Phone Number', userData['Phone Number'] ?? 'N/A'),
                      _buildUserInfoCard('Phone Number 1',
                          userData['Phone Number 1'] ?? 'Not Available'),
                      _buildUserInfoCard('Phone Number 2',
                          userData['Phone Number 2'] ?? 'Not Available'),
                      _buildUserInfoCard('Phone Number 3',
                          userData['Phone Number 3'] ?? 'Not Available'),
                      _buildUserInfoCard(
                          'Optional Phone Number',
                          (userData['Optional Phone Number'] != null &&
                              userData['Optional Phone Number'].isNotEmpty)
                              ? userData['Optional Phone Number']
                              : 'No number available'),
                      _buildUserInfoCard('Email Address', userData['Email Address'] ?? 'N/A'),
                      _buildUserInfoCard('Email Address 1',
                          userData['Email Address 1'] ?? 'Not Available'),
                      _buildUserInfoCard('Email Address 2',
                          userData['Email Address 2'] ?? 'Not Available'),
                      _buildUserInfoCard('Email Address 3',
                          userData['Email Address 3'] ?? 'Not Available'),
                      _buildUserInfoCard(
                          'Joining Date',
                          userData['Timing of giving order'] != null
                              ? DateFormat('yyyy-MM-dd')
                              .format(userData['Timing of giving order'].toDate())
                              : 'N/A'),
                      _buildUserInfoCard('Address Line 1', userData['Address Line 1'] ?? 'N/A'),
                      _buildUserInfoCard('Address Line 2', userData['Address Line 2'] ?? 'N/A'),
                      _buildUserInfoCard('Landmark', userData['Landmark'] ?? 'N/A'),
                      _buildUserInfoCard('Pin Code', userData['Pin Code'] ?? 'N/A'),
                      _buildUserInfoCard('State', userData['State'] ?? 'N/A'),
                    ],
                  ),
                ),
              ),
            ),
          ),
          VerticalDivider(
            width: 1, // Width of the divider
            color: Colors.grey, // Color of the divider
          ),
          Expanded(
            flex: 2, // 2/3 of the screen width
            child: Container(
              color: Colors.grey[200], // Background color for the empty section
              child: Center(
                child: Text(
                  'Additional Content or Blank Area',
                  style: TextStyle(fontSize: 18, color: Colors.black54),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildUserInfoCard(String title, String value) {
    return Card(
      elevation: 3,
      margin: const EdgeInsets.symmetric(vertical: 10),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '$title: ',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.blueAccent,
              ),
            ),
            Expanded(
              child: Text(
                value,
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
