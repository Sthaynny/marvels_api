<p align="center">
   <img src="https://github.com/user-attachments/assets/dc915eb4-cc3d-414f-950c-ce951426d521" alt="app" width="200"/>
</p>

<h1 align="center">Marvels API</h1> 

<p align="center">
   <a href="https://www.linkedin.com/in/igor-sthaynny/">
      <img alt="Igor Sthaynny" src="https://img.shields.io/badge/-Sthaynny-5965e0?style=flat&logo=Linkedin&logoColor=white"/>
   </a>
  <img alt="Languages" src="https://img.shields.io/github/languages/count/Sthaynny/marvels_api?color=%235963C5" />
  <img alt="lastcommit" src="https://img.shields.io/github/last-commit/Sthaynny/marvels_api?color=%235761C3" />
  <img alt="License" src="https://img.shields.io/github/license/Sthaynny/marvels_api?color=%235E69D7" />
  <img alt="Issues" src="https://img.shields.io/github/issues/Sthaynny/marvels_api?color=%235965E0">
  <a href="mailto:igorsthaynny@gmail.com">
   <img alt="E-mail" src="https://img.shields.io/badge/-igorsthaynny%40gmail.com-%23525DCB" />
  </a>
</p>

<p align="center">
  Projeto que consome a API da Marvel para exibir personagens e suas informações, como nome, imagem, descri o e quadrinhos relacionados.
</p>

<hr />

<div align="center">
  <sub> Made with 💖 by
    <a href="https://github.com/Sthaynny">Igor Sthaynny
  </sub>
</div>

# 📌 Contents

- [📌 Contents](#-contents)
- [:camera: Screenshots](#camera-screenshots)
- [:rocket: Tecnologias](#rocket-tecnologias)
- [:computer: Como rodar](#computer-como-rodar)
- [:bug: Issues](#bug-issues)
- [:sparkles: Contribuição](#sparkles-contribuição)
- [:page_facing_up: Licença](#page_facing_up-licença)

# :camera: Screenshots

Teste de integração para rodar o app de maneira altomatica:

https://github.com/user-attachments/assets/4ae9598a-f201-41fd-bc63-d7f984ebfc53



# :rocket: Tecnologias
Tecnologias usadas:
- Injeção de dependencia(get_it: ^8.0.3)
- Api Rest(dio: dio: ^5.8.0+1)
- Lib de criptografia(crypto: ^3.0.6)
- Mocks para teste(mocktail: ^1.0.4)
- Criação de teste de unidade, componente e de integração(patrol: ^3.14.1);

### Foi utilizado MVVM como arquitetura, estrutura de commands do flutter para gerencia de estados da tela e testes de integração utiliozando patrol.

Pontos de molhoria:

- Implementação para navegar entre as revistas de cada pesonagens
- Criação de um catalogos de Series
- Aplicar uma arquitetura multi-repo com modulos independentes. Para assistir uma filme e/ou serie no app;

# :computer: Como rodar

```bash
# Clone Repositorio
$ git clone https://github.com/Sthaynny/marvels_api.git

# Instale as dependências
$ flutter pub get

# Rode a aplicação
$ flutter run
```

# :bug: Issues

Cria um issue <a href="https://github.com/Sthaynny/marvels_api/issues">nova issue</a>, será uma honra poder ajudá-lo a resolver e melhorar ainda mais nosso aplicativo.

# :sparkles: Contribuição

- De um FORK nesse repositório;
- Crie uma nova branch a partir da develop: `git checkout -b my-feature` ou `git flow feature start my-feature`;
- Commit em sua banch: `git commit -m 'feat: my new feature'`;
- Push em sua branch: `git push origin my-feature`.
- Para mais informações acesse o [Guia de contribuição](https://github.com/Sthaynny/marvels_api/blob/main/.github/contributing.md)
  
Para ajudar a manter o padrão escolhido, também criamos um arquivo que é chamado antes de cada commit. Este arquivo irá formatar e identificar (se houver) erros no estilo de código do seu código. Para habilitar isso você deve primeiro copiá-lo para a pasta hooks do git. Se você estiver desenvolvendo no macOS, vá até a raiz do projeto e execute o comando abaixo:

```
cp pre-commit .git/hooks/pre-commit
```

Após esta etapa, é necessário dar permissão para que o arquivo seja executado. Basta seguir o seguinte comando:

```
chmod +x .git/hooks/pre-commit
```


# :page_facing_up: Licença

Este projeto está sob a [MIT License](./LICENSE) |
Made with 💖 by [Igor Sthaynny](https://www.linkedin.com/in/igor-sthaynny/).
