import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:typed_data';
import 'package:decla/pages/success_page.dart';

class AddItem extends StatefulWidget {
  const AddItem({super.key});

  @override
  _AddItemState createState() => _AddItemState();
}

class _AddItemState extends State<AddItem> {
  String _selectedOption = '';
  Color _selectedColor = Colors.transparent;
  Uint8List? _imageBytes;
  final TextEditingController _titleController = TextEditingController();

  void _handleOptionChange(String value) {
    setState(() {
      _selectedOption = value;
    });
  }

  void _handleColorChange(Color color) {
    setState(() {
      _selectedColor = color;
    });
  }

  bool _isDarkColor(Color color) {
    return color.computeLuminance() < 0.5;
  }

  Future<void> _pickImage(ImageSource source) async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: source);

    if (pickedFile != null) {
      setState(() async {
        _imageBytes = await pickedFile.readAsBytes();
      });
    }
  }

  Future<void> _showImageSourceActionSheet(BuildContext context) async {
    showModalBottomSheet(
      context: context,
      builder: (context) => SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              leading: const Icon(Icons.camera_alt),
              title: const Text('Take a photo'),
              onTap: () {
                Navigator.pop(context);
                _pickImage(ImageSource.camera);
              },
            ),
            ListTile(
              leading: const Icon(Icons.photo_library),
              title: const Text('Choose from gallery'),
              onTap: () {
                Navigator.pop(context);
                _pickImage(ImageSource.gallery);
              },
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _uploadImage() async {
    if (_imageBytes == null) return;

    String fileName =
        'images/${_titleController.text}_${_selectedOption}_${_selectedColor.value}_${DateTime.now().millisecondsSinceEpoch}.jpg';

    try {
      // Upload image to Firebase Storage
      await FirebaseStorage.instance
          .ref(fileName)
          .putData(_imageBytes!, SettableMetadata(contentType: 'image/jpeg'));

      // Get the download URL
      String downloadURL =
          await FirebaseStorage.instance.ref(fileName).getDownloadURL();

      // Save the URL and metadata to Firestore
      await FirebaseFirestore.instance.collection('images').add({
        'title': _titleController.text,
        'category': _selectedOption,
        'color': _selectedColor.value.toString(),
        'url': downloadURL,
        'uploaded_at': DateTime.now(),
      });

      print('Upload successful');
    } catch (e) {
      print('Error uploading image: $e');
    }
  }

  void _saveItem() {
    String title = _titleController.text;
    String category = _selectedOption;
    Color color = _selectedColor;

    if (_imageBytes == null) {
      _showErrorSnackbar('Please select an image.');
      return;
    }

    if (title.isEmpty) {
      _showErrorSnackbar('Please enter a title.');
      return;
    }

    if (category.isEmpty) {
      _showErrorSnackbar('Please select a category.');
      return;
    }

    if (color == Colors.transparent) {
      _showErrorSnackbar('Please select a color.');
      return;
    }

    // Upload image and save item metadata
    _uploadImage();

    // For debugging
    print("_SaveItem");
    print('Title: $title');
    print('Category: $category');
    print('Color: $color');
    // print('Image Path: $_imageBytes');
    // Navigate to SuccessPage on successful upload
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const SuccessPage()),
    );
  }

  void _showErrorSnackbar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: Colors.red,
      ),
    );
  }

  Widget _buildOption(String option) {
    return GestureDetector(
      onTap: () => _handleOptionChange(option),
      child: Container(
        decoration: BoxDecoration(
          color:
              _selectedOption == option ? Colors.blue : const Color(0xFF8451D7),
          border: Border.all(
            color: Colors.white,
          ),
          borderRadius: BorderRadius.circular(30),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 2, vertical: 5),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Icon(
              _selectedOption == option
                  ? Icons.radio_button_checked
                  : Icons.radio_button_unchecked,
              color: Colors.white,
            ),
            const SizedBox(width: 5),
            Text(
              option,
              style: const TextStyle(color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildColorCircle(Color color) {
    return GestureDetector(
      onTap: () => _handleColorChange(color),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            decoration: BoxDecoration(
              color: color,
              shape: BoxShape.circle,
              border: Border.all(
                color: _selectedColor == color ? Colors.blue : Colors.black,
                width: 1,
              ),
            ),
            width: 30,
            height: 30,
          ),
          if (_selectedColor == color)
            Icon(
              Icons.check,
              color: _isDarkColor(color) ? Colors.white : Colors.black,
              size: 16,
            ),
        ],
      ),
    );
  }

  List<Widget> _buildColorCircles(List<Color> colors) {
    return colors.map((color) => _buildColorCircle(color)).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context); // Go back to the previous page
          },
        ),
        title: const Text('Upload Photo'),
        centerTitle: true,
      ),
      backgroundColor: const Color.fromRGBO(235, 235, 235, 1),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 10),
              GestureDetector(
                onTap: () => _showImageSourceActionSheet(context),
                child: Container(
                  width: 300,
                  height: 150,
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      colors: [
                        Color.fromRGBO(172, 124, 250, 1),
                        Color.fromRGBO(158, 118, 246, 1),
                        Color.fromRGBO(96, 55, 201, 1),
                      ],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                    ),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.camera_alt,
                        size: 50,
                        color: Colors.white,
                      ),
                      SizedBox(width: 10),
                      Text(
                        'Upload',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 20),
              const SizedBox(height: 20),
              SizedBox(
                width: 300,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Title',
                      style: TextStyle(
                        color: Color(0xFF8451D7),
                        fontSize: 18,
                        fontWeight: FontWeight.bold, // Make the title bold
                      ),
                    ),
                    const SizedBox(height: 20),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white, // Fill the square white
                        border: Border.all(color: const Color(0xFF8451D7)),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: TextField(
                          controller: _titleController,
                          decoration: const InputDecoration(
                            hintText: 'i.e. white sweater',
                            hintStyle: TextStyle(color: Color(0xFFE3CEFF)),
                            border: InputBorder.none,
                          ),
                          style: const TextStyle(color: Colors.black),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    const Text(
                      'Category',
                      style: TextStyle(
                        color: Color(0xFF8451D7),
                        fontSize: 18,
                        fontWeight: FontWeight.bold, // Make the title bold
                      ),
                    ),
                    const SizedBox(height: 10),
                    SizedBox(
                      width: 300,
                      child: Row(
                        children: [
                          Expanded(
                            child: Column(
                              children: [
                                _buildOption('Sweater'),
                                _buildOption('T-Shirt'),
                              ],
                            ),
                          ),
                          const VerticalDivider(
                            color: Colors.white,
                            thickness: 2,
                            width: 10,
                          ),
                          Expanded(
                            child: Column(
                              children: [
                                _buildOption('Trousers'),
                                _buildOption('Skirt'),
                              ],
                            ),
                          ),
                          const VerticalDivider(
                            color: Colors.white,
                            thickness: 2,
                            width: 10,
                          ),
                          Expanded(
                            child: Column(
                              children: [
                                _buildOption('Shoes'),
                                _buildOption('Sandals'),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 20),
                    const Text(
                      'Color',
                      style: TextStyle(
                        color: Color(0xFF8451D7),
                        fontSize: 18,
                        fontWeight: FontWeight.bold, // Make the title bold
                      ),
                    ),
                    const SizedBox(height: 10),
                    // Container(
                    //   width: 300,
                    //   height: 120,
                    //   decoration: BoxDecoration(
                    //     color: Colors.white,
                    //     // border: Border.all(color: Color(0xFF8451D7)),
                    //     borderRadius: BorderRadius.circular(8.0),
                    //   ),
                    //   child: Center(
                    //     child: SizedBox(
                    //       width: 300,
                    //       child: Wrap(
                    //         spacing: 10,
                    //         runSpacing: 10,
                    //         children: _buildColorCircles([
                    //           Colors.red,
                    //           Colors.green,
                    //           Colors.blue,
                    //           Colors.yellow,
                    //           Colors.orange,
                    //           Colors.purple,
                    //           Colors.black,
                    //           Colors.white,
                    //           Colors.brown,
                    //           Colors.pink,
                    //           Colors.cyan,
                    //           Colors.lime,
                    //           Colors.indigo,
                    //           Colors.grey,
                    //           Colors.teal,
                    //         ]),
                    //       ),
                    //     ),
                    //   ),
                    // ),
                    Container(
                      width: 300,
                      height: 120,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        // border: Border.all(color: Color(0xFF8451D7)),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: _buildColorCircles([
                                Colors.green,
                                Colors.blue,
                                Colors.yellow,
                                Colors.orange,
                                Colors.purple,
                                Colors.black,
                                Colors.white,
                              ]),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: _buildColorCircles([
                                Colors.brown,
                                Colors.pink,
                                Colors.cyan,
                                Colors.lime,
                                Colors.indigo,
                                Colors.grey,
                                Colors.teal,
                              ]),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    // Center(
                    //   child: ElevatedButton(
                    //     onPressed: _saveItem,
                    //     style: ElevatedButton.styleFrom(
                    //       backgroundColor: const Color(0xFF8451D7),
                    //       padding: const EdgeInsets.symmetric(
                    //         horizontal: 40,
                    //         vertical: 10,
                    //       ),
                    //       shape: RoundedRectangleBorder(
                    //         borderRadius: BorderRadius.circular(20),
                    //       ),
                    //     ),
                    //     child: const Text(
                    //       'Save',
                    //       style: TextStyle(fontSize: 20),
                    //     ),
                    //   ),
                    // ),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: SizedBox(
                        width: double.infinity, // Set the desired width
                        height: 50, // Set the desired height
                        child: ElevatedButton.icon(
                          onPressed: _saveItem,
                          icon: Icon(Icons.add),
                          label: Text(
                            'Add Item',
                            style: TextStyle(fontSize: 18),
                          ),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Color.fromRGBO(58, 0, 207, 1),
                            foregroundColor: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(
                                  8.0), // Set border radius
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
