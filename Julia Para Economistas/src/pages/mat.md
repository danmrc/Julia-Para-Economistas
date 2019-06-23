@def title = "Matemática no Julia"

Nessa seção vamos focar nas ferramentas matemáticas que serão úteis para a gente no Julia. Elas em geral vem em forma de pacotes. Nós vamos focar em : otimização, achar a raiz e . Os pacotes que vamos usar são o **Optim**, o **Roots** e o . Eu também vou tratar de fazer gráficos no Julia - que são sempre de grande valia para

## Plots

O pacote **Plots** amarra vários outros pacotes que fazem gráfico em uma interface comum. Um exemplo bem simples é fazer o gráfico da função $2x^3+3x^2$. Primeiro de tudo, vou carregar o pacote. Depois, vamos definir a função para depois fazer o gráfico:

```julia

using Plots

g(x) = 2x^3+3x^2
plot(g)

```

Veja que podemos querer ver a função em um intervalo diferente, por exemplo, -5 e -4. Fariamos:

```julia

x = -5:0.01:-4

plot(x,g.(x))

```

Basicamente estamos gerando um grid de valores, espaçados em $0.01$ e avaliando a função em todos os pontos. Veja que a primeira vez que chamamos o plot ele é um pouco lento em gerar a imagem. Isso é só na primeira vez em cada vez que rodamos o Julia - chamadas subsequentes são mais agéis.

Podemos querer fazer o gráfico de outra função por cima. Para isso, basta usar o plot com uma exclamação depois (`plot!`). Vou fazer o gráfico da função que já definimos e da função $2x^3-3x^2$:

```julia
h(x)=2x^3-3x^2
plot(g)
plot!(h)

```
Veja a página sobre gráficos para saber mais sobre como fazer gráficos no Julia.

## Optim

Nós já tivemos um primeiro encontro com o Optim em um momento anterior. O Optim faz otimização tanto em funções uma variável quanto em funções de várias variáveis. Vamos começar com o exemplo que eu já dei:

```julia

using Optim

f(x) = x^2

optimize(f,-1,1)
```

O comando `optimize` recebe tres argumentos quando buscamos o ótimo de uma função de uma variável: a função, o menor valor do intervalo a ser buscado e o maior valor. Nesse caso, buscamos o mínimo da função f entre -1 e 1. Veja que o comando sempre busca o mínimo: para encontrar o máximo de uma função, basta multiplicar a função por -1. Vamos procurar o máximo da função $\frac{1}{1+x^2}$, que tem a seguinte cara:

![](/src/imagens/logistica.png)

Veja que como queremos o máximo, vamos ter que multiplicar a função por -1. Eu vou definir ela direto com um menos na frente:

```julia
l(x) = -1/(1+x^2)
optimize(l,-2,2)

```

Veja que dessa vez eu deixei o intervalo maior, mas o optimize não deve ter problemas em conseguir achar o mínimo - que no nosso caso é o máximo.

Veja que podemos querer encontrar o ótimo de uma função de várias variáveis. O Optim também nos dá essa possibilidade.


## Roots

O pacote roots permite achar raízes de funções. 
