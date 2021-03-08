@def title = "Ex.: MQO"

Vamos implementar o estimador de Mínimos Quadrados no Julia. Temos duas maneiras de proceder:

* Usando as rotinas de otimização do Julia
* Usando notação matricial

Veja que o segundo é uma consequência direta do problema de otimização ter solução fechada.

Nenhum dos códigos vai funcionar sem dados - quem rodaria um MQO sem ter dados. Vamos criar os nossos. O comando `randn` gera um array de números saídos da normal padrão. 

```julia

X = randn(100,5)
beta = [1;2;0.5;-1;0.9]
y = X*beta + randn(100)

```

# Usando otimização

Nós vamos usar o `Optim`. A função objetivo é $\sum_j (y_j - X_j \beta)^2$

```julia

	obj(beta,X,y) = sum((y-X*beta).^2)
	
```

Então usando o Optim, lembre que o optimize recebe a função e um chute inicial para o valor do ótimo. Nós podemos fazer:

```julia

using Optim
res = optimize(b->obj(b,X,y),zeros(size(X,2)))

```


# Usando matrizes

A solução de MQO matricialmente é:

$$
\hat{\beta} = (X^{\prime}X)^{-1} X^{\prime}y
$$

Eu to usando o apóstrofe para denotar transposta. Não fique com medo da fórmula: se você só viu a fórmula para um regressor, a ideia é idêntica. A variância está "embaixo" e é o $X^{\prime}X$. A covariância é simplesmente $X^{\prime}y$. 

Veja que eu posso implementar isso tudo em uma linha no Julia:

```julia

mqo(X,y) = inv(X'*X)*X'*y

```

