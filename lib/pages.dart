import 'package:exer_da/models/cervejas.dart';
import 'package:exer_da/repositories/cerveja_reposity.dart';
import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:intl/intl.dart';

class CervejaPage extends StatefulWidget {
  const CervejaPage({super.key});

  @override
  State<CervejaPage> createState() => _CervejaPageState();
}

class _CervejaPageState extends State<CervejaPage> {
  @override
  Widget build(BuildContext context) {
    final tabela = CervejaRepository.tabela;
    Intl.defaultLocale = 'pt_BR';  // Define a localidade padrão
    NumberFormat real = NumberFormat.currency(symbol: 'R\$');
    List<Cervejas> selecionadas = [];

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green[900],
        title: const Text(
          'Cerveja Store',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        centerTitle: true,
      ),
      body: ListView.separated(
        padding: const EdgeInsets.all(12),
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(30)),
            ),
            leading: SizedBox(
              width: 50,
              child: Image.asset(tabela[index].icone),
            ),
            title: Text(
              '${tabela[index].marca} ${tabela[index].embalagem}',
              style: const TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w400,
              ),
            ),
            trailing: Text(
              real.format(tabela[index].preco), // Corrigido o parêntese
              style: const TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w400,
              ),
            ),
            selected: selecionadas.contains(tabela[index]),
            selectedColor: Colors.green[900],
            onLongPress: () {
              setState(() {
                if (selecionadas.contains(tabela[index])) {
                  selecionadas.remove(tabela[index]);
                } else {
                  selecionadas.add(tabela[index]);
                }
              });
            },
          );
        },
        separatorBuilder: (_, __) => const Divider(),
        itemCount: tabela.length,
      ),
    );
  }
}
