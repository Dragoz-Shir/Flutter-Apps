import 'package:flutter/material.dart';

class SliderPage extends StatefulWidget {
  SliderPage({Key key}) : super(key: key);

  @override
  _SliderPageState createState() => _SliderPageState();
}

class _SliderPageState extends State<SliderPage> {
  double _valorSlider = 100.0;
  bool _checado = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Sliders Page"),
        centerTitle: true,
      ),
      body: Container(
        child: Column(
          children: [
            _crearSlider(),
            _crearCheckBox(),
            Expanded(
              child: _crearImagen(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _crearSlider() {
    return Slider(
      activeColor: Colors.indigo,
      label: "a ver",
      onChanged: _checado
          ? (valor) {
              setState(() {
                _valorSlider = valor;
                //print(valor);
              });
            }
          : null,
      value: _valorSlider,
      min: 50,
      max: 300,
    );
  }

  Widget _crearCheckBox() {
    // return Checkbox(
    //     value: _checado,
    //     onChanged: (valor) {
    //       setState(() {
    //         _checado = valor;
    //         print(_checado);
    //       });
    //     });

    return CheckboxListTile(
      title: Text("activar slider"),
      value: _checado,
      onChanged: (value) {
        setState(() {
          _checado = value;
        });
      },
    );
  }

  Widget _crearImagen() {
    return Image(
      image: NetworkImage(
          "https://todocosplays.com/wp-content/uploads/2020/08/Cosplays-de-ITachi-1142x1200.jpg"),
      width: _valorSlider,
      fit: BoxFit.contain,
    );
  }
}
