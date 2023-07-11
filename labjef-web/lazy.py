# ----------------------------------------------------------------
#
#  Script para criar os arquivos java automaticamente /ᐠ_ ꞈ _ᐟ\ฅ
#
# ----------------------------------------------------------------

from pathlib import Path

world = {
    "pessoa" : {
        "name": "pessoa",
        "plural_name": "pessoas",
        "title": "Pessoa",
        "plural_title": "Pessoas",
        "columns": {
            #  "id"                :'Integer',
            "cpf"               :['String', 'CPF'],
            "nome"              :['String', 'Nome'],
            "endereco"          :['String', 'Endereço'],
            "senha"             :['String', 'Senha'],
            "login"             :['String', 'Login'],
            "instituicao"       :['String', 'Intituição'],
            "data_nascimento"   :['Date', 'Data de Nascimento'],
        },
    },
    "perfil" : {
        "name": "perfil",
        "plural_name": "perfis",
        "title": "Perfil",
        "plural_title": "Perfis",
        "columns": {
            #  "id"        :'Integer',
            "codigo"    :['String', 'Código'],
            "tipo"      :['String', 'Tipo'],
        },
    },
    "servico" : {
        "name": "servico",
        "plural_name": "servicos",
        "title": "Serviço",
        "plural_title": "Serviços",
        "columns": {
            #  "id"        :'Integer',
            "codigo"    :['String', 'Código'],
            "descricao" :['String', 'Descrição'],
            "tipo"      :['String', 'Tipo'],
            "id_perfil" :['Integer', 'ID do perfil'],
        },
    },
    "docente" : {
        "name": "docente",
        "plural_name": "docentes",
        "title": "Docente",
        "plural_title": "Docentes",
        "columns": {
            #  "id"                :'Integer',
            "id_pessoa"         :['Integer', 'ID da pessoa'],
            "especialidade"     :['String', 'Especialidade'],
            "funcao_tecnica"    :['String', 'Função técnica'],
        },
    },
    "funcionario" : {
        "name": "funcionario",
        "plural_name": "funcionarios",
        "title": "Funcionário",
        "plural_title": "Funcionários",
        "columns": {
            #  "id"                :'Integer',
            "id_pessoa"         :['Integer', 'ID da pessoa'],
            "especialidade"     :['String', 'Especialidade'],
            "funcao_tecnica"    :['String', 'Função técnica'],
        },
    },
    "aluno" : {
        "name": "aluno",
        "plural_name": "alunos",
        "title": "Aluno",
        "plural_title": "Alunos",
        "columns": {
            #  "id"            :'Integer',
            "id_pessoa"     :['Integer', 'ID da pessoa'],
            "curso"         :['String', 'Curso'],
            "nota_ingresso" :['Float', 'Nota de ingresso'],
        },
    },
    "disciplina" : {
        "name": "disciplina",
        "plural_name": "disciplinas",
        "title": "Disciplina",
        "plural_title": "Disciplinas",
        "columns": {
            #  "id"            :'Integer',
            "codigo"        :['String', 'Código'],
            "nome"          :['String', 'Nome'],
            "ementa"        :['String', 'Ementa'],
            "data_criacao"  :['Date', 'Data de criação'],
        },
    },
    "rel_pessoa_perfil" : {
        "name": "rel_pessoa_perfil",
        "plural_name": "rel_pessoas_perfis",
        "title": "Relacionamento Pessoa-Perfil",
        "plural_title": "Relacionamentos Pessoa-Perfil",
        "columns": {
            #  "id"        :'Integer',
            "id_pessoa" :['Integer', 'ID da pessoa'],
            "id_perfil" :['Integer', 'ID do perfil'],
        },
    },
    "rel_oferecimento" : {
        "name": "rel_oferecimento",
        "plural_name": "rel_oferecimentos",
        "title": "Oferecimento",
        "plural_title": "Oferecimentos",
        "columns": {
            #  "id"            :['Integer', ''],
            "id_docente"    :['Integer', 'ID do docente'],
            "id_aluno"      :['Integer', 'ID do aluno'],
            "id_disciplina" :['Integer', 'ID da disciplina'],
            "nota_obtida"   :['Float', 'Nota Obtida'],
            "data_inicio"   :['Date', 'Data de início'],
            "data_fim"      :['Date', 'Data de fim'],
        },
    },
    "rel_historico" : {
        "name": "rel_historico",
        "plural_name": "rel_historicos",
        "title": "Histórico",
        "plural_title": "Histórico",
        "columns": {
            #  "id"        :['Integer', ''],
            "id_pessoa"     :['Integer', 'ID da pessoa'],
            "id_servico"    :['Integer', 'ID do serviço'],
            #  "timestamp" :['Integer', ''],
        },
    },
}

