import 'package:flutter/material.dart';
import '../modelos/registro_humor.dart';
import '../servicos/ia_simulada.dart';

class TelaResposta extends StatelessWidget {
  final String texto;
  const TelaResposta({super.key, required this.texto});

  @override
  Widget build(BuildContext context) {
    final resposta = gerarResposta(texto);

    return Scaffold(
      appBar: AppBar(title: const Text('Resposta da IA')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Icon(Icons.favorite, size: 56, color: Color(0xFFE57373)),
            const SizedBox(height: 20),
            _CardTexto(
              icone: Icons.chat_bubble_outline,
              titulo: 'Mensagem de apoio',
              conteudo: resposta.mensagem,
            ),
            const SizedBox(height: 16),
            _CardTexto(
              icone: Icons.lightbulb_outline,
              titulo: 'Dica prática',
              conteudo: resposta.dica,
            ),
            const SizedBox(height: 28),
            ElevatedButton.icon(
              icon: const Icon(Icons.bookmark_added_outlined),
              label: const Padding(
                padding: EdgeInsets.symmetric(vertical: 12),
                child: Text('Salvar no histórico'),
              ),
              onPressed: () {
                Navigator.pop(
                  context,
                  RegistroHumor(
                    data: DateTime.now(),
                    texto: texto,
                    mensagem: resposta.mensagem,
                    dica: resposta.dica,
                  ),
                );
              },
            ),
            const SizedBox(height: 12),
            OutlinedButton(
              onPressed: () => Navigator.pop(context),
              child: const Padding(
                padding: EdgeInsets.symmetric(vertical: 12),
                child: Text('Voltar ao início'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _CardTexto extends StatelessWidget {
  final IconData icone;
  final String titulo;
  final String conteudo;
  const _CardTexto({
    required this.icone,
    required this.titulo,
    required this.conteudo,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(18),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(icone, color: const Color(0xFF2E7D6F)),
                const SizedBox(width: 8),
                Text(
                  titulo,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Text(conteudo, style: const TextStyle(fontSize: 15, height: 1.4)),
          ],
        ),
      ),
    );
  }
}
