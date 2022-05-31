Feature: Removing bank receipt vocher
    In order to manage bank receipt vocher and remove bank receipt vocher information within the system
    As a operator 
    I want to removing a bank receipt vocher


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


Scenario: bank receipt vocher gets removed properly
        Given 'zahra' has defined a bank receipt vocher with following info
            |Id    |Username    |Date          |Subject      |Amount      |ReferenceNumber  |BankAccountNumber  |Bank     |ReferralDate|
            |300   |MT73        |1401-03-04    |sales goods  |300.000     |33801593845      |1308116125874961   |tejarat  |1401-02-05  |
        And 'zahra' has defined a bank receipt vocher with following info
             |Id    |Username    |Date          |Subject      |Amount      |ReferenceNumber   |BankAccountNumber  |Bank     |ReferralDate|
             |301   |ZM76        |1401-03-06    |sales goods  |400.000     |33801593895       |520116125874961    |tejarat  |1401-02-05  |
        When 'zahra' tries to remove the bank receipt vocher with id '300'
        Then she will no loger see a bank receipt vocher with id '300' within the system