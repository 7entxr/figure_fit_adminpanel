import 'dart:io';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';

class AllDetailScreen extends StatefulWidget {
  final String productId;

  AllDetailScreen({required this.productId});

  @override
  _AllDetailScreenState createState() => _AllDetailScreenState();
}

class _AllDetailScreenState extends State<AllDetailScreen> {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseStorage _storage = FirebaseStorage.instance;
  final ImagePicker _picker = ImagePicker();

  late TextEditingController _nameController;
  late TextEditingController _priceController;
  late TextEditingController _descriptionController;
  late TextEditingController _materialController;
  late TextEditingController _careGuideController;
  late TextEditingController _sizesController;

  List<String> _accessoryImageUrls = [];
  List<TextEditingController> _accessoryNameControllers = [];
  List<TextEditingController> _accessoryPriceControllers = [];

  @override
  void initState() {
    super.initState();
    _fetchProductDetails();
  }

  Future<void> _fetchProductDetails() async {
    final doc = await _firestore.collection('Products').doc(widget.productId).get();
    if (doc.exists) {
      final data = doc.data() as Map<String, dynamic>;

      _nameController = TextEditingController(text: data['product_name'] as String);
      _priceController = TextEditingController(text: (data['product_price'] as double).toString());
      _descriptionController = TextEditingController(text: data['product_description'] as String? ?? 'No description available');
      _materialController = TextEditingController(text: data['material'] as String? ?? 'Unknown');
      _careGuideController = TextEditingController(text: data['care_guide'] as String? ?? 'No care guide available');
      _sizesController = TextEditingController(text: (data['sizes'] as List<dynamic>).join(', '));

      final accessoryImages = [
        data['accessories_image_1'] as String? ?? '',
        data['accessories_image_2'] as String? ?? '',
        data['accessories_image_3'] as String? ?? '',
        data['accessories_image_4'] as String? ?? '',
        data['accessories_image_5'] as String? ?? '',
        data['accessories_image_6'] as String? ?? '',
      ];

      final accessoryNames = List<String>.from(data['accessories_names'] ?? []);
      final accessoryPrices = List<dynamic>.from(data['accessories_prices'] ?? []);

      _accessoryImageUrls = accessoryImages;
      _accessoryNameControllers = accessoryNames.map((name) => TextEditingController(text: name)).toList();
      _accessoryPriceControllers = accessoryPrices.map((price) => TextEditingController(text: price.toString())).toList();

      setState(() {});
    }
  }

  Future<void> _deleteProduct() async {
    try {
      // Delete images from Firebase Storage
      for (var i = 0; i < _accessoryImageUrls.length; i++) {
        if (_accessoryImageUrls[i].isNotEmpty) {
          final ref = _storage.refFromURL(_accessoryImageUrls[i]);
          await ref.delete();
        }
      }

      // Delete product from Firestore
      await _firestore.collection('Products').doc(widget.productId).delete();

      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Product deleted')));
      Navigator.pop(context); // Go back to previous screen
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Error: $e')));
    }
  }

