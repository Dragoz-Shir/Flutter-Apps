import 'package:flutter/material.dart';

class InputsPage extends StatefulWidget {
  InputsPage({Key key}) : super(key: key);

  @override
  _InputsPageState createState() => _InputsPageState();
}

class _InputsPageState extends State<InputsPage> {
  String _nombre = " ";
  String _correo = " ";
  String _fecha = "";
  String _optDropSelected = "Volar";
  List<String> _poderes = [
    "Volar",
    "Invisibilidad",
    "Super Fuerza",
    "Super velocidad",
    "Rayos Laser"
  ];
  TextEditingController _inputFieldDateControler = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Inputs"),
        centerTitle: true,
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 10.0),
        children: [
          _crearInput(),
          Divider(),
          _crearCorreo(),
          Divider(),
          _crearContra(),
          Divider(),
          _crearFecha(context),
          Divider(),
          _crearDropDown(),
          Divider(),
          _crearPersona(),
        ],
      ),
    );
  }

  Widget _crearInput() {
    return TextField(
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
        counter: Text("Palabras: ${_nombre.length} "),
        hintText: "Nombre de la persona",
        helperText: "Solo el nombre",
        labelText: "Nombre",
        icon: Icon(Icons.account_circle),
        suffixIcon: Icon(Icons.accessibility),
      ),
      onChanged: (entrada) {
        setState(() {
          _nombre = entrada;
        });
      },
    );
  }

  Widget _crearCorreo() {
    return TextField(
      //textCapitalization: TextCapitalization.sentences,
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
        hintText: "Correo",
        labelText: "Correo",
        icon: Icon(Icons.email),
        suffixIcon: Icon(Icons.alternate_email),
      ),
      onChanged: (entrada) {
        setState(() {
          _correo = entrada;
        });
      },
    );
  }

  Widget _crearContra() {
    return TextField(
      //textCapitalization: TextCapitalization.sentences,
      obscureText: true,
      decoration: InputDecoration(
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
        hintText: "Contraseña",
        labelText: "Contraseña",
        icon: Icon(Icons.lock),
        suffixIcon: Icon(Icons.lock_outline),
      ),
      onChanged: (entrada) {
        setState(() {
          _correo = entrada;
        });
      },
    );
  }

  Widget _crearFecha(BuildContext context) {
    return TextField(
      textCapitalization: TextCapitalization.sentences,
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
        hintText: "Fecha de nacimiento",
        labelText: "Fecha",
        icon: Icon(Icons.perm_contact_calendar),
        suffixIcon: Icon(Icons.calendar_today),
      ),
      onTap: () {
        FocusScope.of(context).requestFocus(new FocusNode());
        _crearDate(context);
      },
      controller: _inputFieldDateControler,
    );
  }

  _crearDate(BuildContext context) async {
    DateTime picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2025),
      locale: Locale("es", "ES"),
    );
    if (picked != null) {
      setState(() {
        _fecha = picked.toString();
        // print(_fecha);
        _inputFieldDateControler.text = _fecha;
      });
    }
  }

  Widget _crearDropDown() {
    return Row(
      children: [
        Icon(Icons.av_timer),
        SizedBox(
          width: 30.0,
        ),
        Expanded(
          child: DropdownButton(
              value: _optDropSelected,
              items: getDropdownMenuItems(),
              onChanged: (opt) {
                setState(() {
                  _optDropSelected = opt;
                });
              }),
        )
      ],
    );
  }

  List<DropdownMenuItem<String>> getDropdownMenuItems() {
    List<DropdownMenuItem<String>> lista = new List();
    _poderes.forEach((poder) {
      lista.add(
        DropdownMenuItem(
          child: Text(poder),
          value: poder,
        ),
      );
    });

    return lista;
  }

  Widget _crearPersona() {
    return ListTile(
      title: Text("El nombre es: $_nombre"),
      subtitle: Text("Su correo es: $_correo"),
      trailing: Text(_optDropSelected),
    );
  }
}
