import 'package:flutter/material.dart';
import 'package:prueba02/main.dart';
import 'package:prueba02/screens/HistorialScreen.dart';

void main(){
  runApp(CuentaApp());
}

class CuentaApp extends StatelessWidget {
  const CuentaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Home(),
    );
  }
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}


class _HomeState extends State<Home> {
  int indice=0;
  @override
  Widget build(BuildContext context) {
    final List <Widget> screens=[Cuerpo(),HistorialApp()];
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cuenta'),
      ),
      body: screens[indice],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: indice,
        onTap: (valor) {
          setState(() {
            indice=valor;
          });
        },
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.monetization_on_sharp), label: "Cuenta"),
          BottomNavigationBarItem(icon: Icon(Icons.list),label: "Historial"),
        ]
        ),
    );Container();
  }
}

Widget Cuerpo() {
  return Container(
    width: double.infinity,
    decoration: BoxDecoration(
        image: DecorationImage(
            image: NetworkImage(
                'https://img.freepik.com/vector-premium/fondo-degradado-delicado_652136-32.jpg'),
            fit: BoxFit.cover)),
    child: Center(
      child: (Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(top: 30),
            child: Text("Cuenta del usuario", style: TextStyle(fontSize: 25))),
          Container(
            padding: EdgeInsets.only(top: 30),
            child: Image.network('https://st2.depositphotos.com/2222024/5609/i/450/depositphotos_56093859-stock-photo-happy-little-orange-havanese-puppy.jpg', scale: 3,),
          ),
          Cuenta()
        ],
      )),
    ),
  );
}

Widget Cuenta(){
  return Container(
    padding: EdgeInsets.only(top: 30),
    child: Column(children: [
      Text("Número de Cuenta: ", style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
      Text("205698746", style: TextStyle(fontSize: 30)),
      Text("Total de la Cuenta: ", style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
      Text("2584.75", style: TextStyle(fontSize: 30))
    ],),
  );
}

