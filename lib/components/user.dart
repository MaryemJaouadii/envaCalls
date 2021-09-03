class User{

  final String imagePath;
  final String username;
  final String email;
  final String about;
  final bool isDarkMode;


const User ({
    this.imagePath,
   this.username,
  this.email,
   this.about,
   this.isDarkMode,
});


  User copy({
    String imagePath,
    String username,
    String email,
    String about,
    bool isDarkMode,
  }) =>
      User(
        imagePath: imagePath ?? this.imagePath,
        username: username ?? this.username,
        email: email ?? this.email,
        about: about ?? this.about,
        isDarkMode: isDarkMode ?? this.isDarkMode,
      );



static User fromJson (Map<String, dynamic> json) => User(
  imagePath: json['imagePath'],
  username : json['username'],
  email: json['email'],
  about: json['about'],
  isDarkMode: json['isDarkMode'],
);
  
  

  Map<String , dynamic> toJson() => {

    'imagePath': imagePath,
    'username' : username,
    'email' : email,
    'about': about,
    'isDarkMode': isDarkMode,
  };



  











}