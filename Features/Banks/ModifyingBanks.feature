Feature: Modifying a Bank
    In order to manage Bank and modify Bank information within system
    As a financial manager 
     I want to modify a Bank information

Background: 
    Given An operator named 'Mina' has logged in


Scenario: Bank gets modified properly
    Given 'Mina' has defined a Bank with following info
        |Id     |Title  |             
        |400    |tejarat|  
    When 'Mina' tries to modify a Bank with id '400' with follwoing info
        |Title|             
        |saman| 
    Then the Bank with id '400' gets modified properly

Scenario: a Bank is not modified with invalid info
       Given 'Mina' has defined a Bank with following info
            |Id     |Title  |    
            |400    |tejarat|    
        When 'Mina' tries to modify a Bank with id '400' with follwoing info
            |Title  |    
            |<Title>| 
        Then she gets error 'title is Required' and code 'B-BR-4005'   

Scenario: a Bank gets modified with its unique properties
        Given 'Mina' has defined a Bank with following info
            |Id     |Title  |          
            |400    |tejarat|   
        And 'Mina' has defined a Bank with following info
            |Id     |Title |            
            |401    |saman |
        When 'Mina' tries to modify a Bank with id '400' with follwoing info
            |Title  |      
            |tejarat|   
        Then she gets error 'title cannot be duplicated' and code 'B-BR-4006'       
