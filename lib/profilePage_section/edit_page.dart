import 'package:flutter/material.dart';

class EditPage extends StatefulWidget {
  const EditPage({super.key});

  @override
  State<EditPage> createState() => _EditPageState();
}

class _EditPageState extends State<EditPage> {
  TextEditingController nameController = TextEditingController();

  late bool selectedAvatar = false;
  var selectedProfile;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: TextButton.icon(
          onPressed: () {
            Navigator.pop(context);
          },
          label: Text(
            'Back',
            style: TextStyle(
              color: Colors.orange,
            ),
          ),
          icon: Icon(Icons.arrow_back, color: Colors.orange),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'Edit Profile',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Card(
                  color: Colors.orange,
                  child: Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Icon(
                      Icons.edit,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 30),
            Stack(
              clipBehavior: Clip.none,
              children: [
                CircleAvatar(
                  backgroundColor: Colors.grey,
                  radius: 57,
                  child: CircleAvatar(
                    backgroundImage: AssetImage('images/profile.jpg'),
                    radius: 50,
                  ),
                ),
                Positioned(
                  bottom: -5,
                  right: 0,
                  child: IconButton(
                    onPressed: () {
                      showWideAvatarSelectionDialog(context);
                    },
                    icon: Icon(Icons.edit),
                    style: IconButton.styleFrom(
                      backgroundColor: Colors.grey,
                      foregroundColor: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 30),

            // Name
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 26),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Name',
                    style: TextStyle(color: Colors.grey),
                  ),
                  TextField(
                    controller: nameController,
                    decoration: InputDecoration(
                      hintText: 'Zyro Glitch',
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.orange,
                        ),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.orange,
                          width: 3,
                        ),
                      ),
                    ),
                  ),

                  // Email
                  SizedBox(height: 16),
                  Text(
                    'Email',
                    style: TextStyle(color: Colors.grey),
                  ),
                  TextField(
                    controller: nameController,
                    decoration: InputDecoration(
                      hintText: 'zyro@gmail.com',
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.orange,
                        ),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.orange,
                          width: 3,
                        ),
                      ),
                    ),
                  ),

                  // Save Button
                  SizedBox(height: 30),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          fixedSize: Size(180, 35),
                          backgroundColor: Colors.orange,
                          foregroundColor: Colors.white,
                        ),
                        child: Text('Save'),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void showWideAvatarSelectionDialog(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (BuildContext context, StateSetter setState) {
            return AlertDialog(
              backgroundColor: Colors.white,
              title: Center(child: Text('Select Profile Avatar')),
              titleTextStyle: TextStyle(
                color: Colors.black,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
              content: SizedBox(
                width: MediaQuery.of(context).size.width *
                    0.8, // 80% of screen width
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    // First row of avatars
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        _buildAvatar(
                          context,
                          asset: 'images/profile.jpg',
                          profileId: 1,
                          setState: setState,
                        ),
                        _buildAvatar(
                          context,
                          asset: 'images/profile.jpg',
                          profileId: 2,
                          setState: setState,
                        ),
                        _buildAvatar(
                          context,
                          asset: 'images/profile.jpg',
                          profileId: 3,
                          setState: setState,
                        ),
                      ],
                    ),
                    SizedBox(height: 20),
                    // Second row of avatars
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        _buildAvatar(
                          context,
                          asset: 'images/profile.jpg',
                          profileId: 4,
                          setState: setState,
                        ),
                        _buildAvatar(
                          context,
                          asset: 'images/profile.jpg',
                          profileId: 5,
                          setState: setState,
                        ),
                        _buildAvatar(
                          context,
                          asset: 'images/profile.jpg',
                          profileId: 6,
                          setState: setState,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              actions: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Expanded(
                      child: TextButton(
                        style: TextButton.styleFrom(
                          backgroundColor: Colors.orange,
                          foregroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: Text('CANCEL'),
                      ),
                    ),
                    SizedBox(width: 20),
                    Expanded(
                      child: TextButton(
                        style: TextButton.styleFrom(
                          backgroundColor: Colors.orange,
                          foregroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        onPressed: () {},
                        child: Text('SAVE'),
                      ),
                    ),
                  ],
                ),
              ],
            );
          },
        );
      },
    );
  }

  Widget _buildAvatar(
    BuildContext context, {
    required String asset,
    required int profileId,
    required StateSetter setState,
  }) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedProfile = profileId;
        });
      },
      child: CircleAvatar(
        backgroundColor:
            selectedProfile == profileId ? Colors.orange : Colors.white,
        radius: 45,
        child: CircleAvatar(
          backgroundImage: AssetImage(asset),
          radius: 40,
        ),
      ),
    );
  }
}
