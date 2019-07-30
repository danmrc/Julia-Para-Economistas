@def title = "Miscelâneas"

**Estes são tópicos que ainda não encontrei um lugar adequado para colocar - mas que são úteis**

## Salvando resultados

Depois de realizar uma longa simulação, além dos gráficos que geramos, muito provavelmente vamos querer salvar algum tipo de informação da simulação. Muitas vezes queremos salvar de maneira que o objeto seja preservado, ou seja, se geramos um array $3 \times 4 \times 2$, nós vamos querer guardar ele dessa maneira. O pacote **JLD** traz uma maneira de salvar dados preservando o formato: o comando é `save` e recebe como primeiro argumento o nome do arquivo; depois o nome que cada objeto vai receber ao ser carregado (portanto, uma _string_) e o objeto. Se tivermos vários objetos, colocamos nome, objeto, nome, objeto...

Um exemplo vai ajudar: Suponha que temos os objetos `kgrid`e `cons`. Ambos são arrays. Vamos salvar em um arquivo chamado _resultados.jld_ - preste atenção na extensão do arquivo. Teríamos apenas que, depois de carregado o pacote, fazer:

```julia

save("resultados.jld","kgrid",kgrid,"cons",cons)

```

Se quisermos carregar o objeto, basta usar `load`:

```julia

resuls = load("resultados.jld")

```

Veja que eu designei um objeto que recebe as variáveis carregadas. Esse objeto vai ser um dicionário, então para acessar o objeto `kgrid`, por exemplo, bastaria digitar `resuls["kgrid"]`.

# Funções com o mesmo nome em pacotes diferentes

Algumas vezes dois pacotes dão o mesmo nome para duas funções que fazem coisas diferentes. São vários pacotes com vários contribuidores diferentes, e é de se esperar que alguns nomes sejam repetidos.

A maneira do Julia contornar isso é similar com a do Python: use `nome do pacote.função`. Assim, se o por algum motivo a função `optimize` do pacote **Optim** conflita com algum outro nome de função de outro pacote, poderíamos chamar o optimize usando `Optim.optimize()`.

Veja que, quando carregamos pacotes e dois nomes nos pacotes entram em conflito, o Julia nos avisa com um Warning. Por exemplo:

```julia
WARNING: using Optim.optimize in module Main conflicts with an existing identifier.
```

# Chamando arquivos de fora

É bastante comum separar funções do corpo principal do código. Em geral, podemos ter um arquivo com funções (ou uma só) e queremos carregar ela no nosso código. Nós podemos fazer isso usando o comando `include`. Suponha que eu tenha um arquivo com funções chamado _foo.jl_. Posso carregar as funções dele usando:

```julia
include("foos.jl")
```

Veja que se a sua função usa algum código de outro pacote, você pode simplesmente colocar no começo do arquivo _foo.jl_  uma linha chamando esse pacote. Isso não é uma aberração, mas sim a maneira como o manual do Julia sugere que você faça.
