import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:front_end/modules/home/presenter/widgets/register_client_dialog_content.dart';

import '../../../../shared/core/dependency_injection/inject.dart';
import '../../domain/entities/client_entity.dart';
import '../store/home_store.dart';
import '../widgets/register_sale_dialog_content.dart';

class HomeClientsView extends StatefulWidget {
  const HomeClientsView({super.key});

  @override
  State<HomeClientsView> createState() => _HomeClientsViewState();
}

class _HomeClientsViewState extends State<HomeClientsView> {
  final _store = getIt<HomeStore>();

  @override
  void initState() {
    _store.fetchClients();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Home')),
      floatingActionButton: _buildFloatingActionButton(),

      body: Observer(
        builder: (_) {
          if (_store.isLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          if (_store.clients.isEmpty) {
            return const Center(child: Text('No clients found'));
          }

          return ListView.builder(
            itemBuilder: (context, index) {
              final client = _store.clients[index];
              return _itemBuilder(client);
            },
            itemCount: _store.clients.length,
          );
        },
      ),
    );
  }

  Widget _itemBuilder(ClientEntity client) {
    return InkWell(
      onTap: () {
        _showRegisterSaleDialog(client.id);
      },
      child: ListTile(
        title: Text(
          '${client.name} [ ${_store.firstMissingAlphabetLetter(name: client.name)} ]',
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 6,
          children: [
            RichText(
              text: TextSpan(
                text: 'Email: ',
                style: const TextStyle(color: Colors.black),
                children: [
                  TextSpan(
                    text: client.email,
                    style: const TextStyle(color: Colors.grey),
                  ),
                ],
              ),
            ),
            RichText(
              text: TextSpan(
                text: 'Birthdate: ',
                style: const TextStyle(color: Colors.black),
                children: [
                  TextSpan(
                    text:
                        DateTime.parse(
                          client.birthdate,
                        ).toLocal().toString().split(' ')[0],
                    style: const TextStyle(color: Colors.grey),
                  ),
                ],
              ),
            ),
          ],
        ),
        trailing: Icon(Icons.chevron_right),
      ),
    );
  }

  Widget _buildFloatingActionButton() {
    return FloatingActionButton(
      onPressed: _showRegisterClientDialog,
      child: const Icon(Icons.add),
    );
  }

  void _showRegisterClientDialog() {
    showDialog(
      context: context,
      builder: (context) {
        return RegisterClientDialogContent(store: _store);
      },
    );
  }

  void _showRegisterSaleDialog(String clientId) {
    showDialog(
      context: context,
      builder: (context) {
        return RegisterSaleDialogContent(store: _store, clientId: clientId);
      },
    );
  }
}
