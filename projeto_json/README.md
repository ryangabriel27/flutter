### projeto_json

## Plano de negócio:

# Model
    - Filmes(
        Nome: text,
        Categoria: text,
        Sinopse: text,
        Duração: int,
        Ano: int,
        Classificação: int,
        Elenco: Vetor[text],
        Imagens: text,
    )

# View
    - Página Inicial:
        - Botão de acesso para o cadastro de Filmes
        - Listar os filmes ja cadastrados

    - Página de Cadastro:
        - Form(Model)
    
    - Página de Listar os filmes:
        - Listar os filmes

# Controller
    - Cadastro:
        - Adicionar cadastro
        - List de filmes