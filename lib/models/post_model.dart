class Post {
 final String title;
 final String author;

 Post({required this.title, required this.author});
}

// Static list of posts
List<Post> posts = [
 Post(title: 'Post 1', author: 'User 1'),
 Post(title: 'Post 2', author: 'User 2'),
 Post(title: 'Post 2', author: 'User 2'),
 Post(title: 'Post 2', author: 'User 3'),
 Post(title: 'Post 2', author: 'User 4'),
 // Add more posts as needed
];