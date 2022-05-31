Feature: Removing Bank Account
    In order to manage Bank Account and remove Bank Account information within the system
    As a financial manager 
    I want to removing a Bank Account

Background: 
    Given A financial manager named 'Mina' has logged in
    And there is a Bank with following info
        |Id     |Title   |           
        |400    |tejarat |


Scenario: Bank Account gets removed properly
    Given 'Mina' has defined a Bank Account with following info
        |Id     |AccountNumber    | Bank   |      
        |500    |1308116125874961 | tejarat|
    And 'Mina' has defined a Bank with following info
        |Id     |AccountNumber    | Bank   |      
        |501    |1308116125589961 | tejarat| 
    When 'Mina' tries to remove the Bank Account with id '500'
    Then she will no loger see a Bank Account with id '500' within the system             
