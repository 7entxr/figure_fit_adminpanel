import 'dart:typed_data';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:uuid/uuid.dart';

void main() {
  runApp(MaterialApp(
    home: ProductDetail(),
  ));
}

class ProductDetail extends StatefulWidget {
  @override
  _ProductDetailState createState() => _ProductDetailState();
}

class _ProductDetailState extends State<ProductDetail> {
  List<String> categories = [];
  String? selectedCategory;
  Set<String> _selectedSizes = {};
  List<TextEditingController> _fieldControllers = List.generate(17, (_) => TextEditingController());
  List<String?> _errorMessages = List.generate(17, (_) => null);

  String? categoryErrorMessage;
  String? sizeErrorMessage;

  List<Uint8List?> _productImages = List.generate(6, (_) => null);
  List<Uint8List?> _accessoriesImages = List.generate(6, (_) => null);

  List<String?> _imageUrls = List.generate(6, (_) => null);
  List<String?> _accImageUrls = List.generate(6, (_) => null);

  final ImagePicker _picker = ImagePicker();
  bool _isStarred = false;
  bool _isUploading = false;

  final List<String> availableSizes = ['S', 'M', 'L', 'XL', 'XXL', 'Free Size'];

  final TextEditingController _newCategoryController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _loadCategories();
  }

  Future<void> _loadCategories() async {
    try {
      final categoryCollection = FirebaseFirestore.instance.collection('Categories');
      final snapshot = await categoryCollection.get();
      final List<String> loadedCategories = snapshot.docs.map((doc) => doc.id).toList();

      setState(() {
        categories = loadedCategories;
      });
    } catch (e) {
      print('Error loading categories: $e');
    }
  }

  Future<void> _addCategory() async {
    String newCategory = _newCategoryController.text.trim();
    if (newCategory.isNotEmpty && !categories.contains(newCategory)) {
      try {
        final categoryRef = FirebaseFirestore.instance.collection('Categories').doc(newCategory);
        await categoryRef.set({});
        setState(() {
          categories.add(newCategory);
          _newCategoryController.clear();
        });
      } catch (e) {
        print('Error adding category: $e');
      }
    }
  }

  Future<void> _deleteCategory(String category) async {
    if (categories.length > 1 && categories.contains(category)) {
      try {
        final categoryRef = FirebaseFirestore.instance.collection('Categories').doc(category);
        await categoryRef.delete();
        setState(() {
          categories.remove(category);
          if (selectedCategory == category) {
            selectedCategory = null;
          }
        });
      } catch (e) {
        print('Error deleting category: $e');
      }
    }
  }

  Future<void> _pickImage(int index, bool isProductImage) async {
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      Uint8List imageData = await image.readAsBytes();
      setState(() {
        if (isProductImage && index >= 1 && index <= 6) {
          _productImages[index - 1] = imageData;
        } else if (!isProductImage && index >= 1 && index <= 6) {
          _accessoriesImages[index - 1] = imageData;
        }
      });
    }
  }

  Future<String?> _uploadImageToFirebase(Uint8List imageData, String path) async {
    try {
      final ref = FirebaseStorage.instance.ref().child(path);
      UploadTask uploadTask = ref.putData(imageData);
      final snapshot = await uploadTask;
      return await snapshot.ref.getDownloadURL();
    } catch (e) {
      print('Error uploading image: $e');
      return null;
    }
  }

  Future<void> _saveImages() async {
    final uuid = Uuid(); // Create an instance of Uuid

    for (int i = 0; i < _productImages.length; i++) {
      if (_productImages[i] != null) {
        final uniqueImageName = 'products/product_image_${uuid.v4()}.png';
        _imageUrls[i] = await _uploadImageToFirebase(
          _productImages[i]!,
          uniqueImageName,
        );
      }
    }

    for (int i = 0; i < _accessoriesImages.length; i++) {
      if (_accessoriesImages[i] != null) {
        final uniqueImageName = 'accessories/accessories_image_${uuid.v4()}.png';
        _accImageUrls[i] = await _uploadImageToFirebase(
          _accessoriesImages[i]!,
          uniqueImageName,
        );
      }
    }
  }

  Future<void> _saveProductToFirestore() async {
    bool hasError = false;

    if (selectedCategory == null) {
      setState(() {
        categoryErrorMessage = 'Please select a category';
      });
      hasError = true;
    } else {
      setState(() {
        categoryErrorMessage = null;
      });
    }

    if (_selectedSizes.isEmpty) {
      setState(() {
        sizeErrorMessage = 'Please select at least one size';
      });
      hasError = true;
    } else {
      setState(() {
        sizeErrorMessage = null;
      });
    }

    for (int i = 0; i < _fieldControllers.length; i++) {
      if (_fieldControllers[i].text.isEmpty) {
        setState(() {
          _errorMessages[i] = 'This field cannot be empty';
        });
        hasError = true;
      } else {
        setState(() {
          _errorMessages[i] = null;
        });
      }
    }

    if (!hasError) {
      setState(() {
        _isUploading = true;
      });

      try {
        await _saveImages();

        Map<String, dynamic> productData = {
          'category': selectedCategory,
          'sizes': _selectedSizes.toList(),
          'product_name': _fieldControllers[0].text,
          'product_price': _fieldControllers[1].text,
          'care_guide': _fieldControllers[15].text,
          'material': _fieldControllers[16].text,
          'product_description': _fieldControllers[14].text,
          for (int i = 0; i < _imageUrls.length; i++)
            'product_image_${i + 1}': _imageUrls[i],
          for (int i = 0; i < _accImageUrls.length; i++)
            'accessories_image_${i + 1}': _accImageUrls[i],
          'accessories_names': List.generate(6, (index) => _fieldControllers[index * 2 + 2].text),
          'accessories_prices': List.generate(6, (index) => _fieldControllers[index * 2 + 3].text),
          'isStarred': _isStarred,
        };

        await FirebaseFirestore.instance.collection('Products').add(productData);

        setState(() {
          _fieldControllers.forEach((controller) => controller.clear());
          selectedCategory = null;
          _selectedSizes.clear();
          _isStarred = false;
          _productImages = List.generate(6, (_) => null);
          _accessoriesImages = List.generate(6, (_) => null);
        });

        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Product saved successfully!')));
      } catch (e) {
        print('Error saving product: $e');
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Error saving product.')));
      } finally {
        setState(() {
          _isUploading = false;
        });
      }
    }
  }


  void _toggleSize(String size) {
    setState(() {
      if (_selectedSizes.contains(size)) {
        _selectedSizes.remove(size);
      } else {
        _selectedSizes.add(size);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Product Details'),
        backgroundColor: Colors.blueAccent,
        actions: [
          IconButton(
            icon: Icon(
              _isStarred ? Icons.star : Icons.star_border,
              color: _isStarred ? Colors.yellow : Colors.white,
            ),
            onPressed: () {
              setState(() {
                _isStarred = !_isStarred;
              });
            },
          ),
          IconButton(
            icon: Icon(Icons.save),
            onPressed: _saveProductToFirestore,
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildSectionTitle('Product Images'),
            SizedBox(height: 10),
            ImageGrid(images: _productImages, onImageTap: (index) => _pickImage(index + 1, true)),

            SizedBox(height: 20),

            _buildSectionTitle('Product Details'),
            SizedBox(height: 10),
            ProductForm(
              fieldControllers: _fieldControllers,
              errorMessages: _errorMessages,
              categoryErrorMessage: categoryErrorMessage,
              sizeErrorMessage: sizeErrorMessage,
              categories: categories,
              selectedCategory: selectedCategory,
              onCategoryChanged: (category) {
                setState(() {
                  selectedCategory = category;
                });
              },
              onSave: _saveProductToFirestore,
              toggleSize: _toggleSize,
              selectedSizes: _selectedSizes,
            ),

            SizedBox(height: 20),

            _buildSectionTitle('Accessories Images'),
            SizedBox(height: 10),
            ImageGrid(images: _accessoriesImages, onImageTap: (index) => _pickImage(index + 1, false)),

            SizedBox(height: 20),

            _buildSectionTitle('Accessories Details'),
            SizedBox(height: 10),
            AccessoriesForm(
              fieldControllers: _fieldControllers,
              errorMessages: _errorMessages,
            ),

            SizedBox(height: 20),

            _buildSectionTitle('Manage Categories'),
            SizedBox(height: 10),
            TextField(
              controller: _newCategoryController,
              decoration: InputDecoration(
                labelText: 'New Category',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: _addCategory,
              child: Text('Add Category'),
            ),
            SizedBox(height: 10),
            Wrap(
              spacing: 8.0,
              children: categories.map((category) {
                return Chip(
                  label: Text(category),
                  deleteIcon: Icon(Icons.close),
                  onDeleted: () => _deleteCategory(category),
                );
              }).toList(),
            ),

            SizedBox(height: 20),

            Center(
              child: _isUploading
                  ? CircularProgressIndicator()
                  : Container(
                decoration: BoxDecoration(
                  color: Colors.blueAccent,
                  borderRadius: BorderRadius.zero,
                ),
                child: TextButton(
                  onPressed: _saveProductToFirestore,
                  child: Text(
                    'Save Product',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  ),
                  style: TextButton.styleFrom(
                    padding: EdgeInsets.symmetric(horizontal: 80, vertical: 20),
                    backgroundColor: Colors.blueAccent,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Text(
      title,
      style: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}

class ProductForm extends StatelessWidget {
  final List<TextEditingController> fieldControllers;
  final List<String?> errorMessages;
  final String? categoryErrorMessage;
  final String? sizeErrorMessage;
  final List<String> categories;
  final String? selectedCategory;
  final void Function(String?) onCategoryChanged;
  final VoidCallback onSave;
  final void Function(String) toggleSize;
  final Set<String> selectedSizes;

  ProductForm({
    required this.fieldControllers,
    required this.errorMessages,
    required this.categoryErrorMessage,
    required this.sizeErrorMessage,
    required this.categories,
    required this.selectedCategory,
    required this.onCategoryChanged,
    required this.onSave,
    required this.toggleSize,
    required this.selectedSizes,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        DropdownButtonFormField<String>(
          hint: Text('Select Category'),
          value: selectedCategory,
          onChanged: onCategoryChanged,
          items: categories.map((category) {
            return DropdownMenuItem<String>(
              value: category,
              child: Text(category),
            );
          }).toList(),
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            errorText: categoryErrorMessage,
          ),
        ),
        SizedBox(height: 10),
        TextFormField(
          controller: fieldControllers[0],
          decoration: InputDecoration(
            labelText: 'Product Name',
            border: OutlineInputBorder(),
            errorText: errorMessages[0],
          ),
        ),
        SizedBox(height: 10),
        TextFormField(
          controller: fieldControllers[1],
          decoration: InputDecoration(
            labelText: 'Product Price (INR)',
            border: OutlineInputBorder(),
            errorText: errorMessages[1],
          ),
          keyboardType: TextInputType.number,
        ),
        SizedBox(height: 10),
        TextFormField(
          controller: fieldControllers[14],
          decoration: InputDecoration(
            labelText: 'Product Description',
            border: OutlineInputBorder(),
            errorText: errorMessages[14],
          ),
        ),
        SizedBox(height: 10),
        TextFormField(
          controller: fieldControllers[15],
          decoration: InputDecoration(
            labelText: 'Care Guide',
            border: OutlineInputBorder(),
            errorText: errorMessages[15],
          ),
        ),
        SizedBox(height: 10),
        TextFormField(
          controller: fieldControllers[16],
          decoration: InputDecoration(
            labelText: 'Material',
            border: OutlineInputBorder(),
            errorText: errorMessages[16],
          ),
        ),
        SizedBox(height: 20),
        Wrap(
          spacing: 8.0,
          children: ['S', 'M', 'L', 'XL', 'XXL', 'Free Size'].map((size) {
            return FilterChip(
              label: Text(size),
              selected: selectedSizes.contains(size),
              onSelected: (selected) => toggleSize(size),
            );
          }).toList(),
        ),
        if (sizeErrorMessage != null)
          Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: Text(sizeErrorMessage!, style: TextStyle(color: Colors.red)),
          ),
        SizedBox(height: 20),
      ],
    );
  }
}

class AccessoriesForm extends StatelessWidget {
  final List<TextEditingController> fieldControllers;
  final List<String?> errorMessages;

  AccessoriesForm({
    required this.fieldControllers,
    required this.errorMessages,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: List.generate(6, (index) {
        return Padding(
          padding: const EdgeInsets.only(bottom: 20.0),
          child: Row(
            children: [
              Expanded(
                flex: 2,
                child: TextFormField(
                  controller: fieldControllers[index * 2 + 2],
                  decoration: InputDecoration(
                    labelText: 'Accessory ${index + 1} Name',
                    border: OutlineInputBorder(),
                    errorText: errorMessages[index * 2 + 2],
                  ),
                ),
              ),
              SizedBox(width: 10),
              Expanded(
                flex: 1,
                child: TextFormField(
                  controller: fieldControllers[index * 2 + 3],
                  decoration: InputDecoration(
                    labelText: 'Price (INR)',
                    border: OutlineInputBorder(),
                    errorText: errorMessages[index * 2 + 3],
                  ),
                  keyboardType: TextInputType.number,
                  inputFormatters: <TextInputFormatter>[
                    FilteringTextInputFormatter.digitsOnly,
                  ],
                ),
              ),
            ],
          ),
        );
      }),
    );
  }
}

class ImageGrid extends StatelessWidget {
  final List<Uint8List?> images;
  final void Function(int) onImageTap;

  ImageGrid({
    required this.images,
    required this.onImageTap,
  });

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: 8.0,
        mainAxisSpacing: 8.0,
      ),
      itemCount: images.length,
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () => onImageTap(index),
          child: Container(
            color: Colors.grey[200],
            child: images[index] != null
                ? Image.memory(images[index]!, fit: BoxFit.cover)
                : Icon(Icons.add_a_photo, color: Colors.grey),
          ),
        );
      },
    );
  }
}
