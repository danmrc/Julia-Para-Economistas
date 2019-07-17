@def title = "Funções"

Nós já construímos funções matemáticas simples anteriormente. Aqui, nós vamos nos aprofundar em como construir funções mais complexas, que não necessariamente são uma única operação matemática, mas podem ser um conjunto de instruções para o computador

# Revisão: funções matemáticas

Nós vimos que a sintaxe para escrever uma função matemática no Julia era bastante simples: nós escrevemos como nós escreveríamos no papel.

```julia

f(x) = x^2
```

Isso vale para funções com mais de uma variável também:

```julia

f(x,y) = x^2+y^2
```

# Funções usando o _function_

Agora, podemos querer fazer funções que são mais complicadas: elas podem envolver uma série de operações que não podem ser descritas com uma única linha. Nesse caso, usamos o comando `function`:

```julia

function foo(args)
  operações
end
```

Isso vai gerar uma função com nome `foo`. Vamos refazer $f(x,y)$ usando esse formato apenas para termos um exemplo concreto:

```julia

function f(x,y)
  x^2+y^2
end
```
