import 'dart:math';

import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final TextEditingController _pesoController = TextEditingController();
  final TextEditingController _alturaController = TextEditingController();
  String _retorno;

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    _retorno = "Informe seus dados!";
  }

  void calcularImc() {
    if (_pesoController.text.isEmpty || _alturaController.text.isEmpty) {
      _retorno = "Informe seus dados!";
      return;
    }

    final double peso = double.parse(_pesoController.text);
    final int altura = int.parse(_alturaController.text);

    final double imc = peso / pow(altura / 100, 2);

    if (imc < 18.5) {
      _retorno = "Abaixo do peso";
    } else if (imc < 24.9) {
      _retorno = "Peso normal";
    } else if (imc < 29.9) {
      _retorno = "Sobrepeso";
    } else if (imc < 34.9) {
      _retorno = "Obesidade grau 1";
    } else if (imc < 39.9) {
      _retorno = "Obesidade grau 2";
    } else {
      _retorno = "Obesidade grau 3";
    }

    _retorno += " (${imc.toStringAsFixed(2)})";
    setState(() {});
  }

  void resetFields() {
    setState(() {
      _pesoController.clear();
      _alturaController.clear();
      _formKey = GlobalKey<FormState>();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Calculadora de IMC"),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: () {
              resetFields();
            },
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(32.0),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  const Icon(
                    Icons.person_outline,
                    size: 96,
                    color: Colors.green,
                  ),
                  TextFormField(
                    textAlign: TextAlign.center,
                    decoration: const InputDecoration(
                      labelText: "Peso (Kg)",
                    ),
                    controller: _pesoController,
                    keyboardType: TextInputType.number,
                    validator: (value) {
                      if (value.isEmpty) {
                        return "Insira seu peso";
                      }
                      return "";
                    },
                  ),
                  TextFormField(
                    decoration: const InputDecoration(
                      labelText: "Altura (Cm)",
                    ),
                    controller: _alturaController,
                    keyboardType: TextInputType.number,
                    validator: (value) {
                      if (value.isEmpty) {
                        return "Insira sua altura";
                      }
                      return "";
                    },
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState.validate()) {
                        calcularImc();
                      }
                    },
                    child: const Text("Calcular"),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      _retorno,
                      style: Theme.of(context).textTheme.bodyText2,
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