#  https://stackoverflow.com/a/19053800
def to_camel_case(snake_str):
    return "".join(x.capitalize() for x in snake_str.lower().split("_"))

def to_lower_camel_case(snake_str):
    camel_string = to_camel_case(snake_str)
    return snake_str[0].lower() + camel_string[1:]

def to_upper_camel_case(snake_str):
    camel_string = to_camel_case(snake_str)
    return snake_str[0].upper() + camel_string[1:]

def generateMain(table):
    TableName = to_upper_camel_case(table["name"])
    tableName = to_lower_camel_case(table["name"])

    getters_setters = ""
    attributes = ""

    has_date = False

    for column_name, column_type in table["columns"].items():
        ColumnName = to_upper_camel_case(column_name)
        columnName = to_lower_camel_case(column_name)

        if column_type[0] == "Date":
            has_date = True
            attributes = f"""{attributes}

    @DateTimeFormat(pattern = "yyyy-MM-dd")"""

        attributes = f"""{attributes}
    private {column_type[0]} {columnName};"""

        getters_setters = f"""{getters_setters}
    public {column_type[0]} get{ColumnName}() {{
        return {columnName};
    }}

    public void set{ColumnName}({column_type[0]} {columnName}) {{
        this.{columnName} = {columnName};
    }}
    """


    return f"""package com.example.labjef.{tableName};
{f'''
import java.util.Date;
import org.springframework.format.annotation.DateTimeFormat;
''' if has_date else ''}
public class {TableName} {{

    private Integer id;{attributes}

    public {TableName}() {{
        this.id = -1;
    }}

    public {TableName}(Integer id) {{
        this.id = id;
    }}

    public Integer getId() {{
        return id;
    }}

    public void setId(Integer id) {{
        this.id = id;
    }}
    {getters_setters}
}}"""

def generateRowMapper(table):
    TableName = to_upper_camel_case(table["name"])
    tableName = to_lower_camel_case(table["name"])

    getters_setters = ""
    attributes = ""

    for column_name, column_type in table["columns"].items():
        ColumnName = to_upper_camel_case(column_name)
        columnName = to_lower_camel_case(column_name)

        getters_setters = f"""{getters_setters}
        {tableName}.set{ColumnName}(rs.get{to_upper_camel_case(column_type[0]).replace("Integer","Int")}("{column_name}"));"""

    return f"""package com.example.labjef.{tableName};

import org.springframework.jdbc.core.RowMapper;
import java.sql.ResultSet;
import java.sql.SQLException;

public class {TableName}RowMapper implements RowMapper<{TableName}> {{
    @Override
    public {TableName} mapRow(ResultSet rs, int rowNum) throws SQLException {{
        {TableName} {tableName} = new {TableName}(rs.getInt("id"));
        {getters_setters}

        return {tableName};
    }}
}}"""

