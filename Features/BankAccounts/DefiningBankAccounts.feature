Feature: Defining new Bank Account
    In order to manage Bank Account within system
    As a financial manager 
    I want to define a new Bank Account


Background: 
    Given A financial manager named 'Mina' has logged in
    And there is a Bank with following info
        |Id     |Title   |           
        |400    |tejarat |


Scenario: a new Bank Account gets defined properly
    When 'Mina' tries to define a new Bank Account with follwoing info
        |Id     |AccountNumber    | Bank   |      
        |500    |1308116125874961 | tejarat|
    Then a new Bank Account with code '500' gets defined properly

Scenario Outline: a new Bank Account is not defined with invalid info
    When 'Mina' tries to define a new Bank Account with follwoing info
        |Id     |AccountNumber    | Bank |       
        |<Id>   |<AccountNumber>  |<Bank>|     
    Then she gets error <message> and code <code> 

Examples:
        | Message                      |  Code          | Id |AccountNumber    | Bank    |                  
        | Invalid Id is provided       | P-BR-5000      |    |1308116125874961 | tejarat |
        | Invalid Id is provided       | P-BR-5001      |-400|1308116125874961 | tejarat |
        | AccountNumber is Required    | P-BR-5002      |400 |                 | tejarat | 
        | Bank is Required             | P-BR-5003      |400 |1308116125874961 |         |


Scenario Outline: a new Bank Account gets defined with its unique properties
        Given 'Mina' tries to define a new Bank Account with follwoing info
            |Id     |AccountNumber    | Bank   |      
            |500    |1308116125874961 | tejarat|  
        When 'Mina' tries to define a new Bank Account with follwoing info
            |Id     |AccountNumber    | Bank   |      
            |<Id >  |<AccountNumber>  | tejarat|  
        Then she gets error <message> and code <code>   

Examples:
        | Message                              |  Code          | Id  |AccountNumber    | Bank    | 
        | Id cannot be duplicated              | P-BR-5004      | 500 |1308116125874958 | tejarat |
        | AccountNumber cannot be duplicated   | P-BR-5005      | 501 |1308116125874961 | tejarat |      


