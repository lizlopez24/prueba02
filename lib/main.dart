import 'package:flutter/material.dart';
import 'package:prueba02/screens/LoginScreen.dart';
import 'package:prueba02/screens/RegistroScreen.dart';
import 'package:firebase_core/firebase_core.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
await Firebase.initializeApp();

  runApp(const PruebaApp());
}

class PruebaApp extends StatelessWidget {
  const PruebaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: "Prueba 2",
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Prueba 2'),
      ),
      body: Cuerpo(context),
    );Container();
  }
}

Widget Cuerpo(context){
  return Container(
    width: double.infinity,
    decoration: BoxDecoration(
      image: DecorationImage(
        image: NetworkImage('https://img.freepik.com/vector-premium/fondo-degradado-delicado_652136-32.jpg'),
        fit: BoxFit.cover
        )),
        child: (
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [ datos(), 
            Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              BotonRegistro(context),
              BotonLogin(context)
            ],
          ),])
        )
  );
}

Widget datos(){
  return Container(
    child: Column(children: [
      Text("Nombre: ", style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
      Text("Lizeth López", style: TextStyle(fontSize: 30)),
      Text("Usuario en GIT: ", style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
      Text("lizlopez24", style: TextStyle(fontSize: 30))
    ],),
  );
}


Widget BotonLogin(context){
  return Container(
    padding: EdgeInsets.only(top: 80, left:30 ),
    child: FilledButton(
      onPressed: (){
      Navigator.push(context, MaterialPageRoute(builder: (context)=>LoginApp()));
    }, 
    child: Text("Login"),
    style: ButtonStyle(backgroundColor: WidgetStatePropertyAll(Colors.amber)),
    ),
  );
}

Widget BotonRegistro(context){
  return Container(
    padding: EdgeInsets.only(top: 80),
    child: FilledButton(onPressed: (){
      Navigator.push(context, MaterialPageRoute(builder: (context)=>RegistroApp()));
    }, child: Text("Registrarse"),
    style: ButtonStyle(backgroundColor: WidgetStatePropertyAll(Colors.amber)),
    ),
    
  );
}