def generateController(table):
    TableName = to_upper_camel_case(table["name"])
    tableName = to_lower_camel_case(table["name"])
    pluralTableName = to_lower_camel_case(table["plural_name"])
    PluralTableName = to_upper_camel_case(table["plural_name"])

    getters_setters = ""
    attributes = ""

    for column_name, column_type in table["columns"].items():
        ColumnName = to_upper_camel_case(column_name)
        columnName = to_lower_camel_case(column_name)
        getters_setters = f"""{getters_setters}
                {tableName}.get{ColumnName}(),"""

    return f'''package com.example.labjef.{tableName};

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;

@Controller
public class {TableName}Controller {{

    @Autowired
    JdbcTemplate jdbcTemplate;

    @GetMapping("/{pluralTableName}")
    public String lista{PluralTableName}(Model model) {{
        List<{TableName}> {pluralTableName} = jdbcTemplate.query(
            "SELECT * FROM {table["name"]} ORDER BY id DESC",
            new {TableName}RowMapper());
        model.addAttribute("lista{PluralTableName}", {pluralTableName});
        return "{pluralTableName}";
    }}

    @GetMapping("/{tableName}")
    public String form{TableName}(Model model) {{
        model.addAttribute("{tableName}", new {TableName}());
        return "{tableName}";
    }}

    @GetMapping("/{tableName}/{{id}}")
    public String edit{TableName}(Model model, @PathVariable Integer id) {{
        {TableName} {tableName} = jdbcTemplate.queryForObject("SELECT * FROM {table["name"]} WHERE id = ?", 
            new {TableName}RowMapper(), id);
        model.addAttribute("{tableName}", {tableName});
        return "{tableName}";
    }}

    @PostMapping("/{tableName}")
    public String submit{TableName}(@ModelAttribute {TableName} {tableName}, Model model) {{
        if ({tableName}.getId() > 0) {{
            jdbcTemplate.update(
                "UPDATE {table["name"]} SET {str([f"{key} = ?" for key in table["columns"]]).replace("[","").replace("]","").replace("'","")} WHERE id = ?",
                {getters_setters}
                {tableName}.getId()
            );
        }} else {{
            jdbcTemplate.update(
                "INSERT INTO {table["name"]} {str(tuple(key for key in table["columns"])).replace("'","")} VALUES {str(tuple("?"*len(table["columns"]))).replace("'","")}",
                {getters_setters[:-1]}
            );        
        }}
        return "redirect:/{pluralTableName}";
    }}

    @DeleteMapping("/{tableName}/{{id}}")
    public String delete{TableName}(@PathVariable Integer id) {{
        jdbcTemplate.update(
            "DELETE FROM {table["name"]} WHERE ID = ?",
            id
        );
        return "redirect:/{pluralTableName}";
    }}
}}'''

def generateListTemplate(table):
    TableName = to_upper_camel_case(table["name"])
    tableName = to_lower_camel_case(table["name"])
    pluralTableName = to_lower_camel_case(table["plural_name"])
    PluralTableName = to_upper_camel_case(table["plural_name"])

    getters_setters = ""
    attributes = ""

    for column_name, column_type in table["columns"].items():
        ColumnName = to_upper_camel_case(column_name)
        columnName = to_lower_camel_case(column_name)

        attributes = f"""{attributes}
                        <th>{column_type[1]}</th>"""

        getters_setters = f"""{getters_setters}
                            <td th:text="${{{{p.{columnName}}}}}">{column_type[1]}</td>"""

    return f'''<!DOCTYPE HTML>
<html xmlns:th="https://www.thymeleaf.org">
<head> 
    <title>{table["plural_title"]}</title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous">
</head>
<body>
    <nav class="navbar navbar-expand-lg navbar-light shadow-sm" id="mainNav">
        <div class="container px-5">
            <a class="navbar-brand fw-bold" href="/">MAC0350 - {table["plural_title"]}</a>
        </div>
    </nav>

    <div class="container px-5 pt-5">
        <div class="row mb-2">
            <div class="col">
                <a class="btn btn-primary" href="#"  th:href="@{{/pessoa}}" role="button">Cadastrar Novo</a>        
            </div>
        </div>
        <div class="row gx-5 align-items-center">
            <div class="col">
                <table class="table" >
                    <thead >
                        <tr >
                        <th>ID</th>{attributes}
                        <th></th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr th:each="p : ${{lista{PluralTableName}}}">
                            <td th:text="${{{{p.id}}}}">1</td>{getters_setters}
                            <td class="d-flex justify-content-end">
                                <a href="#" class="btn btn-outline-primary me-2" th:href="@{{/{tableName}}} + '/' + ${{p.id}}">Atualizar</a>
                                <form action="#" th:action="@{{/{tableName}}} + '/' + ${{p.id}}" th:method="delete" class="d-inline-block">
                                    <button class="btn btn-outline-danger">Apagar</button>
                                </form>
                            </td>
                        </tr> 
                    </tbody>
                </table>
            </div>
        </div>
    </div>
    

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe" crossorigin="anonymous"></script>
</body>
</html>'''

