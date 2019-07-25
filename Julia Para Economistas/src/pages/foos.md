@def title = "Funções"

Nós já construímos funções matemáticas simples anteriormente. Aqui, nós vamos nos aprofundar em como construir funções mais complexas, que não necessariamente são uma única operação matemática, mas podem ser um conjunto de instruções para o computador.

Eu temo que essa seção seja excessivamente abstrata. Eu peço desculpas ao leitor que é novo em programação e não consegue ver exatamente porque todos esses tópicos são interessantes. O exemplo promete mostrar muitas das coisas que desenvolvemos aqui sendo aplicadas - espero que ela justifique os tópicos apresentados.

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

Veja que isso não é a verdadeira utilidade dessa maneira de escrever a função. A grande vantagem é poder passar várias linhas de código. Por exemplo, uma função boba que nos diz se um número é positivo ou negativo pode ser escrita:

```julia

function f(x)
  if x > 0
    print("Positivo")
  elseif x < 0
    print("Negativo")
  else
    print("Zero")
  end
end
```

Onde nós exploramos o if na parte de [controle de fluxo](/pub/Controledefluxo.html). Veja que da maneira que foi escrito, se você passar algo não númerico, ele vai informar que é zero. Nós podemos contornar esse problema de duas maneiras:

1. Colocando um if que testa se é númerico
2. Limitando o tipo de input que a função recebe. Veja que isso é meio matar uma mosca com um tiro de canhão, mas é uma ilustração útil dessa opção. Vamos limitar a função para x só poder ser do tipo `Float64`:

```julia

function f(x::Float64)
  if x > 0
    print("Positivo")
  elseif x < 0
    print("Negativo")
  else
    print("Zero")
  end
end
```

Veja que se passarmos o número 1, o Julia retorna um erro de que o tipo não está certo. Uma coisa legal do Julia é que nós podemos definir a _mesma função duas vezes com tipos diferentes_:

```julia

function f(x::Int64)
  if x > 0
    print("Positivo")
  elseif x < 0
    print("Negativo")
  else
    print("Zero")
  end
end
```

Agora, co-existem dois tipos de `f`: uma que é chamada se o input é um `Int64` e outra se o input for `Float64`.

## _Return_

Suponha que escrevemos uma função que faz várias coisas e queremos que ela retorne apenas um resultado. Isso é bastante frequente: talvez tenhamos um loop dentro da função e queremos retornar um array criado no loop. Para isso usamos a _keyword_ return:

```julia

function foo(args)
  um monte de coisa
  return resultado
end
```

Uma característica do Julia é que - assim como o matlab, mas diferentemente do R - uma função pode retornar vários objetos:

```julia

function foo(args)
  um monte de coisa
  return resultado1, resultado2...
end
```

Se você criar vários objetos ao chamar a função, cada objeto vai receber um resultado:

```julia

res1,res2 = foo(args)
```

Um comportamento curioso é que se você pede para a função retornar $n$ coisas e só passa um objeto ele retorna tudo em um único objeto. Eu vou deixar $n=3$:

```julia

function foo2(args)
  um monte de coisa
  return resultado1, resultado2,resultado3
end

res = foo2(args)
```

Nesse caso, res vai ter resultado1, resultado2 e resultado3. Já se passarmos dois objetos, ele vai retornar os dois primeiros resultados e jogar o terceiro fora:

```julia

res1,res2 = foo2(args)
```

Agora `res1` contém `resultado1` e `res2` contém `resultado2`

# Argumentos: ordem, nome e defaut

Outra coisa peculiar do Julia é que os argumentos devem ser passados na ordem em que eles foram escritos na função e sem o nome. Assim:

```julia

foo(a,b,c)
  função
end

foo(val_a,val_b,val_c)
```

Veja que se você passar o valor de b(`val_b`) na primeira posição, ele vai usar isso no argumento a. Isso pode ser um desastre se você é desorganizado _e_ não lembra da ordem que colocou os argumento - o que certamente é o caso do autor deste manual. Nesse caso, pode ser conveniente ter como escrever qual argumento você está usando (como é o padrão do R, por exemplo). Para isso, ao definir a função, usamos o `;`. Os argumentos depois do `;` _obrigatoriamente_ tem que ser chamados com o nome. A divisão de argumentos depois se dá normalmente, usando a vírgula. Assim, poderíamos reescrever a função `foo` acima:

