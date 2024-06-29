

// class Message {
//   final String username;
// //  final String content;
//   final String content;
//   final String date;
//   final String backgroundImage; // Add this line

//   Message({
//     required this.username,
//     required this.content,
//     required this.date,
//     required this.backgroundImage, // Add this line
//   });
// }


// // class Message {
// //   final String username;
// //   final String content;
// //   final String date;
// //   final String backgroundImage;
// //   final bool isEmployer;

// //   Message({
// //     required this.username,
// //     required this.content,
// //     required this.date,
// //     required this.backgroundImage,
// //     required this.isEmployer,
// //   });
// // }


class Message {
  final String username;
  final String content;
  final DateTime date;
  final String backgroundImage;
  final bool isSentByUser; // Add this line

  Message({
    required this.username,
    required this.content,
    required this.date,
    required this.backgroundImage,
    this.isSentByUser = false, // Default value set to false
  });
}