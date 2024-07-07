import 'package:flutter/material.dart';

class AddItem extends StatefulWidget {
  const AddItem({super.key});

  @override
  _AddItemState createState() => _AddItemState();
}

// class AddItem extends StatelessWidget {
class _AddItemState extends State<AddItem> {
  String _selectedOption = '';
  Color _selectedColor = Colors.transparent;

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
    // Calculate the brightness of the color
    return color.computeLuminance() < 0.5;
  }

  Widget _buildOption(String option) {
    return GestureDetector(
      onTap: () => _handleOptionChange(option),
      child: Container(
        decoration: BoxDecoration(
          color: _selectedOption == option ? Colors.blue : const Color(0xFF8451D7),
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
      body: Center(
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 10),
            Container(
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
                    child: const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 8.0),
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: 'i.e. white sweater',
                          hintStyle: TextStyle(color: Color(0xFFE3CEFF)),
                          border: InputBorder.none,
                        ),
                        style: TextStyle(color: Colors.black),
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
                              Colors.blue,
                              Colors.red,
                              Colors.yellow,
                              Colors.orange,
                              Colors.pink,
                              Colors.purple
                            ]),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: _buildColorCircles([
                              Colors.green,
                              Colors.indigo.shade900,
                              Colors.grey,
                              Colors.black,
                              Colors.brown,
                              Colors.white, //aggiungere bordon con spunta nera
                            ]),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: SizedBox(
                      width: double.infinity, // Set the desired width
                      height: 50, // Set the desired height
                      child: ElevatedButton.icon(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => const AddItem()),
                          );
                        },
                        icon: const Icon(Icons.add),
                        label: const Text(
                          'Add Item',
                          style: TextStyle(fontSize: 18),
                        ),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color.fromRGBO(58, 0, 207, 1),
                          foregroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.circular(8.0), // Set border radius
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
