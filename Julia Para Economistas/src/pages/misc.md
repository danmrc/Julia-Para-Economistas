@def title = "Miscelâneas"

**Estes são tópicos que ainda não encontrei um lugar adequado para colocar - mas que são úteis**

## Salvando resultados

Depois de realizar uma longa simulação, além dos gráficos que geramos, muito provavelmente vamos querer salvar algum tipo de informação da simulação. Muitas vezes queremos salvar de maneira que o objeto seja preservado, ou seja, se geramos um array $3 \times 4 \times 2$, nós vamos querer guardar ele dessa maneira. O pacote **JLD** traz uma maneira de salvar dados preservando o formato: o comando é `save` e recebe como primeiro argumento o nome do arquivo; depois o nome que cada objeto vai receber ao ser carregado (portanto, uma _string_) e o objeto. Se tivermos vários objetos, colocamos nome, objeto, nome, objeto...

Um exemplo vai clarificar as coisas: Suponha que temos os objetos `kgrid`e `cons`, por exemplo. Ambos são arrays. Vamos salvar em um arquivo chamado _resultados.jld_ - preste atenção na extensão do arquivo. Teríamos apenas que, depois de carregado o pacote, fazer:

```julia

save("resultados.jld","kgrid",kgrid,"cons",cons)

```

Se quisermos carregar o objeto, basta usar `load`:

```julia

resuls = load("resultados.jld")

```

Veja que eu designei um objeto que recebe as variáveis carregadas. Esse objeto vai ser um dicionário, então para acessar o objeto `kgrid`, por exemplo, bastaria digitar `resuls["kgrid"]`. 
