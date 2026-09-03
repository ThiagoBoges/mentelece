import 'package:flutter/material.dart';
import '../modelos/registro_humor.dart';
import 'tela_historico.dart';
import 'tela_resposta.dart';

class TelaDiario extends StatefulWidget {
  const TelaDiario({super.key});

  @override
  State<TelaDiario> createState() => _TelaDiarioState();
}

class _TelaDiarioState extends State<TelaDiario> {
  final TextEditingController _controller = TextEditingController();
  final List<RegistroHumor> _historico = [];

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _enviar() async {
    final texto = _controller.text.trim();
    if (texto.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Escreva como você está se sentindo.')),
      );
      return;
    }

    // Vai para a Tela 2. Se voltar com um registro, salvamos no histórico.
    final registro = await Navigator.push<RegistroHumor>(
      context,
      MaterialPageRoute(builder: (_) => TelaResposta(texto: texto)),
    );

    if (registro != null) {
      setState(() => _historico.insert(0, registro));
      _controller.clear();
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Registro salvo no histórico!')),
        );
      }
    }
  }

  void _abrirHistorico() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => TelaHistorico(registros: _historico)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('MenteLeve'),
        actions: [
          IconButton(
            icon: const Icon(Icons.history),
            tooltip: 'Histórico',
            onPressed: _abrirHistorico,
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Icon(Icons.spa_outlined, size: 56, color: Color(0xFF2E7D6F)),
            const SizedBox(height: 16),
            const Text(
              'Como você está hoje?',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 8),
            const Text(
              'Escreva em poucas frases o que você está sentindo.',
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.black54),
            ),
            const SizedBox(height: 24),
            TextField(
              controller: _controller,
              maxLines: 6,
              decoration: const InputDecoration(
                hintText: 'Como você está se sentindo hoje?',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton.icon(
              onPressed: _enviar,
              icon: const Icon(Icons.send),
              label: const Padding(
                padding: EdgeInsets.symmetric(vertical: 12),
                child: Text('Enviar'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
