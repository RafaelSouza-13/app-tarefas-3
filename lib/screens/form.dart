import 'package:flutter/material.dart';
import 'package:tarefas/data/task_inherited.dart';

class FormScreem extends StatefulWidget {
  const FormScreem({super.key, required this.taskContext});

  final BuildContext taskContext;
  @override
  State<FormScreem> createState() => _FormScreemState();
}

class _FormScreemState extends State<FormScreem> {
  TextEditingController nameControler = TextEditingController();
  TextEditingController difficultyControler = TextEditingController();
  TextEditingController imageControler = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  bool valueValidator(String? value) {
    if (value != null && value.isEmpty) {
      return true;
    }
    return false;
  }

  bool difficultyValidator(String? value) {
    if (value != null && value.isEmpty) {
      if (int.parse(value) > 5 || int.parse(value) < 1) {
        return true;
      }
      return false;
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue,
          title: const Text(
            'Formulario',
            style: TextStyle(color: Colors.white),
          ),
        ),
        body: Center(
          child: SingleChildScrollView(
            child: Container(
              decoration: BoxDecoration(
                color: Colors.black12,
                border: Border.all(color: Colors.black, width: 2),
                borderRadius: BorderRadius.circular(8),
              ),
              height: 650,
              width: 375,
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        validator: (String? value) {
                          if (valueValidator(value)) {
                            return 'Insira o nome da tarefa';
                          } else {
                            return null;
                          }
                        },
                        decoration: const InputDecoration(
                          floatingLabelBehavior: FloatingLabelBehavior.always,
                          labelStyle: (TextStyle(fontSize: 20)),
                          labelText: 'Nome',
                          border: OutlineInputBorder(),
                          hintText: 'ex: Ler um livro',
                          hintStyle: TextStyle(color: Colors.black26),
                          filled: true,
                          fillColor: Colors.white70,
                        ),
                        controller: nameControler,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        validator: (value) {
                          if (difficultyValidator(value)) {
                            return 'Insira uma dificuldade entre 1 e 5';
                          }
                          return null;
                        },
                        keyboardType: TextInputType.number,
                        decoration: const InputDecoration(
                          floatingLabelBehavior: FloatingLabelBehavior.always,
                          labelText: 'Dificuldade',
                          labelStyle: (TextStyle(fontSize: 20)),
                          border: OutlineInputBorder(),
                          hintText: 'Selecione um numero de 1 a 5',
                          hintStyle: TextStyle(color: Colors.black26),
                          filled: true,
                          fillColor: Colors.white70,
                        ),
                        controller: difficultyControler,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        validator: (value) {
                          if (valueValidator(value)) {
                            return 'Insira uma url de imagem';
                          } else {
                            return null;
                          }
                        },
                        keyboardType: TextInputType.url,
                        onChanged: (text) {
                          setState(() {});
                        },
                        decoration: const InputDecoration(
                          floatingLabelBehavior: FloatingLabelBehavior.always,
                          labelText: 'Imagem',
                          labelStyle: (TextStyle(fontSize: 20)),
                          border: OutlineInputBorder(),
                          hintText: 'url de uma imagem',
                          hintStyle: TextStyle(color: Colors.black26),
                          filled: true,
                          fillColor: Colors.white70,
                        ),
                        controller: imageControler,
                      ),
                    ),
                    Container(
                      height: 100,
                      width: 72,
                      decoration: BoxDecoration(
                        color: Colors.blueGrey,
                        border: Border.all(width: 2, color: Colors.blue),
                        borderRadius: const BorderRadius.all(
                          Radius.circular(8),
                        ),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Image.network(
                          imageControler.text,
                          errorBuilder: (BuildContext context, Object exception,
                              StackTrace? stackTrace) {
                            return Image.asset('assets/images/nophoto.png');
                          },
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        TaskInherited.of(widget.taskContext)!.newTask(
                            nameControler.text,
                            imageControler.text,
                            int.parse(difficultyControler.text));
                        if (_formKey.currentState!.validate()) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('Ciando uma nova tarefa'),
                              backgroundColor: Colors.black87,
                              behavior: SnackBarBehavior.floating,
                              elevation: 150.0,
                            ),
                          );
                          Navigator.pop(context);
                        }
                      },
                      child: const Text('Adicionar'),
                    )
                  ]),
            ),
          ),
        ),
      ),
    );
  }
}