```julia

foo(;a,b,c)
  função
end

foo(b = val_b,a = val_a,c = val_c)
```

Veja que podemos misturar argumentos que devem ser chamados com nome e chamados sem o nome:

```julia

foo(a,b;c,d)
  função
end

foo(val_a,val_b,d = val_d,c = val_c)
```

Muitas vezes, para facilitar a vida do usuário, queremos colocar valores padrões para a função. Por exemplo, o algoritmo de otimização está implícito no comando `optimize`. Nós podemos fazer isso no Julia simplesmente colocando um `=` no argumento da função e um valor ao escrever a função. Por exemplo, uma função que soa dois números, a e b. Eu vou fazer de forma que se não passarmos nenhum valor para b, b = 0:

```julia

function soma(a,b=0)
  a+b
end
```

# Exemplo

Vamos colocar todas as ideias dessa página e mais algumas da seção de [controle de fluxo](/pubs/Controledefluxo.html) para construir uma função que resolve a [Equação de Lyapunov](https://en.wikipedia.org/wiki/Lyapunov_equation). Esta equação aparece com frequência em problemas econômicos e resolver é bem simples. Como motivação, considere o VAR (_Vector Autoregression_):

$$x_{t+1} = Ax_t + u_t$$

Onde $u_t$ é um erro estocástico com variância dada pela matriz $\Sigma_u$. Se nós quisermos a variância de $x_{t+1}$, teremos:

$$Var(x_{t+1}) = AVar(x_t)A^{\prime} + \Sigma_u$$

Se o processo é estacionário (o que exige algumas condições sobre a matriz A), então $Var(x_{t+1}) = Var(x_t)$ - nós vamos tamvém chamar $Var(x_t)$ de $\Sigma_x$. Veja que como produto matricial não comuta, nós não conseguimos colocar $Var(x_t)$ em evidência.

Uma estratégia para resolver esse problema é iterar a seguinte equação (eu li essa solução em um artigo famoso, [Tauchen (1986)](https://doi.org/10.1016/0165-1765(86)90168-0)):

$$\Sigma_{j+1} = A \Sigma_j A^\prime + \Sigma_u$$

Até convergência, onde $j$ indexa a iteração. Veja que para o primeiro passo do algoritmo precisamos de um chute inicial Vamos construir uma função que faça isso. Nossa função vai receber:

1. A matriz A
2. A matriz $\Sigma_u$
3. A tolerância e o número máximo de iterações

A tolerância é qual o tamanho da mudança entre as iterações $j$ e $j+1$ necessários para o algoritmo parar: se a mudança for abaixo da tolerância, nós retornamos a matriz obtida como a matriz que resolver o problema.

Nossa função vai receber os argumentos de (3) com nome, usando a sintaxe do `;`. Para o chute inicial nós vamos usar a matriz identidade. Esse chute é razoável porque, dada a nossa motivação (calcular a matriz de variância covariância de um processo autoregressivo), nós gostariamos que uma solução atendesse a duas características: primeiro, simétrica; segundo, que todas as entradas na diagonal principal fossem positivas. A matriz identidade atende a essas propriedades. Para usar `I` como a matriz identidade (como discutido na parte de Álgebra Linear), vamos precisar carregar o pacote **LinearAlgebra**. O coração da nossa função vai ser um `while` que, enquanto nós não alcançamos a convergência - ou o número máximo de iterações - que faz a conta da matriz $\Sigma_x$:

```julia

function solve_lyapunov(A,Sigma;tol=1e-6,iter_max=100)
  err = 1
  j = 1
  sol = I
  while j <= iter_max && err > tol
  old_sol = sol
  sol = A*old_sol*A' + Sigma
  j += 1
  err = maximum(abs.(old_sol-sol))
  end
  return sol,j,err
end
```

Veja que eu escrevi a função de maneira que ela retorna três objetos: a matriz resultado, o número de iterações e o tamanho da diferença entre a última e a penúltima iteração. Vamos fazer um pequeno teste e mostrar as opções de como salvar os diferentes elementos que a função retorna:

```julia

A=[0.5 0.2;-0.4 0.6]

solucao,tentativa,err = solve_lypaunov(A,I)
solucao = solve_lypaunov(A,I)
solucao,resto = solve_lypaunov(A,I)
solucao,resto = solve_lypaunov(A,I, iter_max=500, tol = 1e-10)
```
