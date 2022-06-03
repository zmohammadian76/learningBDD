Feature: Removing bank peyment vocher
    In order to manage bank peyment vocher and remove bank peyment vocher information within the system
    As a operator 
    I want to removing a bank peyment vocher


Background: 
    Given 'zahra' is system administrator and has logged in
    And there is a party with following info
        |Id   |Username       |Firstname     |Lastname    |PhoneNo        |Address|
        |1    |MT73           |MOhammadReza  |Taghipour   |09911233223    |1st street, Tehran, Iran|
    And there is a Bank with following info
        |Id     |Title  |           
        |400    |tejarat|   
    And there is a Bank Account with following info
        |Id     |AccountNumber    | Bank   |      
        |500    |1308116125874961 | tejarat| 


Scenario: bank peyment vocher gets removed properly
    Given 'zahra' has defined a bank peyment vocher with following info
        |Id    |Username    |Date          |Subject          |Amount      |ReferenceNumber  |BankAccountNumber  |Bank     |ReferralDate|
        |700   |MT73        |1401-03-04    |return of goods  |300.000     |33801593845      |1308116125874961   |tejarat  |1401-02-05  |
    And 'zahra' has defined a bank peyment vocher with following info
        |Id    |Username    |Date          |Subject          |Amount      |ReferenceNumber   |BankAccountNumber  |Bank     |ReferralDate|
        |701   |ZM76        |1401-03-06    |return of goods  |400.000     |33801593895       |520116125874961    |tejarat  |1401-02-05  |
    When 'zahra' tries to remove the bank peyment vocher with id '700'
    Then she will no loger see a bank peyment vocher with id '700' within the system           
