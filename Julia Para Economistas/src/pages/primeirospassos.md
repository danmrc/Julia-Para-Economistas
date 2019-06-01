@def title = "Primeiros passos"
@def hascode = true
@def hasmath = true

Tendo instalado o Julia e um IDE, vamos dar os primeiros passos para usar a linguagem.

A primeira coisa é que podemos usar o Julia como uma grande calculadora:

```julia

2+2
```

Isso deve te retornar 4. Obviamente essa não é a maior utilidade do Julia.

## Criando matrizes e arrays

Vamos começar construindo e acessando matrizes e arrays. Isso vai nos mostrar várias coisas da linguagem. Arrays são matrizes com mais de duas dimensões - ou melhor dizendo, matrizes são arrays de 2 dimensões. O Julia não tem nenhum problema em gerar arrays com números arbitrários de dimensões. Vamos gerar uma matriz de zeros:

```julia
primeiro_obj = zeros(5,5)
```

E agora podemos acessar o `primeiro_obj` e ver que ele é simplesmente 5 colunas e 5 linhas de zero. Veja que para dar nome a um objeto no Julia usamos o sinal de igualdade. Vamos continuar brincando, mas dessa vez eu vou gerar um array de _três_ dimensões com números sorteados da distribuição normal (0,1) (números aleatórios):

```julia
segundo_obj = randn(5,2,3)
```

Vamos acessar o primeiro elemento de cada dimensão dos dois objetos. Para isso, usamos o colchetes (como no R) e o primeiro elemento é 1, não 0 (atenção usuários de Python!):

```julia

primeiro_obj[1,1]
segundo_obj[1,1,1]
```

Para acessar uma linha inteira ou uma coluna (e suas generalizações para arrays de dimensão maior), usamos `:` na dimensão que queremos pegar (como no Matlab). Por exemplo, para acessar a primeira linha do `primeiro_obj`

```julia
primeiro_obj[1,:]
```

Se quisermos a matriz que corresponde a primeira dimensão do segundo objeto, fariamos:

```julia
segundo_obj[1,:,:]
```
As vezes nós queremos saber qual o tamanho de cada dimensão, e o comando do Julia para isso é `size`:

```julia
size(primeiro_obj)
```

Isso deve ter retornar `(5,5)`.

As vezes nós queremos construir matrizes elemento a elemento. No Julia, espaço separa elementos na mesma linha e o `;` separa as linhas. Assim, para fazer a matriz:

$$A = \begin{bmatrix}
1&3 \\
3&4\\
\end{bmatrix}
$$

Fariamos:

```julia
A = [1 2; 3 4]
```

Se quisermos mudar um único elemento na matriz A, podemos usar a indexação usando colchete  e o igual. Por exemplo, vamos mudar o elemento 2 da matriz A (correspondente a posição [1,2]) para zero.

```julia

A[1,2] = 0

```

## Funções básicas

Podemos criar funções matemáticas de maneira muito natural: defina a função, entre parênteses os argumentos e use a igualdade para definir a função. Uma utilidade Cobb Douglas de dois bens, $x$ e $y$ com paramêtro $\alpha$, seria implementada:

```julia

u(x,y,alfa) = alfa*log(x) + (1-alfa)*log(y)

```

Onde `log` é a função logaritmo natural (ou neperiano). Usamos ela como qualquer outra função:

```julia

u(1,1,0.5)

```

## Operadores

O Julia, como quase toda linguagem de programação, tem alguns operadores pré definidos que fazem exatamente o que esperamos que eles façam. Por exemplo, + soma dois objetos, se isso for possível (não podemos somar um número com uma matriz). Subtração (-), multiplicação (*), divisão (/) exponenciação (^) são outros operadores comuns. Além disso, podemos querer testar igualdade e relações de ordem - maior e menor, por exemplo. Igualdade é testada com `==`. Logo `1 == 1` retorna `true` e `1 == 2` retorna `false` (e agora você também sabe como é verdadeiro e falso no Julia). $>$ e $<$ testam relações de ordem.

## Vetorizando qualquer coisa

Uma das melhores coisas do Julia é a vetorização. É melhor explicar isso com um exemplo: suponha que você tem um vetor qualquer `v`. Você quer somar 1 em todas as entradas do vetor. Uma maneira de fazer isso é criar um vetor de 1 da mesma dimensão de `v` e somar. A outra é simplesmente usar o `.+`, literalmente um ponto e o sinal de adição:

```julia
1 .+ v
```

A beleza do Julia é que essa notação de ponto _funciona para qualquer coisa_. se você quer calcular a utilidade Cobb Douglas para cestas de consumo que variam em x e permanecem fixas em y (por exemplo, x indo de 0.1 a 10 e y = 1) sempre, bastaria usar a função definida no tópico anterior e:

```julia
x = range(0.1,10,length=100)
u.(x,1,0.5)
```
Podemos usar isso para designação também. Crie um vetor `aa` contendo 1,2 e 3:

```julia
aa = [1 2 3]
```

Agora suponha que queremos mudar o 2 e o 3 (que convenientemente estão na posição 2 e 3) para 0. Basta fazer:

```julia

aa[2:3] .= 0 #Atenção para o ponto antes do igual

```

## O quão rápido o Julia realmente é?

Uma coisa frustrante nas primeiras vezes que se usa o Julia é a sensação que ele é mais lento que linguagens como R ou Python. O primeiro exemplo pode não sair instantaneamente, apesar de ser uma conta trivial. Como o Julia é mais rápido se nem um 2+2 ele é rápido?

Parte da resposta se deve a maneira como o Julia procede, que é diferente da maneira como o Python procede. Isso faz com que códigos pequenos (por exemplo, 2+2), seja relativamente lento, mas códigos grandes sejam mais rápido.
