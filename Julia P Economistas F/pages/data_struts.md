@def title = "Estruturas de dados"

# Estruturas de dados

Nós já discutimos algumas estruturas de dados, como o _Array_. Nessa seção eu também apresento o `structure`.

## Arrays

_Arrays_ são basicamente matrizes. Nós podemos gerar uma matriz $4 \times 4$ de zeros fazendo:

```julia

mat = zeros(4,4)

```

_Arrays_ são mais gerais que matrizes porque eles podem ter mais de duas dimensões. Nós poderíamos ter um array $4 \times 4 \times 4$, e isso é trivialmente simples de fazer:

```julia

array1 = zeros(4,4,4)

```

Pode não ser óbvio _porque_ você quer objetos desse tipo. Um exemplo é algum modelo em que você discretiza o espaço de estados e ele tem mais de duas dimensões (ou você quer salvar as diferentes interações para checar a convergência). 

Se eu quisesse acessar um elemento do `mat`, bastaria fazer `mat[2,3]`. Para acessar a terceira linha inteira, faríamos `mat[3,:]`. 

Nós também podemos usar esta mesma maneira para alterar elementos dos _arrays_. Suponha que eu quero que o elemento do `array1` na posição $[1,1,1]$ seja 1:

```julia

array1[1,1,1] = 1

```

Uma coisa um pouco mais safada é alterar _todos_ os elementos da primeira linha para 1:

```julia

array1[:,1,1] .= 1

```

(Note o ponto antes do igual)

### Arrays de Arrays

Apesar de nós normalmente pensarmos nas entradas de uma matriz como números, o Julia permite coisas absolutamente bizarras, como Arrays de Arrays:

```julia 

aa = [[1 2 3], [4 5 6]]

```

Usar `aa[1]` retorna um array! Apesar de isso parecer meio bizarro, pode ser útil e ocorre com frequência quando usamos `map` (que vai ser apresentado na seção de funções). Por exemplo, o seguinte código vai gerar um array com 10 elementos e cada elemento é um array de 100 elementos:

```julia

map(x->x*randn(100,1:10)

```

### Arrays esparsos

Alguns problemas usam arrays com muitos zeros. Três situações dessas: 
* Soluções de algumas equações diferenciais parciais (que atualmente aparecem em macro, por exemplo)
* Matrizes de adjacência, que listam quem é vizinho de quem: se o sujeito da linha 10 é vizinho da linha 42, então a entrada (10,42) é igual a 1
* Quando calculamos jacobiano de um modelo e alguns parâmetros dependem apenas de poucos parâmetros estruturais

Nesse caso nós gostaríamos de trabalhar com matrizes que só salvam as entradas que são diferentes de zero. Faça o seguinte exercício mental: pense numa matriz 100 por 100 que só tem a diagonal principal. Agora temos duas representações: a primeira envolve escrever a matriz (provavelmente num pedaço de cartolina!) ou simplesmente: "uma matriz diagonal com tais números". Mesmo se você precisar listar 100 números em ordem é muito mais curto que a nossa matriz gigante. 

Faz sentido que isso também funcione para computadores, e isso é feito com matrizes esparsas. Para isso precisamos carregar a a biblioteca `SparseArrays`. 

## Structures

_Arrays_ impõe uma estrutura tabular aos dados - que é até mais versátil que pode parecer a primeira vista. Porém, nós às vezes queremos que trabalhar com matrizes de diferentes tamanhos. Nós poderíamos deixar todas as matrizes soltas por ai, mas amarrar todas elas no mesmo objeto permite que o código fique mais fácil de usar por outras pessoas - e frequentemente as outras pessoas somos nós mesmos alguns meses depois! Outra vantagem é que nós podemos passar um objeto para a função e deixar a função operar a partir do objeto. 

Estruturas vem em dois sabores: `struct`ou `mutable struct`. Vamos primeiro focar na sintaxe e depois eu explico a diferença: uma estrutura tem campos, então vamos criar uma estrutura chamada `teste`, com campos `a` e `b`:

```julia

struct teste
	a
	b
end

```

Isso _não cria_ um objeto chamado teste. Isso diz a linguagem que um objeto que for uma estrutura do tipo teste deve ter campos a e b. Agora eu posso criar um objeto que é uma estrutura do tipo teste, e que vai ter `a` igual à 1 e `b` igual à 2:

```julia

tt = teste(1,2)

```

Nós podemos acessar os valores da estrutura  usando `objeto.campo`: por exemplo, `tt.a` retorna 1 e `tt.b` retorna 2. 

Cumprindo a minha promessa, vamos falar da diferença entre `struct` e `mutable struct`: uma vez que você criar um objeto que é uma `struct` nenhum dos campos podem ser mudados. Por exemplo:

```julia

struct minha_estrut
	a
	b
end

aa = minha_estrut(1,2)

```

Agora se tentarmos fazer `aa.a= 2` o Julia acusa um erro. Em compensação, se minha estrutura fosse criada com um `mutable struct`, nós poderíamos mudar o valor dela. 

### Por que estruturas imutáveis?

(Você pode pular esse parágrafo e seguir para o próximo sem se perder)

Veja que estruturas mutáveis tem um sério problema: elas podem ser alteradas em qualquer momento do código (duh). Isso pode ser ruim: suponha que duas funções acessam a estrutura `minha_estrut`: a função `foo` altera o campo a para 2; a função `bar`checa se os dois campos são iguais. Rodar `foo` e depois `bar` gera um resultado, mas rodar `bar` e depois `foo` gera outro. Isso pode parecer um exemplo inventado, mas quando começamos a falar de paralelização, isso se torna um problema de verdade!

