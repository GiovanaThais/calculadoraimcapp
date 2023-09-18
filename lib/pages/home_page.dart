import 'package:flutter/material.dart';
import 'package:meuapp/service/calculo_imc_service.dart/';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String resultadoImc = '';
  TextEditingController controllerPeso = TextEditingController();
  TextEditingController controllerAltura = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
        centerTitle: true,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text(
                'Calculadora de imc',
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: controllerPeso,
                decoration: const InputDecoration(
                    labelText: 'Peso *',
                    hintText: 'Digite seu peso:',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(16.0)))),
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: controllerAltura,
                decoration: const InputDecoration(
                    labelText: 'Altura',
                    hintText: 'Digite sua altura:',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(16.0)))),
              ),
              const SizedBox(
                height: 32,
              ),
              Text(
                resultadoImc,
                style:
                    const TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 32),
              Container(
                width: 200,
                child: ElevatedButton(
                    onPressed: () {
                      setState(() {
                        num numAux = (num.parse(controllerPeso.text) /
                            (num.parse(controllerAltura.text) *
                                num.parse(controllerAltura.text)));
                        resultadoImc = numAux.toStringAsFixed(2);
                      });
                    },
                    child: const Text('Calcular')),
              )
            ],
          ),
        ),
      ),
      floatingActionButton: ElevatedButton(
        onPressed: () {
          setState(() {
            resultadoImc = '';
          });
        },
        child: const Icon(Icons.add_box),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