def generateFormTemplate(table):
    TableName = to_upper_camel_case(table["name"])
    tableName = to_lower_camel_case(table["name"])
    pluralTableName = to_lower_camel_case(table["plural_name"])
    PluralTableName = to_upper_camel_case(table["plural_name"])

    attributes = ""

    for column_name, column_type in table["columns"].items():
        ColumnName = to_upper_camel_case(column_name)
        columnName = to_lower_camel_case(column_name)

        attributes = f"""{attributes}
                    <div class="mb-3">
                        <label for="{columnName}" class="form-label">{column_type[1]}</label>
                        <input type="{"date" if column_type[0] == "Date" else "text"}" class="form-control" id="{columnName}" placeholder="{column_type[1]}" th:field="*{{{columnName}}}" >
                    </div>"""

    return f'''<!DOCTYPE HTML>
<html xmlns:th="https://www.thymeleaf.org">
<head> 
    <title>Cadastro de {table["title"]}</title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous">
</head>
<body>
    <nav class="navbar navbar-expand-lg navbar-light shadow-sm" id="mainNav">
        <div class="container px-5">
            <a class="navbar-brand fw-bold" href="/{pluralTableName}">MAC0350 - Cadastro de {table["title"]}</a>
        </div>
    </nav>
    <div class="container px-5 pt-5">
        <div class="row">
            <div class="col">
                <form action="#" th:action="@{{/{tableName}}}" th:object="${{{tableName}}}" method="post">
                    <input type="hidden" th:field="*{{id}}" />{attributes}
                    <button type="submit" class="btn btn-primary">Salvar</button>
                    <a href="#" th:href="@{{/{pluralTableName}}}" class="btn btn-secondary">Voltar</a>
                </form>
            </div>
        </div>
    </div>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe" crossorigin="anonymous"></script>
</body>
</html>'''

def generateIndex(world):
    buttons = ""

    for key in world:
        table = world[key]

        pluralTableName = to_lower_camel_case(table["plural_name"])

        buttons = f'''{buttons}
          <a href="/{pluralTableName}" class="list-group-item list-group-item-action">Lista de {table["plural_title"]}</a>'''

    return f'''<!DOCTYPE HTML>
<html>

<head>
  <title>Home page</title>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet"
    integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous">
</head>

<body>
  <nav class="navbar navbar-expand-lg navbar-light shadow-sm" id="mainNav">
    <div class="container px-5">
      <a class="navbar-brand fw-bold" href="#page-top">MAC0350 - Home page</a>
    </div>
  </nav>
  <div class="container px-5 pt-5">
    <div class="row gx-5 align-items-center">
      <div class="col">
        <div class="list-group">{buttons}
        </div>
      </div>
    </div>
  </div>
</body>

</html>'''

for table in world:
    TableName = to_upper_camel_case(world[table]["name"]);
    tableName = to_lower_camel_case(world[table]["name"]);
    pluralTableName = to_lower_camel_case(world[table]["plural_name"])
    PluralTableName = to_upper_camel_case(world[table]["plural_name"])

    pathName = f"src/main/java/com/example/labjef/{tableName}"
    Path(pathName).mkdir(parents=True, exist_ok=True)

    with open(f"{pathName}/{TableName}.java", 'w') as f:
        print(generateMain(world[table]), file=f)

    with open(f"{pathName}/{TableName}RowMapper.java", 'w') as f:
        print(generateRowMapper(world[table]), file=f)

    with open(f"{pathName}/{TableName}Controller.java", 'w') as f:
        print(generateController(world[table]), file=f)

    pathName = f"src/main/resources/templates"
    Path(pathName).mkdir(parents=True, exist_ok=True)

    with open(f"{pathName}/{tableName}.html", 'w') as f:
        print(generateFormTemplate(world[table]), file=f)

    with open(f"{pathName}/{pluralTableName}.html", 'w') as f:
        print(generateListTemplate(world[table]), file=f)

pathName = f"src/main/resources/static"
Path(pathName).mkdir(parents=True, exist_ok=True)

with open(f"{pathName}/index.html", 'w') as f:
    print(generateIndex(world), file=f)
