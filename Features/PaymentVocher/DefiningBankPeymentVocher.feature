Feature: Defining a new bank peyment vocher
    In order to manage bank peyment vocher
    As a operator 
    I want to define a new bank peyment vocher


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

Scenario: a new bank peyment vocher gets defined properly
    When 'Zahra' tries to define a new bank peyment vocher with follwoing info
        |Id    |Username    |Date          |Subject          |Amount      |ReferenceNumber  |BankAccountNumber  |Bank     |ReferralDate|
        |700   |MT73        |1401-03-04    |return of goods  |300.000     |33801593845      |1308116125874961   |tejarat  |1401-02-05  |
    Then a new bank peyment vocher with Id '700' gets defined properly    


Scenario Outline: a new bank peyment vocher is not defined with invalid info
    When 'zahra' tries to define a new bank peyment vocher with follwoing info
        |Id    |Username    |Date        |Subject      |Amount      |ReferenceNumber   |BankAccountNumber    |Bank       |ReferralDate  |
        |<Id>  |<Username>  |<Date>      |<subject>    |<Amount>    |<ReferenceNumber> |<BankAccountNumber>  |<Bank>     |<ReferralDate>|
    Then she gets error <message> and code <code>  

Examples:
        | Message                                |  Code         | id | Username    | Date         |Subject            |Amount      |ReferenceNumber  |BankAccountNumber    |Bank          |ReferralDate | 
        | Invalid id is provided                 | P-BR-7000     |    | MT73        | 1401-03-04   |return of goods    |300.000     |33801593845      | 1308116125874961    |tejarat       |1401-02-05   |
        | Invalid id is provided                 | P-BR-7000     |-700| MT73        | 1401-03-04   |return of goods    |300.000     |33801593845      | 1308116125874961    |tejarat       |1401-02-05   |
        | username is required                   | P-BR-7001     |700 |             | 1401-03-04   |return of goods    |300.000     |33801593845      | 1308116125874961    |tejarat       |1401-02-05   |
        | Date is required                       | P-BR-7002     |700 | MT73        |              |return of goods    |300.000     |33801593845      | 1308116125874961    |tejarat       |1401-02-05   |
        | subject is required                    | P-BR-7003     |700 | MT73        | 1401-03-04   |                   |300.000     |33801593845      | 1308116125874961    |tejarat       |1401-02-05   |
        | Amount is required                     | P-BR-7004     |700 | MT73        | 1401-03-04   |return of goods    |            |33801593845      | 1308116125874961    |tejarat       |1401-02-05   |
        | invalid Amount is provided             | P-BR-7005     |700 | MT73        | 1401-03-04   |return of goods    |-300        |33801593845      | 1308116125874961    |tejarat       |1401-02-05   |
        | Refrence is required                   | P-BR-7006     |700 | MT73        | 1401-03-04   |return of goods    |300.000     |                 | 1308116125874961    |tejarat       |1401-02-05   |
        | BankAccountNumber name is required     | P-BR-7007     |700 | MT73        | 1401-03-04   |return of goods    |300.000     |33801593845      |                     |tejarat       |1401-02-05   |
        | Bank is required                       | P-BR-7008     |700 | MT73        | 1401-03-04   |return of goods    |300.000     |33801593845      | 1308116125874961    |              |1401-02-05   |
        | Referral date is required              | P-BR-7009     |700 | MT73        | 1401-03-04   |return of goods    |300.000     |33801593845      | 1308116125874961    |tejarat       |             |


Scenario Outline: a new bank peyment vocher gets defined with its unique properties
    Given 'zahra' has defined a bank peyment vocher with following info
        |Id    |Username    |Date          |Subject          |Amount      |ReferenceNumber  |BankAccountNumber  |Bank     |ReferralDate|
        |700   |MT73        |1401-03-04    |return of goods  |300.000     |33801593845      |1308116125874961   |tejarat  |1401-02-05  |
    When 'zahra' tries to define a new bank peyment vocher with follwoing info
        |Id    |Username    |Date          |Subject      |Amount      |ReferenceNumber      |BankAccountNumber  |Bank     |ReferralDate|
        |<Id>  |MT73        |1401-03-04    |sales goods  |300.000     |<ReferenceNumber>    |1308116125874961   |tejarat  |1401-02-05  |
    Then she gets error <message> and code <code>

Examples:
        | Message                              |  Code          | Id  |ReferenceNumber |
        | Id cannot be duplicated              | P-BR-7010      | 700 |33805065987     |
        | Reference cannot be duplicated       | P-BR-7011      | 701 |33801593845     |

