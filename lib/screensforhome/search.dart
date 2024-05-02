// import 'package:flutter/material.dart';


// class NotificationsPage extends StatefulWidget {
//   const NotificationsPage({super.key});

//   @override
//   State<NotificationsPage> createState() => _NotificationsPageState();
// }

// class _NotificationsPageState extends State<NotificationsPage> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(),
//       body: Column(

//       )
      

//     );
//   }
// }


import 'package:flutter/material.dart';

class SearchPage extends StatefulWidget {
 @override
 _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
 List<String> searchItems = [];
 TextEditingController searchController = TextEditingController();

 void addSearchItem(String item) {
    setState(() {
      searchItems.add(item);
    });
    searchController.clear();
 }

 void removeSearchItem(int index) {
    setState(() {
      searchItems.removeAt(index);
    });
 }

 @override
 Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Search Page'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: searchController,
              decoration: InputDecoration(
                labelText: 'Search',
                suffixIcon: IconButton(
                 icon: Icon(Icons.search),
                 onPressed: () => addSearchItem(searchController.text),
                ),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: searchItems.length,
              itemBuilder: (context, index) {
                return ListTile(
                 title: Text(searchItems[index]),
                 trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        icon: Icon(Icons.edit),
                        onPressed: () {
                          // Navigate to EditSearchPage
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => EditSearchPage(
                                //searchItem: searchItems[index],
                              ),
                            ),
                          );
                        },
                      ),
                      IconButton(
                        icon: Icon(Icons.close),
                        onPressed: () => removeSearchItem(index),
                      ),
                    ],
                 ),
                );
              },
            ),
          ),
        ],
      ),
    );
 }
}

class EditSearchPage extends StatefulWidget {
  const EditSearchPage({super.key});

  @override
  State<EditSearchPage> createState() => _EditSearchPageState();
}

class _EditSearchPageState extends State<EditSearchPage> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
