import 'package:flutter/material.dart';
import 'package:project2b/Button%20n%20Bar/popup.dart';
import 'package:project2b/Screen/developer.dart';

class SearchScreen extends StatefulWidget {
  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  TextEditingController _controller = TextEditingController();
  List<String> _searchResults = [];

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Background Image
        Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/EMG2.0.jpg'),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Scaffold(
          appBar: AppBar(
            title: Text('SEARCH', style: TextStyle(color: Colors.white)),
            flexibleSpace: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Color.fromARGB(255, 125, 10, 10),
                    Color.fromARGB(255, 0, 0, 0),
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
            ),
            actions: [
              IconButton(
                icon: Icon(Icons.exit_to_app,
                    color: Colors.white, size: 35), // Changed color to white
                onPressed: () {
                  exitPopup(context);
                },
              ),
              IconButton(
                icon: Icon(Icons.people,
                    color: Colors.white, size: 35), // Changed color to white
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return DevScreen(); // Navigate to Dev screen
                  }));
                },
              ),
            ],
          ),
          body: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(20),
                child: TextField(
                  controller: _controller,
                  decoration: InputDecoration(
                    hintText: 'Enter search',
                    suffixIcon: IconButton(
                      icon: Icon(Icons.search),
                      onPressed: () {
                        _search();
                      },
                    ),
                  ),
                ),
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: _searchResults.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(_searchResults[index]),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  void _search() {
    // Implement your search logic here, e.g., fetching data from an API
    // For demo, adding mock data
    setState(() {
      _searchResults = List.generate(
        10,
        (index) => 'Result ${_controller.text} - ${index + 1}',
      );
    });
  }
}
