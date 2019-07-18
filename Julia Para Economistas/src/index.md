@def title = "Julia para Economistas"

<!-- Note: by default hasmath == true and hascode == false. You can change this in
the config file by setting hasmath = false for instance and just setting it to true
where appropriate -->

**Ainda em construção, muitas coisas serão adicionadas e mudadas!**

Esse é um pequeno manual sobre a linguagem de programação Julia, voltado em especial para os economistas - mas se você é de outra área e tem interesse em aprender a linguagem esse manual pode ser útil! Você pode acessar os capítulos deste manual no menu ao lado. Esse manual foi escrito e gerado usando o Julia.

Se você sabe ler em inglês eu sugiro fortemente checar o [quant.econ.net](https://lectures.quantecon.org/jl/), do Thomas Sargent, John Starchurski e Jesse Perla. Esse manual pode ser visto como uma versão piorada do quant.econ. Mas imitação é a maior forma de admiração (pelo que me falaram).

Os exemplos do manual são mais voltados para resolver problemas numéricos (em economia). Eu não vou tocar em como fazer estatística usando o Julia por falta de experiência e porque a minha opinião é de que não é a vantagem comparativa do Julia. Em compensação, para a solução de problemas numéricos o Julia é (quase) imbatível. Mais sobre isso abaixo.

Esse manual deve muito as seguintes pessoas: Pedro Cavalcante foi o primeiro a sugerir (e insistir) que eu deveria fazer um manual sobre como usar o Julia; Thibaut Lienart, que mantém o pacote JuDoc, que foi usado para criar este site e foi extremamente solicito com a solução de bugs e extensões que este site precisou;

O resto dessa página é dedicado a explicar 1. porque você deveria investir em uma linguagem de programação enquanto economista 2. porque ela deveria ser o Julia. Se você já está convencido dessas duas coisas, vá para a próxima página. As seções marcadas com um asterisco são provavelmente indigesta para a primeira leitura - e (provavelmente) não muito úteis para recém chegados. Boa leitura!

## O imperativo dos métodos numéricos (Ou por que economistas devem saber programar?)

Economistas não são cientistas nem engenheiros da computação. Alguns economistas não são grandes fãs de programação. Entretanto, saber programar é realmente útil para os economistas - e um economista que sabe programar, mesmo mediocremente, tem uma vantagem comparativa.

A necessidade de saber programar se deve ao fato de que _muitos_ problemas interessantes não tem solução analítica: eles só podem ser resolvidos com um computador. A matemática nos diz que o problema tem solução e às vezes é generosa o suficiente para dizer que a solução é única. Mas não é incomum problemas realmente interessantes não terem solução analítica. Isso não é restrito apenas a economia: na física, existe solução analítica para a interação de dois objetos no espaço usando as leis de Newton, [_mas não para mais do que dois_](https://en.wikipedia.org/wiki/Three-body_problem)~~~<a href="#note1" id="note1ref"><sup>1</sup></a>~~~

Isso é verdade também em economia. Um problema extremamente interessante e central em economia é o problema de um consumidor que tem que escolher, a cada período, o quanto poupar e o quanto consumir. Em geral ele recebe uma renda estocástica ou opera uma função de produção com uma tecnologia sujeita a choques e acumula um ativo livre de risco ou capital. O agente vive "infinito", o que pode ter várias interpretações. Esse é um problema de _programação dinâmica_. Tirando alguns casos particulares - preferências logaritmas, função de produção Cobb Douglas e depreciação 100% do capital - o problema não tem solução analítica. Mas devido as caracterísiticas do problema existem alguns algoritmos que dão uma resposta aproximada de qual é a decisão ótima do agente.

O problema de programação dinâmica é extremamente geral e aparece em todo tipo de área em economia: finanças, macroeconomia são dois exemplo óbvios, mas problemas de uso ótimo de recursos (naturais, por exemplo) podem ser expressos como problemas de programação dinâmica. E esse é apenas um problema em que temos que usar o computador. Vários livros tratam sobre problemas numéricos em economia.

## Por que aprender o Julia?

Existem uma centena de outras linguagens de programação. Por que gastar o seu tempo - um recurso escasso -  aprendendo o Julia e não outra linguagem?

1. O Julia é de graça - ao contrário do Matlab, por exemplo. Essa vantagem não precisa de nenhuma explicação.
2. O Julia é livre - qualquer um pode abrir o código do Julia e inspecionar o que ele está fazendo exatamente (ao contrário do Matlab). Isso pode não parecer uma vantagem a primeira vista, mas ajuda a pessoas encontrarem bugs e eles serem corrigidos mais rapidamente.
3. O Julia é muito rápido - em alguns casos mais rápido do que o Matlab. Os criadores do Julia dizem que um código totalmente otimizado em Julia é tão rápido quanto em C. (Mas veja aqui porque algumas vezes a sensação é de que o Julia é extremamente lento)
4. É bem mais fácil de aprender Julia do que C ou Fortran.

Julia alia duas características importantes: velocidade de execução e facilidade de aprendizado. Durante muito tempo existiam linguagens rápida (C,C++,Fortran) e linguagens fáceis de aprender (R, Python).

Obviamente, o Julia não é perfeito. Eis alguns problemas do Julia:

1. Algumas vezes a velocidade de execução dele é menor que a dos concorrentes. Eu explico o motivo exato disso mais para frente no manual.
2. O Julia ainda é uma linguagem muito nova, então outras linguagens tem um ecosistema de pacotes, scripts e ambientes de desenvolvimento já bem estabelecidos. Não há nada próximo de um RStudio para Jula. Entretanto, com o tempo o Julia pode ganhar essas mesmas coisas.
3. O Julia não é tão geral quanto o Python (que serve como pedaço essencial de sistemas operacionais até manter o facebook e computação científica) ou Java

Eu não posso deixar de observar que o ponto 2 pode ser uma _qualidade_. Não usar soluções "enlatadas" (implementadas por outras pessoas) e implementar você mesmo acaba te fazendo entender o que o algoritmo faz (talvez seja a _única_ maneira de _realmente entender_ um algoritmo). Entretanto, isso é uma questão de gosto: muitos economistas acham a parte numérica chata e não são piores economistas por isso.

-----

~~~
<a id="note1" href="#note1ref"><sup>1</sup></a>Infelizmente a página em português do tema são 3 linhas.
~~~
