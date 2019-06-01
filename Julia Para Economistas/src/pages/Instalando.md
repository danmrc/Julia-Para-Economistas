@def title = "Instalando"

# Instalação e IDEs

Você pode usar o Julia online via o [JuliaBox](https://www.juliabox.com/) ou [baixar o Julia](https://julialang.org/downloads/). O Julia está disponível para basicamente qualquer sistema operacional (Windows, Mac e uma infinidade de distribuições de Linux). Eu recomendo baixar e instalar. Se você estiver utilizando uma distribuição de Linux você também pode ir no gerenciador de pacotes e baixar por lá. A instalação é sem surpresas.

Uma vez instalado você pode usar o Julia direto do console, mas essa opção é sempre restritiva (além de ser feio). Existem vários ambientes de desenvolvimento (IDEs, _Integrated Developmnet Enviroment_) para o Julia. Em particular:

1. O [Atom](https://atom.io/). É o que eu uso e está disponível para todos os sistemas. O Atom é extremamente versátil, tem uma infinidade de pacotes, mas é pesado (especialmente no Windows). O Julia oferece o Atom com o nome de JuliaPro.

2. Os _notebooks_ do Jupyter, que são usados também para outras linguagens, em particular o Python.

3. Outras opções são o Visual Studio, Sublime Text. Eu nunca usei essas opções e não sei quais são as limitações dela.

O resto dessa seção vai focar em instalar o Atom e o Julia e o Jupyter.

## Julia direto no console

As vezes é necessário usar o Julia direto do console. Isso é relativamente fácil no Mac e no Linux, mas é chato no Windows. Aqui vai um passo a passo:

No Windows o Julia se esconde no appdata, e o caminho depende do seu nome de usuário. A maneira mais fácil de achar ele é a seguinte:

 1. Abra o "explorador de arquivos" (ou Windows Explorer se você nasceu na década de 90)
 2. Na barra de endereço digite %appdata%
 3. Ele vai entrar em .../appdata/roaming. Suba um diretório para appdata
 4. Entre na pasta local
 5. Lá vai ter a pasta de instalação juliax.x, onde x.x é o número da versão. Entre nela
 6. Clique duas vezes no atalho julia


## Atom

Depois de baixar e instalar o Atom, você precisa instalar alguns pacotes nele. Para isso dê ctrl + , (command + , no Mac) - ou vá em file, settings. Selecione Install e busque e baixe os seguintes pacotes:

* Ink
* Julia Client
* Language julia
* Uber juno

Salvo engano instalando os 3 primeiros o último é instalado automaticamente. Quando a instalação de tudo for concluída e bem sucedida, duas coisas novas vão surgir no atom:

* Uma barra a esquerda com vários botões, inclusive um inseto, um raio, um play, um pause e um stop.
* Um novo menu Julia


Para iniciar o Julia clique no icone _show console_ (debaixo do planeta com um anel). Vai surgir na sua tela um novo painel no Atom escrito _Press Enter to start Julia_. Aperte enter. Na primeira vez ele precisa instalar algumas coisas. Não é incomum ele falhar e quando você tentar de novo ele reclamar que falta um pacote. Nesse caso abra o console (vá no menu Julia do próprio Atom e clique em _Open Console_) e instale o pacote que falta. Mais embaixo eu explico como instalar pacotes.

Quando você tiver tudo instalado corretamente e funcionando a sua tela vai ser parecida com essa:

(vai ter uma imagem aqui)

As vezes o Atom pode ter problemas para achar o caminho correto para o Julia. Nesse caso, você pode mudar o caminho indo no menu Julia -> Settings... Leia a seção acima de como abrir o Julia no console acima. Ao invés de fazer o último passo, selecione o caminho da pasta (que fica naquela barra lá em cima) e copie e cole no Julia Path nas _settings_ do Julia no Atom.

 ## Jupyter

 O Jupyter é outra opção para usar o Julia. Para ele, você precisa instalar o [Anaconda](https://www.anaconda.com/distribution/). Instale ele (isso pode ser um pouco demorado). Depois abra o Julia, instale o pacote IJulia (eu explico como instalar o pacote adiante) e carregue ele. Feche o Julia e abra o Jupyter, que vai abrir no seu navegador. Isso deve ser o suficiente para permitir você criar um notebook com o Julia (clicando em _new_)

# Instalando pacotes

Como na maioria das linguagens de programação atuais, o ecosistema de pacotes escritos por outras pessoas ajudam com várias tarefas que nós vamos nos deparar - por exemplo, algoritmos de otimização, de encontrar o zero de uma função e de interpolação. Antes de instalar pacotes no Julia, você deve checar o [Julia Observer](https://juliaobserver.com/) para checar quais pacotes você precisa.

Para instalar os pacotes:

1. Aperte a tecla ] (sim, fechar o colchetes). Isso deve mudar o seu console de `julia>` para `pkg v>`, onde v é número da versão.
2. Digite `add nome-do-pacote`
3. Quando terminar, para voltar para o modo normal do Julia, aperte backspace

Para carregar um pacote instalado, digite `using nome-do-pacote`

Por exemplo, para instalar o pacote _Optim_, fariamos:

```
] #(isso não vai gerar nada além da mudança de julia> para package>)
add Optim
backspace #(isso não vai gerar nada além da mudança de package> para julia>)
using Optim
```
Tendo instalado o Julia, um IDE e sabendo instalar pacotes, podemos seguir adiante.
