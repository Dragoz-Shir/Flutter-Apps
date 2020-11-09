import 'package:flutter/material.dart';

class AvatarPage extends StatelessWidget {
  const AvatarPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Avatar Page"),
        centerTitle: true,
        actions: [
          Container(
            padding: EdgeInsets.only(right: 10.0),
            child: CircleAvatar(
              radius: 22.0,
              backgroundImage: NetworkImage(
                  "https://cutewallpaper.org/21/itachi-profile-pic/Uchiha-itachi-Forum-Avatar-Profile-Photo-ID-121995-.jpg"),
            ),
          ),
          Container(
            padding: EdgeInsets.only(right: 10.0),
            child: CircleAvatar(
              child: Text("IU"),
              backgroundColor: Colors.red,
            ),
          ),
        ],
      ),
      body: Center(
        child: FadeInImage(
            placeholder: AssetImage("assets/jar-loading.gif"),
            image: NetworkImage(
                "https://static.zerochan.net/Uchiha.Itachi.full.71685.jpg")),
      ),
    );
  }
}
