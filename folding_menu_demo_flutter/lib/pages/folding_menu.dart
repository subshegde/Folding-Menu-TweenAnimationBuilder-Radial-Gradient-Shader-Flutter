import 'package:flutter/material.dart';
import 'package:folding_menu/folding_menu.dart';
import 'package:folding_menu_demo_flutter/pages/folding_menu_white.dart';
import 'package:folding_menu_demo_flutter/utils/helper.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool openMenu = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[800],
      appBar: AppBar(
        foregroundColor: Colors.grey[100],
        backgroundColor: Colors.black,
        title: const Text("W W E"),
        actions: [
          IconButton(
            icon: const Icon(Icons.menu),
            onPressed: () {
              setState(() {
                openMenu = !openMenu;
              });
            },
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.grey[900],
        onPressed: (){
          // Navigator.push(context, MaterialPageRoute(builder: (context) => FoldingMenuWhite()));
          Navigator.push(
            context, 
            PageRouteBuilder(
            pageBuilder: (context,animation,_){
            return FoldingMenuWhite();
          },
          opaque: false
          ));
        },
        child: Text('GO',style: TextStyle(color: Colors.grey[300]),),
        ),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Container(
              color: Colors.grey[800],
              padding: const EdgeInsets.all(5.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                
                  const SizedBox(height: 10),
                  GridView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: MediaQuery.of(context).size.width > 600 ? 4 : 2,
                      childAspectRatio: 1,
                    ),
                    itemCount: 6,
                    itemBuilder: (context, index) {
                      // String e = ['cm-punk', 'kali', 'rock', 'roman', 'undertaker', 'cm-punk'][index];
                      String e = ['cm-punk-nobg', 'kali-nobg', 'rock-nobg', 'roman-nobg', 'undertaker-nobg', 'cm-punk-nobg'][index];
                      return Card(
                        color: Colors.black,
                        margin: const EdgeInsets.all(1),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                          side: BorderSide(color: Colors.grey[600]!, width: 1),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            ClipRRect(
                              borderRadius: BorderRadius.circular(12),
                              child: Image.asset(
                                "assets/images/$e.png",
                                width: double.infinity,
                                height: 120,
                                fit: BoxFit.contain,
                              ),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              Helper.formatText(e),
                              style: TextStyle(
                                  color: Colors.grey[300], fontSize: 14),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
          // ),

          // Animated opacity for the menu background
          AnimatedOpacity(
            opacity: openMenu ? 1.0 : 0.0,
            duration: const Duration(milliseconds: 400),
            child: Container(
              color: Colors.black54,
              child: const Center(child: Text("")),
            ),
          ),
          
          FoldingMenu(
            duration: const Duration(milliseconds: 900),
            shadowColor: Colors.black26,
            animationCurve: Curves.decelerate,
            folded: openMenu,
            children: [
              ListTile(
                onTap: () {},
                title: const Text("Roman",style: TextStyle(color: Colors.white),),
                tileColor: Colors.white,
              ),
              ListTile(
                onTap: () {},
                title: const Text("CM Punk",style: TextStyle(color: Colors.white),),
                tileColor: Colors.white,
              ),
              ListTile(
                onTap: () {},
                title: const Text("Kali",style: TextStyle(color: Colors.white),),
                tileColor: Colors.white,
              ),
              ListTile(
                onTap: () {},
                title: const Text("The Rock",style: TextStyle(color: Colors.white),),
                tileColor: Colors.white,
              ),
               ListTile(
                onTap: () {},
                title: const Text("Under Taker",style: TextStyle(color: Colors.white),),
                tileColor: Colors.white,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
