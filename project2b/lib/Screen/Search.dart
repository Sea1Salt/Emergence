import 'package:flutter/material.dart';

class SearchScreen extends StatefulWidget {
  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  TextEditingController _controller = TextEditingController();
  List<String> _searchResults = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Search'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: _controller,
              decoration: InputDecoration(
                hintText: 'Enter search query',
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
