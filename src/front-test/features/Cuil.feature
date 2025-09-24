@Smoke 
Feature: Completar el formulario constancia de cuil
    Scenario Outline: completar y enviar el formulario con los datos correctos
        Given navego en constancia de cuil
        When el usuario completa el formulario con:
        | documento | nombre | apellido |  sexo | fechanacimiento |
        | <documento> | <nombre> | <apellido> | <sexo> | <fechanacimiento> |

        Then muestra el resultado del cuil 

        Examples:
        | documento | nombre | apellido |  sexo | fechanacimiento |
        | 34185058 | Lourdes Carolina | Nieva |  F | 1989-01-21 |


    Scenario Outline: completar y enviar el formulario con numero de documento incorrecto
        Given navego en constancia de cuil 
        When el usuario completa el formulario con numero de documento incorrecto:
        | documento | nombre | apellido |  sexo | fechanacimiento |
        | <documento> | <nombre> | <apellido> | <sexo> | <fechanacimiento> |

        Then muestra mensaje de error

        Examples:
        | documento | nombre | apellido |  sexo | fechanacimiento |
        | 3418505 | Lourdes Carolina | Nieva |  F | 1989-01-21 |


    Scenario Outline: completar y enviar el formulario con apellido sin ultima letra
        Given navego en constancia de cuil 
        When el usuario completa el formulario con apellido sin ultima letra:
        | documento | nombre | apellido |  sexo | fechanacimiento |
        | <documento> | <nombre> | <apellido> | <sexo> | <fechanacimiento> |

        Then muestra resultado del cuil

        Examples:
        | documento | nombre | apellido |  sexo | fechanacimiento |
        | 34185058 | Lourdes Carolina | Niev |  F | 1989-01-21 |


    Scenario Outline: completar y enviar el formulario sin apellido
        Given navego en constancia de cuil 
        When el usuario completa el formulario sin apellido:
       | documento | nombre | apellido |  sexo | fechanacimiento |
       | <documento> | <nombre> | <apellido> | <sexo> | <fechanacimiento> |

        Then muestra mensaje

        Examples:
        | documento | nombre | apellido |  sexo | fechanacimiento |
        | 34185058 | Lourdes Carolina | Nieva |  F |  |





  