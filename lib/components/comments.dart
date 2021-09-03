// usermanagemet :

/*     StreamBuilder <QuerySnapshot> (
              stream: _firestore.collection('Users').snapshots(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  final users = snapshot.data.documents;
                  List<Text> usersWidgets = [];
                  for (var user in users) {
                    final userData = user.data["email"];
                  }
                }
              },
            ),
*/

/*StreamBuilder<QuerySnapshot>(
            stream: _firestore.collection('Users').snapshots(),
            builder:
                (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
              if (snapshot.hasError) {
                return Text('Something went wrong');
              }

              if (snapshot.connectionState == ConnectionState.waiting) {
                return Text("Loading");
              }

              if (snapshot.hasData) {
                final users = snapshot.data!.docs;
                List<Text> usersWidgets = [];
                for (var us in users) {
                  final userEmail = us.data();
                  final usersWidget = Text('$userEmail');


                  usersWidgets.add(usersWidget);
                }

                return Column(
                  children: usersWidgets,
                );
              }
              throw (e) {};
            }),
*/






/*       StreamBuilder<QuerySnapshot>(
          stream: _firestore.collection('Users').snapshots(),
          builder:
              (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (snapshot.hasError) {
              return Text('Something went wrong');
            }

            if (snapshot.connectionState == ConnectionState.waiting) {
              return Text("Loading");
            }

            return ListView(
              children: snapshot.data!.docs.map((DocumentSnapshot document) {
                Map<String, dynamic> data =
                document.data()! as Map<String, dynamic>;
                return Column(

                  children: [
                    Text(data["username"]),
                  ],

                );
              }).toList(),
            );
          },
        ),
*/










/* StreamBuilder(
          stream: FirebaseFirestore.instance.collection('Users').snapshots(),
          builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
            return ListView(
              children: snapshot.data!.docs.map((user) {
             return Center(
                child: ListTile(
                  title: Text(user['email']),
                ),
              );
            }).toList(),
            );
          },
        ),*/
/*
        StreamBuilder<QuerySnapshot>(
          stream: _firestore.collection('Users').snapshots(),
          builder:
              (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (snapshot.hasError) {
              return Text('Something went wrong');
            }

            if (snapshot.connectionState == ConnectionState.waiting) {
              return Text("Loading");
            }

            return ListView(
              children: snapshot.data!.docs.map((DocumentSnapshot document) {
                Map<String, dynamic> data =
                    document.data()! as Map<String, dynamic>;
                return ListTile(
                  title: Text(data["email"]),
                  //subtitle: Text(data["username"]),
                );
              }).toList(),
            );
          },
        ),*/