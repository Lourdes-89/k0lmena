@Smoke 
Feature: Busqueda por pagina de Anses
    Scenario: El usuario busca y valida resultados
        Given el usuario navega en la pagina de Anses
        When el usuario busca cuil
        Then muestra todos los resultados según la búsqueda


@Smoke 
Feature: Completar el formulario constancia de cuil
    Scenario Outline: completar y enviar el formulario con los datos
        Given navego en constancia de cuil 
        When el usuario completa el formulario con:
        | documento | nombre | apellido |  sexo | fechanacimiento |
        | <documento> | <nombre> | <apellido> | <sexo> | <fechanacimiento> |

        Then muestra el resultado del cuil 

        Examples:
        | documento | nombre | apellido |  sexo | fechanacimiento |
        | 34185058 | Lourdes Carolina | Nieva |  f | 21/01/1989 |


@Smoke 
Feature: Completar el formulario constancia de cuil
    Scenario Outline: completar y enviar el formulario con los datos
        Given navego en constancia de cuil 
        When el usuario completa el formulario con numero de documento incorrecto:
        | documento | nombre | apellido |  sexo | fechanacimiento |
        | <documento> | <nombre> | <apellido> | <sexo> | <fechanacimiento> |

        Then muestra mensaje de error

        Examples:
        | documento | nombre | apellido |  sexo | fechanacimiento |
        | 3418505 | Lourdes Carolina | Nieva |  f | 21/01/1989 |


@Smoke 
Feature: Completar el formulario constancia de cuil
    Scenario Outline: completar y enviar el formulario con los datos
        Given navego en constancia de cuil 
        When el usuario completa el formulario con apellido sin ultima letra:
        | documento | nombre | apellido |  sexo | fechanacimiento |
        | <documento> | <nombre> | <apellido> | <sexo> | <fechanacimiento> |

        Then muestra el resultado del cuil

        Examples:
        | documento | nombre | apellido |  sexo | fechanacimiento |
        | 34185058 | Lourdes Carolina | Niev |  f | 21/01/1989 |

@Smoke 
Feature: Completar el formulario constancia de cuil
    Scenario Outline: completar y enviar el formulario con los datos
        Given navego en constancia de cuil 
        When el usuario completa el formulario sin apellido:
       | documento | nombre | apellido |  sexo | fechanacimiento |
       | <documento> | <nombre> | <apellido> | <sexo> | <fechanacimiento> |

        Then muestra mensaje

        Examples:
        | documento | nombre | apellido |  sexo | fechanacimiento |
        | 34185058 | Lourdes Carolina | Nieva |  f |  |



        