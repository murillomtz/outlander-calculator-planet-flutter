import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final TextEditingController _controllerPeso = new TextEditingController();
  int radioValor = 1;
  String _nomePlaneta = "";

  bool selecaoValorA = true;
  bool selecaoValorB = false;
  bool selecaoValorC;
  bool switchValor = false;

  double _resultadoFinal = 0.0;

  void tomaContaValorRadio(int value) {
    setState(() {
      radioValor = value;

      switch (radioValor) {
        case 0:
          _resultadoFinal = calcularPesoEmPlaneta(_controllerPeso.text, 0.38);
          _nomePlaneta =
              "No planeta Marte seu peso é ${_resultadoFinal.toStringAsFixed(1)}";
          //debugPrint(_nomePlaneta);
          break;

        case 1:
          _resultadoFinal = calcularPesoEmPlaneta(_controllerPeso.text, 0.06);
          _nomePlaneta =
              "No planeta Plutão seu peso é ${_resultadoFinal.toStringAsFixed(1)}";
          //debugPrint(_nomePlaneta);
          break;

        case 2:
          _resultadoFinal = calcularPesoEmPlaneta(_controllerPeso.text, 0.91);
          _nomePlaneta =
              "No planeta Venos seu peso é ${_resultadoFinal.toStringAsFixed(1)}";
          //debugPrint(_nomePlaneta);
          break;
        case 3:
          _resultadoFinal = calcularPesoEmPlaneta(_controllerPeso.text, 0.38);
          _nomePlaneta =
              "No planeta Mercurio seu peso é ${_resultadoFinal.toStringAsFixed(1)}";

          break;

        default:
          debugPrint("Nada foi selecionado");
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Out Planet"),
        backgroundColor: Colors.black38,
      ),
      backgroundColor: Colors.blueGrey,
      body: Container(
        alignment: Alignment.topCenter,
        child: ListView(
          padding: const EdgeInsets.all(1.5),
          children: [
            Image.asset('assets/planet.png', height: 133.0, width: 200.0),
            Container(
              margin: const EdgeInsets.all(3.0),
              alignment: Alignment.center,
              child: Column(
                children: [
                  TextField(
                    controller: _controllerPeso,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      labelText: 'O seu peso na tera.',
                      hintText: "Kg",
                      //icon:
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Radio<int>(
                          activeColor: Colors.brown,
                          value: 0,
                          groupValue: radioValor,
                          onChanged: tomaContaValorRadio),
                      Text("Marte", style: TextStyle(color: Colors.black)),
                      Radio<int>(
                          activeColor: Colors.brown,
                          value: 1,
                          groupValue: radioValor,
                          onChanged: tomaContaValorRadio),
                      Text("Plutão", style: TextStyle(color: Colors.black)),
                      Radio<int>(
                          activeColor: Colors.brown,
                          value: 2,
                          groupValue: radioValor,
                          onChanged: tomaContaValorRadio),
                      Text("Vênus", style: TextStyle(color: Colors.black)),
                      Radio<int>(
                          activeColor: Colors.brown,
                          value: 3,
                          groupValue: radioValor,
                          onChanged: tomaContaValorRadio),
                      Text("Marcurio", style: TextStyle(color: Colors.black)),
                    ],
                  ),

                  //Resultado
                  Text(
                    _controllerPeso.text.isEmpty
                        ? "Coloque o seu peso"
                        : _nomePlaneta + " Kg",

                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 19.4,
                        fontWeight: FontWeight.w400),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  double calcularPesoEmPlaneta(String peso, double gravidade) {
    if (int.parse(peso).toString().isNotEmpty && int.parse(peso) > 0) {
      return (int.parse(peso) * gravidade);
    } else {
      print("Numero errado..");
      return int.parse("180") + 0.38; //Devolver um peso padrão (MArte)
    }
  }
}
