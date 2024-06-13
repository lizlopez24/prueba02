import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:prueba02/screens/CuentaScreen.dart';

void main() {
  runApp(LoginApp());
}

class LoginApp extends StatelessWidget {
  const LoginApp({super.key});

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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
      ),
      body: Cuerpo(context),
    );
    Container();
  }
}

Widget Cuerpo(context) {
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
            child: Text("Iniciar sesion", style: TextStyle(fontSize: 25))),
          Usuario(),
          Password(),
          Btn1(context)
        ],
      )),
    ),
  );
}

final TextEditingController _correo = TextEditingController();
Widget Usuario() {
  return Container(
      padding: const EdgeInsets.all(20),
      child: TextField(
        controller: _correo,
        decoration: InputDecoration(
          hintText: "Ingrese su correo",
        ),
        keyboardType: TextInputType.emailAddress,
      ));
}

final TextEditingController _contrasenia = TextEditingController();
Widget Password() {
  return Container(
      padding: const EdgeInsets.all(20),
      child: TextField(
        controller: _contrasenia,
        decoration: InputDecoration(
          hintText: "Ingrese su contraseña",
        ),
        keyboardType: TextInputType.visiblePassword,
      ));
}

Widget Btn1(context) {
  return (FilledButton(
      onPressed: () {
      login(context);
      },
      child: Text("Iniciar Sesión"),
      style:
          ButtonStyle(backgroundColor: WidgetStatePropertyAll(Colors.amber))));
}


Future<void> login(context) async {
  try {
  final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
    email: _correo.text,
    password: _contrasenia.text
  );
  Navigator.push(context, MaterialPageRoute(builder: (context)=>CuentaApp()));
} on FirebaseAuthException catch (e) {
  if (e.code == 'invalid-credential') {
    mostrarAlertaMail(context);
  } else if (e.code == 'wrong-password') {
  }
}
}


void mostrarAlertaMail(context){
  showDialog(context: context, builder: (context){
    return AlertDialog(
      title: Text("Error al iniciar sesión"),
      content: Text("El correo o contraseña son incorrectos"),
      actions: [
        TextButton(onPressed: (){
          Navigator.pop(context);
        }, child: Text("Aceptar"))
      ],
    );
  });
}