Feature: Modifying a Bank Account
    In order to manage Bank Account and modify Bank Account information within system
    As a financial manager 
    I want to modify a Bank Account information

Background: 
    Given A financial manager named 'Mina' has logged in
    And there is a Bank with following info
        |Id     |Title   |           
        |400    |tejarat |


Scenario: Bank Account gets modified properly
    Given 'Mina' has defined a Bank Account with following info
        |Id     |AccountNumber    | Bank   |      
        |500    |1308116125874961 | tejarat| 
    When 'Mina' tries to modify a Bank Account with id '500' with following info
        |AccountNumber    | Bank   |      
        |1308116125875789 | tejarat|
    Then the Bank Account with id '500' gets modified properly  

Scenario Outline: a Bank Account is not modified with invalid info
    Given 'Mina' has defined a Bank Account with following info
        |Id     |AccountNumber    | Bank   |      
        |500    |1308116125874961 | tejarat|   
    When 'Mina' tries to modify a Bank Account with id '500' with following info
        |AccountNumber     | Bank   |  
        |<AccountNumber>   | <Bank> | 
    Then she gets error <message> and code <code> 

Examples:
        | Message                      |  Code          |AccountNumber    | Bank    |
        | AccountNumber is Required    | B-BR-5006      |                 | tejarat | 
        | Bank is Required             | B-BR-5007      |1308116125874961 |         |

Scenario: a Bank Account gets modified with its unique properties
        Given 'Mina' has defined a Bank Account with following info
            |Id     |AccountNumber    | Bank   |      
            |500    |1308116125874961 | tejarat|  
        And 'Mina' has defined a Bank Account with following info
            |Id     |AccountNumber    | Bank   |      
            |501    |1308116125871010 | saman  |  
        When 'Mina' tries to modify a  Bank Account with id '500' with following info
            |AccountNumber    | Bank   |     
            |1308116125874961 |tejarat |  
        Then she gets error ' AccountNumber cannot be duplicated' and code 'B-BR-5008' 