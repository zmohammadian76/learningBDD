Feature: Defining new cashbox
    In order to manage cash within system
    As a financial manager 
    I want to define a new cashbox


    Background: 
    Given A financial manager named 'Mina' has logged in

     Scenario: a new cashbox gets defined properly
        When 'Mina' tries to define a new cashbox with follwoing info
            |id     |title            |status|  
            |100    |cashbox-main     |active|
        Then a new cashbox with code '100' gets defined properly

     Scenario Outline: a new cashbox is not defined with invalid info
        When 'Mina' tries to define a new cashbox with follwoing info
            |id     |title       |status|
            |<id>   |<title>     |<status>|   
        Then she gets error <message> and code <code>

         Examples:
        | message                      |  code          | id | title            |status|        
        | Invalid id is provided       | P-BR-2003      |    | cashbox-main     |active|   
        | Invalid id is provided       | P-BR-2003      |-100| cashbox-main     |active|
        | tittle is Required           | P-BR-2004      |100 |                  |active|            


         Scenario Outline: a new cashbox get defined with its unique properties
            Given 'Mina' tries to define a new cashbox with follwoing info
                  |id     |title           |status|  
                  |100    |cashbox-main    |active|
            When 'Mina' tries to define a new cashbox with follwoing info
                  |id     |title        |status|
                  |<id>   |<title>      |status|  
            Then she gets error <message> and code <code>


         Examples:
        | message                              |  code          | id  |title       |
        | Id cannot be duplicated              | P-BR-2005      | 100 |cashbox-main|
        | title cannot be duplicated           | P-BR-2006      | 100 |cashbox-main|  