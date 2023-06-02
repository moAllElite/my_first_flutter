import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Les widgets basiques',
      theme: ThemeData(primarySwatch: Colors.red),
      debugShowCheckedModeBanner: false,
      color: Colors.blueAccent,
      home: const Home(),
    );
  }
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<StatefulWidget> createState() {
    return _Home();
  }
}

class _Home extends State<Home> {
  bool oui=false;
  @override
  Widget build(BuildContext context) {
    double largeur=MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: const Text("hello "),
        shadowColor: Colors.black12,
        leading: const Icon(Icons.account_circle),
        actions: const <Widget>[
          Icon(Icons.access_alarm),
          Icon(Icons.saved_search),
          Icon(Icons.directions_bike),
        ],
        elevation: 10.0,
        centerTitle: true,
      ),
      body:  Center(
         child: Column(
           mainAxisAlignment: MainAxisAlignment.spaceAround,
           children: <Widget>[
            Text(
              "salut les gars!!".toUpperCase(),
              style:GoogleFonts.poppins(
               textStyle:TextStyle(
                color:(oui) ? Colors.grey[900]:Colors.greenAccent,
                fontSize: 30.0,
                fontStyle: FontStyle.italic,
               ),

              ),
              textAlign: TextAlign.center,
            ),
            Card(
              elevation:10.0,
              child: SizedBox(
                width: MediaQuery.of(context).size.width/1.5,
                height: 200.0,
                child: Image.asset("images/im1.jpg",fit: BoxFit.cover),
              ),
            ),
            Center(
              child: Text("$_count",style: const TextStyle(fontWeight: FontWeight.bold),),
            ),
            IconButton(
                onPressed:(){
                  setState(() {
                    oui=!oui;
                    });
                  },
                icon:const Icon(Icons.delete)
            ),
            TextButton(onPressed: pressedButton,
              style: const ButtonStyle(
                foregroundColor: MaterialStatePropertyAll<Color>(Colors.teal),
                elevation: MaterialStatePropertyAll(10),
                shadowColor: MaterialStatePropertyAll(Colors.cyan),
                backgroundColor: MaterialStatePropertyAll(Colors.black),
              ),

              child:const  Text('Click me'),
            ),
             TextButton(
               style: TextButton.styleFrom(
                 foregroundColor: Colors.blue,
                 disabledBackgroundColor: Colors.red,
                 padding:const EdgeInsets.symmetric(horizontal: 16.0),
                 minimumSize:const Size(88, 36),
                 shape: const RoundedRectangleBorder(
                   borderRadius: BorderRadius.all(Radius.circular(5.0)),
                 ),
                 elevation: 10.0,
               ),
               onPressed: null,
               child:const Text(
                 'TextButton',
                 style:
                 TextStyle(color: Colors.white),
               ),
             ),
            Container(
              height: largeur/5,
              color: Colors.teal[800],
              margin:const EdgeInsets.only(left: 20.0 ,right: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[    IconButton(onPressed: increment,
                    icon:Icon(
                        Icons.thumb_up_alt_outlined,
                        color: Colors.white,size: largeur/10)
                ),
                  IconButton(onPressed: decrement,icon:Icon( Icons.thumb_down_alt_outlined,color: Colors.white, size: largeur/10)),
                  Icon(Icons.cabin,color: Colors.white, size: largeur/10),
                  Icon(Icons.place,color: Colors.white, size: largeur/10),
               ],
              ),
            )
          ],
         ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed:pressedButton,
        elevation: 8.0,
        tooltip: 'Changer oui',
        child:const Icon(Icons.add,color: Colors.white),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
  int _count=0;
  void pressedButton(){
    setState((){
      oui=!oui;
    });
  }
  void increment(){
    setState(() {
      _count++;
    });
  }
  void decrement(){
    setState(() {
      _count--;
    });
  }
}
