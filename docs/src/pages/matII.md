@def title = "Matemática no Julia II"

No capítulo anterior de matemática, eu falei sobre diversos tópicos como otimização, achar raízes e interpolação. Nessa seção, eu vou tratar apenas de fazer Álgebra Linear no Julia.

Coisas lineares são matematicamente tratáveis e matrizes são objetos fundamentais na matemática. Muitos modelos econômicos não lineares são de alguma forma linearizados para serem tratáveis.

Eu já discuti como criar matrizes no post de [primeiros passos](/pub/primeirospassos.html) e irei pular essa parte. Discutirei futuramente como criar matrizes esparsas - e porque elas são úteis. 

# Primeiros passos

O pacote fundamental para este post é o **LinearAlgebra** - o que não deve ser surpreendente. Ele já vem pré instalado com o Julia e para carregar, basta fazer `using LinearAlgebra`. Isso nos abre a possibilidade de usar diversas decomposições - que serão tratadas na próxima seção - bem como alguns truques úteis. Um deles é que podemos gerar a matriz identidade da seguinte maneira:

```julia

Matrix(I,2,2)
```

Nesse caso, a matriz vai ser $2 \times 2$. Curiosamente, ela vai sair do tipo booleano - ou seja, a diagonal principal vai ter _true_ e o resto das posições vão ser _false_. Nós podemos modificar para termos a matriz númerica usando uma chave com o tipo entre o nome da função e o parêntese:

```julia

Matrix{Float64}(I,2,2)
```

E todos os números vão ser do tipo _Float64_ - não é muito importante entender o porque do 64, mas agora temos uma matriz com zero e um.

Em muitas situações você pode usar o `I` no lugar da identidade, e o Julia vai ajustar para automaticamente fazer as dimensões baterem. Por exemplo:

```julia

I + [1 4;2 3]
```
Retorna:

$$\begin{bmatrix}
2 & 4\\
2 & 4\\
\end{bmatrix}$$

# Decomposições

## Autovalores

Existem várias decomposições úteis em Álgebra Linear. A mais comum é a de autorvalores e autovetores, que pode ser obtida pelo comando eigen~~~<a href="#note1" id="note1ref"><sup>1</sup></a>~~~:

```julia

A = [1 2;3 4]
autos = eigen(A)
```
O objeto autos tem dois elementos, os autovalores e os autovetores, que podem ser acessados via `autos.values` e `autos.vectors`, respectivamente.

## SVD

A _Singular Value Decomposition_ (SVD) é outra decomposição bastante frequente. Uma matriz $A$ decomposta por SVD:

$$ A = U S V^{\prime}$$

Onde $U$ e $V$ são matrizes ortonormais~~~<a href="#note1" id="note1ref"><sup>2</sup></a>~~~ e S é diagonal. Os elemntos de $S$ são conhecidos como valores singulares. O comando do Julia que gera a decomposição svd é `svd`, e o Julia usa os nomes U,S e V para os elementos dentro de um objeto gerado pelo comando `svd`. Veja que S vem como um vetor e podemos organizar ele como uma matriz diagonal usando o comando `Diagonal`, que pega o vetor que você passa para o comando e gera uma matriz diagonal a partir daquele vetor. Assim:

```julia

A = [1 2 2; 2 4 7;9 8 7]

svd_dec = svd(A)

svd_dec.U*Diagonal(svd_dec.S)*svd_dec.Vt
```
A última linha deve ser idêntica a matriz A (tirando erros de arredondamento)

## Schur

A decomposição de Schur é uma decomposição não tão conhecida quantas as duas anteriores, mas é usada em alguns algoritmos em economia. Essencialmente, a decomposição de Schur faz:

$$ A = Z H Z^\prime $$

Onde $Z$ é ortonormal. O comando no Julia é `schur`:

```julia

A = [1 2 2; 2 4 7;9 8 7]

schur_dec = schur(A)

schur_dec.Z*schur_dec.Schur*schur_dec.Z'
```

## Um minuto de Algebra Linear (ou: o que essas 3 decomposições tem em comum)

Vamos gerar a matriz $F = A'A$, sendo A a matriz definida anteriormente. F é simétrica (e portanto, [normal](https://pt.wikipedia.org/wiki/Matriz_normal)). Nesse caso, a matriz $H$ é triangular superior e na diagonal principal tem os autovalores de $F$, e o quadrado dos valores singulares da matriz $A$ são os autovalores de $F$. O código abaixo no Julia checa isso:

```julia
F= A'*A

svd_dec = svd(A)
schur_dec = schur(F)
auto = eigen(F)

schur_dec.Schur
svd_dec.S .^2
auto.values
```

## Decompondo duas matrizes

As três decomposições acima podem ser generalizadas para duas matrizes. Por incrível que pareça, essas generalizações são úteis em economia. A matemática por trás não vem ao caso. Os comandos a serem usados são os mesmos que os anteriores, mas eles agora recebem duas matrizes ao invés de uma. Por exemplo:

```julia

eigen(A,F)
svd(A,F)
schur(A,F)
```

Para ver o que cada um desses comandos retorna, a melhor opção é olhar o help - mas as ideias são muito parecidas com as das três decomposições anteriormente apresentadas.

## Ordernando Schur*

_Nota: essa seção é o detalhe do detalhe. Mas a decomposição de Schur é frequentemente usada em economia (macro, para ser bastante preciso). Por completude, eu adiciono essa seção._

Às vezes precisamos de ordernar a decomposição de schur do maior autovalor generalizado (isso é, o autovalor da decomposição de schur) para o menor, ou o contrário. O comando `ordschur`permite fazer isso de maneira imediata, mas com uma sintaxe meio esquisita (na minha opinião): primeiro um objeto gerado pelo comando `schur`; depois - e esta é a parte esquisita - uma matriz de _true_ e _false_ onde na posição _true_ vão ser ordenadas primeiro e as _false_ vão ser ordenadas por último. Por exemplo:

```julia
A = [1 .2 .5;0 1 0;.1 1 0;]

schur_decomp = schur(A)
ordem = abs.(schur_decomp.values) .< 1

ordschur(schur_decomp,ordem)
```

Garante que os autovalores menores que 1 em módulo vão ser os primeiros na ordenação da matriz. Veja que isso preserva as propriedades da seção anterior sobre multiplicar as matrizes da decomposição de Schur gerar a matriz original.

A mesma ideia pode ser usada para a decomposição de Schur generalizada.

-----

~~~<a id="note1" href="#note1ref"><sup>1</sup></a>~~~Porque em inglês autovalores são _eigenvalues_ e autovetores são _eigenvectors_.

~~~<a href="#note1" id="note1ref"><sup>2</sup></a>~~~ Maneira chique de dizer que o produto interno de duas colunas quaisquer da matriz são ortogonais (tem produto interno zero)