  Future<void> _confirmDelete() async {
    final bool? confirm = await showDialog<bool>(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Confirm Deletion'),
          content: Text('Are you sure you want to delete this product?'),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(false),
              child: Text('Cancel'),
            ),
            TextButton(
              onPressed: () => Navigator.of(context).pop(true),
              child: Text('Delete'),
            ),
          ],
        );
      },
    );

    if (confirm == true) {
      await _deleteProduct();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Product Details'),
        backgroundColor: Colors.black,
        actions: [
          IconButton(
            icon: Icon(Icons.delete, color: Colors.red),
            onPressed: () => _confirmDelete(),
          ),
        ],
      ),
      backgroundColor: Colors.white,
      body: FutureBuilder<DocumentSnapshot>(
        future: _firestore.collection('Products').doc(widget.productId).get(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          }
          if (!snapshot.hasData || !snapshot.data!.exists) {
            return Center(child: Text('Product not found.'));
          }

          final data = snapshot.data!.data() as Map<String, dynamic>;
          final productName = data['product_name'] as String;
          final productPrice = data['product_price'];
          final productImage1 = data['product_image_1'] as String;
          final productImage2 = data['product_image_2'] as String?;
          final productImage3 = data['product_image_3'] as String?;
          final productImage4 = data['product_image_4'] as String?;
          final productImage5 = data['product_image_5'] as String?;
          final productImage6 = data['product_image_6'] as String?;
          final category = data['category'] as String? ?? 'Unknown';
          final productDescription = data['product_description'] as String? ?? 'No description available';
          final sizes = List<String>.from(data['sizes'] ?? []);
          final accessoriesImages = List<String>.from([
            data['accessories_image_1'] as String? ?? '',
            data['accessories_image_2'] as String? ?? '',
            data['accessories_image_3'] as String? ?? '',
            data['accessories_image_4'] as String? ?? '',
            data['accessories_image_5'] as String? ?? '',
            data['accessories_image_6'] as String? ?? '',
          ]);
          final accessoriesNames = List<String>.from(data['accessories_names'] ?? []);
          final accessoriesPrices = List<dynamic>.from(data['accessories_prices'] ?? []);

          // Convert productPrice to double if it's not already
          double price;
          if (productPrice is String) {
            price = double.tryParse(productPrice.replaceAll(',', '')) ?? 0.0;
          } else if (productPrice is int) {
            price = productPrice.toDouble();
          } else if (productPrice is double) {
            price = productPrice;
          } else {
            price = 0.0; // Default value
          }

          return SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Product Images
                  if (productImage1.isNotEmpty || productImage2 != null || productImage3 != null ||
                      productImage4 != null || productImage5 != null || productImage6 != null)
                    Container(
                      padding: const EdgeInsets.all(8.0),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.3),
                            spreadRadius: 1,
                            blurRadius: 6,
                            offset: Offset(0, 3), // changes position of shadow
                          ),
                        ],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Product Images',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Container(
                            height: 800, // Increased height
                            width: double.infinity, // Use full width
                            child: GridView.count(
                              crossAxisCount: 2,
                              crossAxisSpacing: 8,
                              mainAxisSpacing: 8,
                              childAspectRatio: 1.5, // Adjust aspect ratio to match new height
                              children: [
                                _buildImageContainer(productImage1),
                                if (productImage2 != null) _buildImageContainer(productImage2),
                                if (productImage3 != null) _buildImageContainer(productImage3),
                                if (productImage4 != null) _buildImageContainer(productImage4),
                                if (productImage5 != null) _buildImageContainer(productImage5),
                                if (productImage6 != null) _buildImageContainer(productImage6),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  const SizedBox(height: 16),

                  // Product Details
                  _buildDetailContainer(
                    title: 'Product Name',
                    content: productName,
                  ),
                  _buildDetailContainer(
                    title: 'Price',
                    content: '₹${price.toStringAsFixed(2)}',
                  ),
                  _buildDetailContainer(
                    title: 'Category',
                    content: category,
                  ),
                  _buildDetailContainer(
                    title: 'Description',
                    content: productDescription,
                  ),
                  _buildDetailContainer(
                    title: 'Material',
                    content: data['material'] as String? ?? 'Unknown',
                  ),
                  _buildDetailContainer(
                    title: 'Care Guide',
                    content: data['care_guide'] as String? ?? 'No care guide available',
                  ),
                  _buildDetailContainer(
                    title: 'Sizes',
                    content: sizes.join(', '),
                  ),
                  const SizedBox(height: 16),

                  // Accessory Images and Prices
                  if (_accessoryImageUrls.isNotEmpty)
                    Container(
                      padding: const EdgeInsets.all(8.0),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.3),
                            spreadRadius: 1,
                            blurRadius: 6,
                            offset: Offset(0, 3), // changes position of shadow
                          ),
                        ],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Accessory Images and Prices',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Container(
                            height: 600, // Increased height
                            width: double.infinity, // Use full width
                            child: GridView.builder(
                              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                crossAxisSpacing: 8,
                                mainAxisSpacing: 8,
                                childAspectRatio: 1.5, // Adjust aspect ratio to fit new height
                              ),
                              itemCount: _accessoryImageUrls.length,
                              itemBuilder: (context, index) {
                                final image = _accessoryImageUrls[index];
                                final name = _accessoryNameControllers.length > index ? _accessoryNameControllers[index].text : 'Unknown';
                                final price = _accessoryPriceControllers.length > index ? _accessoryPriceControllers[index].text : '0.0';

                                return _buildAccessoryItem(image, name, price);
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildDetailContainer({required String title, required String content}) {
    return Container(
      padding: const EdgeInsets.all(12.0),
      margin: const EdgeInsets.only(bottom: 16.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            spreadRadius: 1,
            blurRadius: 6,
            offset: Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            content,
            style: TextStyle(
              fontSize: 16,
              color: Colors.grey[700],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildImageContainer(String imageUrl) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        image: DecorationImage(
          image: NetworkImage(imageUrl),
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Widget _buildAccessoryItem(String imageUrl, String name, String price) {
    return Container(
      padding: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            spreadRadius: 1,
            blurRadius: 6,
            offset: Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.network(imageUrl, fit: BoxFit.cover),
            ),
          ),
          const SizedBox(height: 8),
          Text(
            name,
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            '₹${price.toString()}',
            style: TextStyle(
              fontSize: 16,
              color: Colors.grey[700],
            ),
          ),
        ],
      ),
    );
  }
}
