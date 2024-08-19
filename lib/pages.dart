import 'package:exer_da/repositories/cerveja_reposity.dart';
import 'package:flutter/material.dart';

class CervejaPage extends StatelessWidget {
  const CervejaPage({super.key});

  @override
  Widget build(BuildContext context) {
    final tabela = CervejaRepository.tabela;
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
      body: ListView.separated(itemBuilder: (BuildContext context, int cerveja) {
        return ListTile(
          leading: Image.asset(tabela[cerveja].icone),
          title: Text(
            '${CervejaRepository.tabela[cerveja].marca} ${CervejaRepository.tabela[cerveja].embalagem}',
          ),
          trailing: Text(tabela[cerveja].preco.toString()),
          
        );
      },
      padding: const EdgeInsets.all(12),
      separatorBuilder: (_, __) => const Divider(),
      itemCount: tabela.length,));
  }
}