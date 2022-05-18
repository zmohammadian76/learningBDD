Feature: Modifying a cashbox
    In order to manage cash and modify cashbox information within system
    As a financial manager 
     I want to modify a cashbox information


     Background: 
        Given An operator named 'Mina' has logged in

     Scenario: cashbox gets modified properly
        Given 'Mina' has defined a cashbox with following info
            |id     |title            |status  
            |100    |cashbox-main-1   |active
        When 'Mina' tries to modify a cashbox with id '100' with follwoing info
            |title             |status  
            |cashbox-main-2    |active
        Then the party with id '100' gets modified properly

    Scenario Outline: a cashbox is not modified with invalid info
       Given 'Mina' has defined a cashbox with following info
            |id     |title            |status  
            |100    |cashbox-main     |active
        When 'Mina' tries to modify a cashbox with id '100' with follwoing info
            |title     |status  
            |<title>   |<status>
        Then she gets error <message> and code <code>

        Examples:
        | message                      |  code               | id  | title     |status 
        | title is Required            |  P-BR-2000          | 100 |           |active



    Scenario Outline: a cashbox gets modified with its unique properties
            Given 'Mina' has defined a cashbox with following info
                |id     |title            |status  
                |100    |cashbox-main-1   |active
            And 'Mina' has defined a party with following info
                |id     |title            |status  
                |104    |cashbox-main-4   |deactive
            When 'Mina' tries to modify a party with id '100' with follwoing info
                |title     |status  
                |<title>   |status 
            Then she gets error <message> and code <code>       
    Examples:
        | message                          |  code               | id  | title            |status 
        | title cannot be duplicated       |  P-BR-2001          | 100 | cashbox-main-4   |active
        


        