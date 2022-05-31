Feature: Removing Bank
    In order to manage Bank and remove Bank information within the system
    As a financial manager 
    I want to removing a Bank

 Background: 
    Given A financial manager named 'Mina' has logged in


Scenario: Bank gets removed properly
    Given 'Mina' has defined a Bank with following info
        |Id     |Title  |           
        |400    |tejarat|
    And 'Mina' has defined a Bank with following info
        |Id     |Title  |
        |401    |saman  |  
    When 'Mina' tries to remove the Bank with id '400'
    Then she will no loger see a Bank with id '400' within the system        