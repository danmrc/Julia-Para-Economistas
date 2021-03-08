@def title = "Relatórios"

# Relatórios

Uma parte tão importante quanto gerar resultados é a apresenta-los. O R fornece a opção do R Markdown, um arquivo que permite você misturar pedaços de código e texto - e o código é executado junto com a compilação do código. O Julia fornece exatamente a mesma ideia, com diferenças devido a maturação de cada um dos sistemas.

O pacote no Julia que nos permite escrever arquivos de Julia Markdown se chama **Weave**. Essa seção é dividida em duas partes: a primeira só ilustra as diferenças do Julia Markdown para o R Markdown. A segunda introduz o Julia Markdown desde o começo. Se você está familiarizado com o R Markdown, leia a próxima seção. Caso contrário, pule direto para a segunda seção.

## Diferenças para o R Markdown

O arquivo Markdown funciona exatamente igual a um arquivo R Markdown: a única diferença é que ao invés de usar \`\`\`r, usamos \`\`\`julia (não esqueça de fechar o bloco!). Para rodar pedaços de código no meio do texto, use \`j.

Uma vez escrito, salve o arquivo com a extensão .jmd. O comando do Weave é `weave()`, e recebe o caminho do arquivo e uma opção de qual tipo de documento deve ser gerado. Os formatos disponíveis para gerar documentos podem ser obtidos com `list_out_formats()`. Assim, para gerar um html de um arquivo jmd chamado exemplo, fariamos `weave(exemplo.jmd, doctype = "md2html")`. Para gerar um documento .tex, o comando seria `weave(exemplo.jmd, doctype = "md2tex")`. Teoricamente voce pode gerar um pdf diretamente, fazendo `weave(exemplo.jmd, doctype = "md2pdf")`, mas eu testei em três sistemas operacionais, sem sucesso.

Uma idiosincrasia do Weave é que precisamos declarar o caminho do arquivo a ser gerado no output no cabeçalho do documento. Assim, nosso arquivo exemplo teria como cabeçalho:

```YAML
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

## Do começo: Markdown para recém chegados

Se você nunca trabalhou com markdown, mas já usou o LaTeX, a ideia é bastante parecida: ao invés de escolher negrito usando um menu, um comando no texto se converte em negrito. Se você nunca usou LaTeX, o que segue é uma língua estrangeira com alfabeto próprio. Os custos de entrada, entretanto, mais que se pagam. Eu vou introduzir todos os elementos de um arquivo markdown a seguir:

## Cabeçalho

Primeiro temos que declarar uma cabeçalho como o acima, que eu reproduzo aqui por conveniência:

```YAML
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

### Formatação I

Isso vai gerar um documento com um título "Um exemplo" e com autor "Daniel Coutinho" e uma data escrito literalmente "Hoje".

Embaixo disso você pode escrever texto normalmente. O markdown aceita alguma opções de formatação elementares:

* `_itálico_` um texto entre underline gera um itálico: _itálico_
* `**negrito**` um texto entre dois asteriscos gera um texto em negrito: **negrito**.

### Separando seções

Para separar as seções, usamos o jogo da velha (ou hashtag). Subseções são separadas com `##` e subsubseções com três:

```

# Introdução

Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.

# Outra seção

patati patata

## Subseção

```

O espaço entre os jogos da velha e o texto são _essenciais_.

### Código

Nós temos algumas opções de código. Podemos querer adicionar códigos em Julia ou blocos de código sem especificar uma linguagem. Também podemos colocar códigos na própria linha de texto, como eu fiz acima.

Vou começar com blocos de código: para blocos em Julia, use:

```

```julia

2+2

```

```

O bloco é aberto com três acentos graves (ou crases) e fechados com três acentos graves.

Se o código não for em julia, basta abrir os três acentos graves sem escrever depois julia:

\`\`\`

2+2

\`\`\`

Para escrever código na mesma linha, basta abrir e fechar o acento grave: \`2+2\` gera `2+2`. Para usar código em julia, basta fazer \`j codigo \`. Veja que todo código em Julia vai ser processado pelo Weave, e ele pode encontrar erros que vão aparecer no documento final.

Em teoria você pode misturar linguagens no mesmo documento: o R Markdown aceita código em Julia. Eu não recomendo. Em um exemplo concreto, suponha que eu esteja no R e queira rodar código em Julia. O que vai ser feito é:

1. O R vai chamar um pacote que liga o Julia ao R
2. Os comandos vão ser passados do R para o Julia
3. O Julia vai rodar e cuspir os resultados
4. Volta para o R
5. O pacote se encarrega de acertar isso no documento

Chances são de que algum desses passos vai dar trabalho.

### Matemática

É igual a grafia do LaTeX. Só que sem os ambientes como `\begin{equation}`etc., só o \$ para textos na linha e \$\$ para textos separados do texto. 
