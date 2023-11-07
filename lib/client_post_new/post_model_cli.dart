// class Post {
//   final String userId;
//   final String image;
//   final String caption;

//   Post({
//     required this.userId,
//     required this.image,
//     required this.caption,
//   });
// }


class Post {
  final String userId;
  final String image;
  final String caption;
  final String userEmail; // Add this property

  Post({
    required this.userId,
    required this.image,
    required this.caption,
    required this.userEmail,
  });
}
