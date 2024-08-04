import 'package:flutter/material.dart';
//import 'package:bluejobs_user/styles/custom_theme.dart'; // Ensure this import is correct
import 'package:bluejobs_user/styles/textstyle.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {

  List<Map<String, dynamic>> users = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 7, 30, 47),
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.of(context).pop(),
        ),
        //title: Text('Search', style: CustomTextStyle.semiBoldText),
      ),
        body: Padding(
    padding: EdgeInsets.all(10),
    child: Column(
      children: [
        Row(
          children: [
            Expanded(
              child: TextFormField(
                decoration: InputDecoration(
                  hintText: 'Search...',
                  hintStyle: CustomTextStyle.regularText,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: const BorderSide(width: 2, color: Colors.white),
                  ),
                ),
                style: CustomTextStyle.regularText,

      
              ),
            ),
            SizedBox(width: 10),
            
            Container(
                            height: 53,
                            width: 70,
                            decoration: BoxDecoration(
                              color: const Color.fromARGB(255, 243, 107, 4),
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: InkWell(
                              onTap: () {
                                // Add logic for posting the comment
                              },
                              child: const Center(
                                child: Text(
                                  'Search',
                                  style: CustomTextStyle.semiBoldText,
                                  // .copyWith(
                                  //   color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
          ],
        ),
        Expanded(
          child: ListView.builder(
            itemCount: users.length,
            itemBuilder: (context, index) {
              return ListTile(
                leading: CircleAvatar(
                  backgroundImage: users[index]['profilePic'].startsWith('http')
                      ? NetworkImage(users[index]['profilePic'])
                      : AssetImage(users[index]['profilePic']) as ImageProvider,
                ),
                title: Text(users[index]['username'], style: CustomTextStyle.regularText,),
              );
            },
          ),
        ),
      ],
    ),
  ),
);
   
  }
}