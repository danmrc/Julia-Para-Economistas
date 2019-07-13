@def title = "Gráficos"

Essa página trata extensivamente de como fazer gráficos no Julia. A principal biblioteca para isso é o **Plots**, que é "só" um pacote que amarra vários outros com uma sintaxe comum. Eu vou mostrar no fim como mudar qual pacote está sendo usado para fazer os plots, mas eu acho que o padrão (GR) produz resultados extremamente aceitáveis - melhor que os plots usuais do R, por exemplo.

## O Básico

Podemos querer fazer o gráfico de uma variável, y, que é uma função continua como $x^2$. Para isso, basta definir a função e passar para o comando `plot`:

```julia

f(x) = x^2

plot(f(x))

```

Se quisermos fazer o plot em um conjunto de valores de x específicos podemos gerar eles usando os comandos que geram sequência e passar para o comando plot e para a função:

```julia

xx = -2:0.01:2
plot(xx,f.(xx))

```
