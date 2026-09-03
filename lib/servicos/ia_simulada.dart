/// Simulação da IA Generativa.
/// Depois basta trocar o corpo de gerarResposta por uma chamada real
/// à API (OpenAI, Gemini, Claude) — o resto do app não muda.
class RespostaIA {
  final String mensagem;
  final String dica;
  RespostaIA(this.mensagem, this.dica);
}

RespostaIA gerarResposta(String textoUsuario) {
  final t = textoUsuario.toLowerCase();

  if (t.contains('ansios') || t.contains('nervos') || t.contains('prova')) {
    return RespostaIA(
      'Respire fundo. É normal sentir ansiedade em períodos de prova, '
      'e o fato de você reconhecer isso já é um cuidado com você mesmo.',
      'Faça 3 respirações profundas agora e divida o que precisa estudar '
      'em blocos de 25 minutos.',
    );
  } else if (t.contains('cansad') || t.contains('estress') || t.contains('sobrecarreg')) {
    return RespostaIA(
      'Você está se esforçando bastante, e isso merece ser reconhecido. '
      'Cansaço não é fraqueza, é sinal de que você precisa de pausa.',
      'Faça uma pausa de 10 minutos longe de telas, de preferência bebendo água '
      'ou dando uma volta curta.',
    );
  } else if (t.contains('triste') || t.contains('sozin') || t.contains('desanim')) {
    return RespostaIA(
      'Sinto que hoje está mais pesado. Você não precisa dar conta de tudo agora, '
      'e falar sobre isso já é um passo.',
      'Mande uma mensagem para alguém de confiança, mesmo que seja só um "oi".',
    );
  } else if (t.contains('feliz') || t.contains('bem') || t.contains('anima')) {
    return RespostaIA(
      'Que bom ler isso! Guardar os dias bons ajuda a atravessar os difíceis.',
      'Anote em uma frase o que fez seu dia ser bom — leia isso depois em um dia ruim.',
    );
  }

  return RespostaIA(
    'Obrigado por compartilhar como você está. Colocar em palavras o que sentimos '
    'já organiza bastante o pensamento.',
    'Anote uma coisa boa, mesmo pequena, que aconteceu hoje.',
  );
}
