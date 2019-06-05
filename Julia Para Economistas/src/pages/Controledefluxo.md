@def title = "Fors, ifs, whiles"

Nessa página nós vamos tratar de _controle de fluxo_. Esses são comandos essenciais para construir algoritmos númericos e centrais em qualquer código. Vamos tratar dos três mais comuns: _if_, _for_ e _while_

## Como ler essa seção

Esse capítulo segue a seguinte estrutura: eu apresento os comandos secamente no começo de cada seção: o objetivo é que aqueles que já sabem o que _if_s, _for_s e _while_s fazem possam entender a sintaxe do Julia. Ainda assim, eu sugiro uma leitura, ainda que  Depois, eu discuto o que cada comando faz com detalhes. A última seção apresenta alguns exemplos, e são de interesse geral.

## If

A sintaxe para o _If_ é:

```julia

if condition
  alguma coisa
else
  outra coisa
end

```

_If_s são blocos que permitem que você teste uma condição e execute um comando condicional àaquele condição ser atendida. Caso contrário (_else_) outro comando pode ser executado. Um exemplo simples é testar se um número é positivo:

```julia
  if numero > 0
    println("Positivo")
  else
    println("Negativo")
  end
```

Veja que se você não definir antes a variável `numero`, o Julia vai dar um erro porque a variável não está definida. Por sinal, isso também introduz a função `println`, que "imprime" (escreve) coisas direto no console

Podemos estabelecer `numero = 3` e a rotina acima deve retornar um positivo.

Obviamente, neste exato momento, como $0 = 0$, o comando vai testar como falso e vai retornar que zero é negativo! Nós temos duas soluções possíveis:

1. Trocar o $>$ por >=. Agora testamos se 0 é maior ou igual que zero; se sim, ele retorna "positivo". Caso contrário, negativo.
2. Nós podemos querer que, quando o número for zero, ele retorne "zero"

No segundo caso nós teríamos que adicionar mais um teste. Para adicionar um else seguido de um novo teste lógico, nós usamos o `elseif`, tudo junto. Modificando o exemplo, nós teríamos:

```julia
  if numero > 0
    println("Positivo")
  elseif numerro == 0
    println("Zero")
  else
    println("Negativo")
  end
```

Nós poderíamos amarrar isso em uma função para permitir o teste ser realziado para qualquer número repetidas vezes. Faremos isso mais para frente.

## For

A sintaxe para o for é:

```julia

for i in 1:numero
  operações
end

```

Ou:

```julia

for i in vetor
  operações
end

```

O `for`permite repetir algum conjunto de operações um número de vezes - por isso ele é conhecido como um loop. Um exemplo bobo e simples é tirar o quadrado de todos os número de um vetor de 1 a 10:

```julia
  bb = zeros(10)
  for i in 1:10
    bb[i] = sqrt(i)
  end
```

A cada etapa i, o Julia tira a raiz de i `sqrt(i)` e associado o valor a posição i do vetor `bb`. Veja que uma solução muito mais simples para o mesmo problema seria fazer `bb = sqrt.(1:10)`, usando a discussão anterior de vetorizar funções e gerar sequências.

Nosso exemplo acima é extremamente simples para ser ilustrativo: o _for_ é realmente útil, especialmente em simulações.

## While

O While é, como o for, um _loop_. A diferença é que enquanto o while...
