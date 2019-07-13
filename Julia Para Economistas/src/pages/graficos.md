@def title = "Gráficos"

Essa página trata extensivamente de como fazer gráficos no Julia. A principal biblioteca para isso é o **Plots**, que é "só" um pacote que amarra vários outros com uma sintaxe comum. Eu vou mostrar no fim como mudar qual pacote está sendo usado para fazer os plots, mas eu acho que o padrão (GR) produz resultados extremamente aceitáveis - melhor que os plots usuais do R, por exemplo.

## O Básico

Podemos querer fazer o gráfico de uma variável, y, que é uma função continua como $x^2$. Para isso, basta definir a função e passar para o comando `plot`:

```julia

using Plots

f(x) = x^2

plot(f(x))
```

Se quisermos fazer o plot em um conjunto de valores de x específicos podemos gerar eles usando os comandos que geram sequência e passar para o comando plot e para a função:

```julia

xx = -2:0.01:2
plot(xx,f.(xx))
```

Basicamente estamos gerando um grid de valores, espaçados em $0.01$ e avaliando a função em todos os pontos. Veja que a primeira vez que chamamos o plot ele é um pouco lento em gerar a imagem. Isso é só na primeira vez em cada vez que rodamos o Julia - chamadas subsequentes são mais agéis.

Podemos querer fazer o gráfico de outra função por cima. Para isso, basta usar o plot com uma exclamação depois (`plot!`). Vou fazer o gráfico da função que já definimos e da função $2x^3-3x^2$:

```julia
h(x)=2x^3-3x^2
plot(g)
plot!(h)
```

Veja que ao usar o `plot!`, o gráfico automaticamente muda o tamanho do eixo y e coloca a nova linha com uma cor diferente.

Nós podemos fazer várias mudanças no gráfico. Entre as mais frequentes:

* w muda a espessura da linha. É um número inteiro.
* line muda o tipo da linha. O argumento é escrito de uma maneira curiosa: é `:algumacoisa`. Assim, `:dash` gera uma linha tracejada, `:solid` gera uma linha inteira (que é o default). Veja outras opções no site do Plots.
* label muda a legenda. É uma string.
* legend muda a posição da legenda. É como no line, e recebe um argumento com dois pontos. `:topleft` muda a legenda para o canto esquerdo superior (o padrão é no canto direito) etc.

Eis aqui uma ilustração do uso desses argumentos:

```julia

plot(x,g.(x),legend = :topleft,label = "g(x)")
plot!(x,h.(x),line = :dash,label = "h(x)",w=2)
```

![](/src/imagens/grafico_ex1.png)

## Pontos, não linhas

O `plot`, por default, faz linhas. Às vezes queremos o gráfico exibindo uma nuvem de pontos e não linhas. O comando `scatter` faz isso. Por exemplo, eu posso gerar 100 números saídos de uma Normal com média 0 e variância 1:

```julia

vals =  randn(100)
scatter(vals)
```

![](/src/imagens/grafico_ex2.png)

Nós podemos usar `scatter!` para colocar pontos por cima ou até mesmo `plot!` para colocar uma linha no gráfico.

## Salvando o resultado

Uma vez que você esteja satisfeito com o gráfico, salvar é bem simples: basta usar `png(caminho do arquivo)`. No caso dos gráficos para este site, por exemplo:

```julia
png("C:\\Users\\User\\Documents\\GitHub\\Julia-Para-Economistas\\Julia Para Economistas\\src\\imagens\\grafico_ex2")
```
Obviamente, isso salva o arquivo no formato png - que é o mais comum hoje em dia e tem tamanho bastante aceitável. Outros formatos estão disponíveis. Infelizmente, _eps_, que é um formato usado com frequência em documentos do LaTeX, não está implementado para o GR, e não existe um comando `eps()` (até onde eu sei).
