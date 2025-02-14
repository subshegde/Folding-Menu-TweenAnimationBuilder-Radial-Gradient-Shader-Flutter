import 'package:flutter/material.dart';
import 'package:folding_menu/folding_menu.dart';
import 'package:folding_menu_demo_flutter/utils/helper.dart';

class FoldingMenuWhite extends StatefulWidget {
  @override
  _FoldingMenuWhiteState createState() => _FoldingMenuWhiteState();
}

class _FoldingMenuWhiteState extends State<FoldingMenuWhite> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        foregroundColor: Colors.black,
        backgroundColor: Colors.white,
        title: const Text("W W E"),
        actions: [
          IconButton(
            icon: const Icon(Icons.menu, color: Colors.black),
            onPressed: () {},
          ),
        ],
      ),
      body: Stack(
        children: [
          TweenAnimationBuilder(
            tween: Tween(begin: 0.0,end: 1.0),
            duration: const Duration(milliseconds: 1500),
            builder: (context,value,child){
              return ShaderMask(
                shaderCallback: (rect){
                  return RadialGradient(
                    radius: value*5,
                    colors: const [Colors.white,Colors.white,Colors.transparent,Colors.transparent],
                    stops: const [0.0,.55,.6,1.0],
                    center: const FractionalOffset(.95, .90),
                  ).createShader(rect);
                },
                child: child,
                );
            },
            child:SingleChildScrollView(
            child: Container(
              color: Colors.white,
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
                      String e = ['cm-punk-nobg', 'kali-nobg', 'rock-nobg', 'roman-nobg', 'undertaker-nobg', 'cm-punk-nobg'][index];
                      return Card(
                        color: Colors.white,
                        margin: const EdgeInsets.all(1),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                          side: BorderSide(color: Colors.grey[300]!, width: 1),
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
                              style: const TextStyle(
                                  color: Colors.black, fontSize: 14),
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
            ),
        ],
      ),
    );
  }
}
