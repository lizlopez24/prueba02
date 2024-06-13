import 'package:flutter/material.dart';
import 'package:prueba02/screens/CuentaScreen.dart';

void main(){
  runApp(HistorialApp());
}

class HistorialApp extends StatelessWidget {
  const HistorialApp({super.key});
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Home(),
    );
  }
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

double totalCuenta=2000;
List<double> lista=[-50,650,-15.25];

class _HomeState extends State<Home> {
  void initState(){
    super.initState();
    recorreLista();
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            TransaccionItem(tipo:"Retiro",descripcion: "Retiro para compras",valor: lista[0]),
            TransaccionItem(tipo:"Deposito",descripcion: "Salario",valor: lista[1]),
            TransaccionItem(tipo:"Pago",descripcion: "Pago Luz",valor: lista[2]),
            Container(
              child: Row(
                children: [
                  Text("Total de la cuenta: $totalCuenta", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
Widget Cuerpo(){
  return(
    Column(
      children: <Widget>[
      ],
    )
  );
}

void recorreLista(){
  totalCuenta=2000;
  for (var element in lista) {
    totalCuenta=totalCuenta+element;
  }
}

class TransaccionItem extends StatelessWidget {
  final String tipo;
  final String descripcion;
  final double valor;
  TransaccionItem({required this.tipo, required this.valor, required this.descripcion});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(10.0),
      child: ListTile(
        leading: Icon(Icons.monetization_on_outlined),
        title: Text(tipo),
        subtitle: Text(valor.toString()),
      ),
    );
  }
}