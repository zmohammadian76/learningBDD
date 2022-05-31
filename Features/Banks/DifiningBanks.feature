Feature: Defining new Bank
    In order to manage Bank within system
    As a financial manager 
    I want to define a new Bank


Background: 
    Given A financial manager named 'Mina' has logged in

Scenario: a new Bank gets defined properly
        When 'Mina' tries to define a new Bank with follwoing info
            |Id     |Title  |           
            |400    |tejarat|  
        Then a new Bank with code '400' gets defined properly

Scenario Outline: a new Bank is not defined with invalid info
        When 'Mina' tries to define a new Bank with follwoing info
            |Id     |Title  |      
            |<Id>   |<Title>|   
        Then she gets error <message> and code <code>   

 Examples:
        | Message                      |  Code          | Id | Title  |                  
        | Invalid Id is provided       | P-BR-4000      |    | tejarat|    
        | Invalid Id is provided       | P-BR-4001      |-400| tejarat|   
        | Tittle is Required           | P-BR-4002      |400 |        |                 


Scenario Outline: a new Bank gets defined with its unique properties
        Given 'Mina' tries to define a new Bank with follwoing info
            |Id     |Title  |      
            |400    |tejarat|  
        When 'Mina' tries to define a new Bank with follwoing info
            |Id     |Title  |       
            |<id>   |<title>|    
        Then she gets error <message> and code <code>   


  Examples:
        | Message                              |  Code          | Id  |Title       |
        | Id cannot be duplicated              | P-BR-4003      | 400 |tejarat     |
        | Title cannot be duplicated           | P-BR-4004      | 400 |tejarat     |          