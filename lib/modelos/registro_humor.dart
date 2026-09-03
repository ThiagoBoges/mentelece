class RegistroHumor {
  final DateTime data;
  final String texto;
  final String mensagem;
  final String dica;

  RegistroHumor({
    required this.data,
    required this.texto,
    required this.mensagem,
    required this.dica,
  });

  String get dataFormatada {
    String d(int n) => n.toString().padLeft(2, '0');
    return '${d(data.day)}/${d(data.month)}/${data.year} ${d(data.hour)}:${d(data.minute)}';
  }
}
