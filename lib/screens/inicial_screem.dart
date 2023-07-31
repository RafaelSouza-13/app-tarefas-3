import 'package:flutter/material.dart';
import 'package:tarefas/data/task_dao.dart';
import '../components/task.dart';
import 'form.dart';

class InicialScream extends StatefulWidget {
  const InicialScream({super.key});

  @override
  State<InicialScream> createState() => _InicialScreamState();
}

class _InicialScreamState extends State<InicialScream> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: Container(),
          actions: [
            IconButton(
                onPressed: () {
                  setState(() {});
                },
                icon: const Icon(Icons.update))
          ],
          backgroundColor: Colors.blue,
          title: const Text(
            'Tarefas',
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.only(top: 8, bottom: 70),
          child: FutureBuilder<List<Task>>(
              future: TaskDao().findAll(),
              builder: (context, snapshot) {
                List<Task>? items = snapshot.data;
                switch (snapshot.connectionState) {
                  case ConnectionState.none:
                    return const Center(
                      child: Column(
                        children: [
                          CircularProgressIndicator(),
                          Text('Carregando'),
                        ],
                      ),
                    );
                  case ConnectionState.waiting:
                    return const Center(
                      child: Column(
                        children: [
                          CircularProgressIndicator(),
                          Text('Carregando'),
                        ],
                      ),
                    );
                  case ConnectionState.active:
                    return const Center(
                      child: Column(
                        children: [
                          CircularProgressIndicator(),
                          Text('Carregando'),
                        ],
                      ),
                    );
                  case ConnectionState.done:
                    if (snapshot.hasData && items != null) {
                      if (items.isNotEmpty) {
                        return ListView.builder(
                          itemCount: items.length,
                          itemBuilder: (BuildContext context, int index) {
                            final Task tarefa = items[index];
                            return tarefa;
                          },
                        );
                      }
                      return const Center(
                        child: Column(
                          children: [
                            Icon(
                              Icons.error_outline,
                              size: 128,
                            ),
                            Text(
                              'Não há tarefas registradas',
                              style: TextStyle(fontSize: 32),
                            ),
                          ],
                        ),
                      );
                    }
                    return const Text('Erro ao carregar as tarefas');
                }
              }),
        ),
        floatingActionButton: FloatingActionButton.small(
          backgroundColor: Colors.blue,
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (contextNew) => FormScreem(
                  taskContext: context,
                ),
              ),
            ).then((value) => setState(() {}));
          },
          child: const Icon(
            Icons.add,
            color: Colors.white,
          ),
        ));
  }
}
