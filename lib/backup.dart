// import 'package:flutter/material.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
//
// class UserProfileScreen extends StatefulWidget {
//   const UserProfileScreen({super.key});
//
//   @override
//   State<UserProfileScreen> createState() => _UserProfileState();
// }
//
// class _UserProfileState extends State<UserProfileScreen> {
//   final CollectionReference _collectionRef = FirebaseFirestore.instance.collection('Customer Data');
//
//   List<String> userNames = [];
//   String errorMessage = '';
//
//   @override
//   void initState() {
//     super.initState();
//     fetchUserNames();
//   }
//
//   void fetchUserNames() async {
//     try {
//       QuerySnapshot querySnapshot = await _collectionRef.get();
//       final List<QueryDocumentSnapshot> docs = querySnapshot.docs;
//
//       if (docs.isNotEmpty) {
//         setState(() {
//           userNames = docs.map((doc) => doc['User Name'] as String).toList();
//         });
//       } else {
//         setState(() {
//           errorMessage = 'No users found in the database.';
//         });
//       }
//     } catch (e) {
//       setState(() {
//         errorMessage = 'Error fetching user names: $e';
//       });
//       print('Error fetching user names: $e');
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Users'),
//       ),
//       body: errorMessage.isNotEmpty
//           ? Center(child: Text(errorMessage))
//           : userNames.isEmpty
//           ? Center(child: CircularProgressIndicator())
//           : ListView.builder(
//         itemCount: userNames.length,
//         itemBuilder: (context, index) {
//           return ListTile(
//             title: Text(userNames[index]),
//           );
//         },
//       ),
//     );
//   }
// }
