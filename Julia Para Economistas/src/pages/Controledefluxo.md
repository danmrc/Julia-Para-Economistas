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

(O While exige o uso da _keyword_ global, então leia a seção mesmo que _en passant_)

O While é, como o for, um _loop_. A diferença é que enquanto o for repete a mesma operação $n$ vezes, o while repete uma operação até uma certa condição passar a ser falsa. Poderíamos repetir o mesmo exemplo acima usando o while:

```julia

i = 1

bb = zeros(10)

while i <= 10
  bb[i] = sqrt(i)
  global i = i + 1
end
```
Veja que isso involve várias linhas de código a mais que o for. A utilidade do While vai ficar clara mais abaixo. Vamos focar primeiro na estrutura do problema.

Primeiro, temos que declarar o valor da variável que indexa o _loop_ antes do _while_. Na declaração do _while_, colocamos a condição que deve ser atentida para o programa se repetir - nesse caso, i deve ser menor ou igual a 10.

No final do loop, precisamos acrescentar + 1 na variável i, coisa que o for faz "automaticamente" sem a gente ver. Esquecer esse passo é uma ótima maneira de fazer um programa que nunca para de rodar (teste rodar o while sem essa linha). Veja que antes do i eu usei um `global`. Isso se deve a maneira como o Julia interpreta as coisas: variáveis dentro de um loop são "locais" (pertencem ao loop) exceto se denotadas como `global` OU se foram previamente declaradas. Por exemplo, fazer:

```julia
for i in 1:10
   a = i
 end

 a
```
Deve retornar um erro dizendo que a variável a não existe. Entretanto,

```julia
for i in 1:10
   global a = i
 end

 a
```
Deve retornar 10. Algumas linguagens, como o R, não fazem essa diferenciação, o que pode ser positivo (reduz a quantidade de coisas que entram no código) ou negativo (um loop na dentro de outro loop dentro de um terceiro loop muda uma variável que você deu o mesmo nome duas vezes)~~~<a href="#note1" id="note1ref"><sup>1</sup></a>~~~. O que acontece quando nós definimos variáveis dentro de loops que por sua vez são passados para loops dentro deste loop? A próxima seção trata disso.

Não parece óbivo porque usar o `while` quando isso requer pelo menos duas linhas de código a mais (além das altas chances de você esquecer a etapa da soma 1). A justificativa é muito simples: em muitos algoritmos queremos repetir a operação até uma certa condição ser satisfeita. Por exemplo, poderíamos buscar o equilíbrio de um mercado da seguinte maneira: chute um preço inicial e compute a demanda e a oferta. Se a oferta for maior que a demanda, reduza o preço em x. Caso contrário, aumente em x. Faça isso até a diferença entre oferta e demanda ser pequena. Este passo final é facilmente implementável em um loop: `while diff > 0.000000001` faria o truque. 


## Loops dentro de Loops e variáveis globais

Uma pergunta honesta é como o Julia

~~~
<a id="note1" href="#note1ref"><sup>1</sup></a>O R tem uma maneira própria de lidar com esse tipo de coisa, via ambientes. Isso impede que dois objetos com o mesmo nome dentro de dois pacotes diferentes entrem em colisão.
~~~
