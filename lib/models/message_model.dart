// class Message {
//  final String username;
//  final String content;
//  final String date;

//  Message({required this.username, required this.content, required this.date});
// }



class Message {
 final String username;
 final String content;
 final String date;
 final String profilePicUrl; // Add this line

 Message({
    required this.username,
    required this.content,
    required this.date,
    required this.profilePicUrl, // Add this line
 });
}