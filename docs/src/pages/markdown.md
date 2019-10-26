@def title = "Relatórios"

Uma parte tão importante quanto gerar resultados é a apresenta-los. O R fornece a opção do R Markdown, um arquivo que permite você misturar pedaços de código e texto - e o código é executado junto com a compilação do código. O Julia fornece exatamente a mesma ideia, com diferenças devido a maturação de cada um dos sistemas.

O pacote no Julia que nos permite escrever arquivos de Julia Markdown se chama **Weave**. Essa seção é dividida em duas partes: a primeira só ilustra as diferenças do Julia Markdown para o R Markdown. A segunda introduz o Julia Markdown desde o começo. Se você está familiarizado com o R Markdown, leia a próxima seção. Caso contrário, pule direto para a segunda seção.

# Diferenças para o R Markdown

O arquivo Markdown funciona exatamente igual a um arquivo R Markdown: a única diferença é que ao invés de usar \`\`\`r, usamos \`\`\`julia (não esqueça de fechar o bloco!). Para rodar pedaços de código no meio do texto, use \`j.

Uma vez escrito, salve o arquivo com a extensão .jmd. O comando do Weave é `weave()`, e recebe o caminho do arquivo e uma opção de qual tipo de documento deve ser gerado. Os formatos disponíveis para gerar documentos podem ser obtidos com `list_out_formats()`. Assim, para gerar um html de um arquivo jmd chamado exemplo, fariamos `weave(exemplo.jmd, doctype = "md2html")`.

Uma idiosincrasia do Weave é que precisamos declarar o caminho do arquivo a ser gerado no output no cabeçalho do documento. Assim, nosso arquivo exemplo teria como cabeçalho:

```
---
title: Um exemplo
author: Daniel Coutinho
date: Hoje
options:
  md2html:
      out_path: exemplo.html
  out_path: exemplo.md
---
```

Preste atenção na identação!
