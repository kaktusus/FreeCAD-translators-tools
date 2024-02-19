# Ferramentas de Tradução do FreeCAD
Scripts Bash úteis para tradutores do FreeCAD

---

## QMconvert2.sh
Em concomitância com as compilações [weekly-builds FreeCAD](https://github.com/FreeCAD/FreeCAD-Bundle/releases/tag/weekly-builds), lançados na forma de _**AppImage**_, nós ganhamos a possibilidade de testar as traduções "in loco". Isso nos permite realizar testes sem precisar esperar pelo ciclo completo de lançamento da versão de teste, que contém as traduções atualizadas da interface do usuário.

As traduções para o [FreeCAD](https://www.freecad.org/index.php?lang=pt_BR) são feitas na plataforma [Crowdin](https://crowdin.com/project/freecad/pt-BR). Baixe por ali os arquivos atualizados da interface do usuário do seu idioma, em formato de texto.

Esta é a segunda versão de um script Bash projetado para preparar arquivos de idioma, compilados para o ambiente de desenvolvimento QT, no qual o FreeCAD é baseado. Essencialmente, o script foi criado para possibilitar as análises das traduções da interface do usuário em ambiente local. Também é possível elaborar as traduções localmente, por exemplo, das bancadas de trabalho externas que ainda não foram inclusas no FreeCAD-addons.Em tais casos, o script também pode ser útil.

### O que este script faz:
* Garante que o nome do arquivo siga convenções predefinidas _(por exemplo, letra maiúscula no início)_,
* Adiciona as respectivas designações dos idiomas e regiões ao final do nome do arquivo, lidas no cabeçalho do arquivo fonte _(en, en-US, etc.)_,
* Compila os arquivos usando a ferramenta ***lrelease*** instalada no sistema,
* Move os arquivos compilados para a pasta apropriada da estrutura de diretórios do FreeCAD,
* Pode processar qualquer número de arquivos fonte ainda na pasta atual de trabalho.

### Preparando o ambiente local para o script.
Se estiver trabalhando em um sistema operacional Debian, você precisará do pacote:
```
qttools5-dev-tools
```
Este pacote contém ferramentas QT, incluindo o lrelease necessário.

### Preparando os arquivos fonte das traduções.
Você pode baixar os arquivos `.ts` da parte da interface do usuário que lhe interessa, pela plataforma do projeto Crowdin [FreeCAD](https://crowdin.com/project/freecad/pt-BR) ou [FreeCAD-addons](https://crowdin.com/project/freecad-addons). Se você não tiver uma conta, precisará de um amigo que a tenha.

![Como baixar o arquivo fonte](/images/download_2024-02-15_13-56.webm)
Se estiver trabalhando com uma bancada de trabalho externa que ainda não conste no repositório ***FreeCAD-addons***, você precisará gerar os arquivos fonte de tradução localmente.

### Trabalhando com o script.
É simples. Copie o arquivo do script para a pasta onde você baixou os arquivos fonte. Dê a ele as permissões +x necessárias e execute-o pelo terminal.

![Operação do script](/images/QMConvwet2_2024-02-15_14-53.webm)

### Baixe o script aqui.
[QMConvert2](/bash_scripts/QMconvert2.sh)
