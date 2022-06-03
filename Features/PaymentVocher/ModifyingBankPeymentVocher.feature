Feature: Modifying a bank peyment vocher
    In order to manage and modify bank peyment vocher information within the system
    As an operator 
    I want to modify a bank peyment vocher information


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


Scenario: bank peyment vocher gets modified properly
    Given 'zahra' has defined a bank peyment vocher with following info
        |Id    |Username    |Date          |Subject          |Amount      |ReferenceNumber  |BankAccountNumber  |Bank     |ReferralDate|
        |700   |MT73        |1401-03-04    |return of goods  |300.000     |33801593845      |1308116125874961   |tejarat  |1401-02-05  |
    When 'zahra' tries to modify a bank peyment vocher with id '700' with follwoing info
        |Username    |Date          |Subject          |Amount      |ReferenceNumber    |BankAccountNumber   |Bank       |ReferralDate|
        |MT73        |1401-03-08    |return of goods  |450.000     |33801593985        |1308116125875874    |tejarat    |1401-02-02  |
    Then the party with id '700' gets modified properly


Scenario Outline: a bank peyment vocher is not modified with invalid info
    Given 'zahra' has defined a bank peyment vocher with following info
        |Id    |Username    |Date          |Subject          |Amount      |ReferenceNumber  |BankAccountNumber  |Bank     |ReferralDate|
        |700   |MT73        |1401-03-04    |return of goods  |300.000     |33801593845      |1308116125874961   |tejarat  |1401-02-05  |
    When 'zahra' tries to modify a bank peyment vocher with id '700' with follwoing info
        |Username    |Date        |Subject      |Amount      |ReferenceNumber     |BankAccountNumber    |Bank     |ReferralDate  |
        |<Username>  |<Date>      |<subject>    |<Amount>    |<ReferenceNumber>   |<BankAccountNumber>  |<Bank>   |<ReferralDate>|
    Then she gets error <message> and code <code> 


 Examples:
        | Message                           |  Code         | Username    | Date         |Subject            |Amount      |ReferenceNumber     |BankAccountNumber  |Bank          |ReferralDate |
        | Username is required              | P-BR-7012     |             | 1401-03-04   |return of goods    |300.000     |33801593845         |1308116125874961   |tejarat       |1401-02-05   |
        | Date is required                  | P-BR-7013     | MT73        |              |return of goods    |300.000     |33801593845         |1308116125874961   |tejarat       |1401-02-05   |  
        | subject is required               | P-BR-7014     | MT73        | 1401-03-04   |                   |300.000     |33801593845         |1308116125874961   |tejarat       |1401-02-05   |   
        | Amount is required                | P-BR-7015     | MT73        | 1401-03-04   |return of goods    |            |33801593845         |1308116125874961   |tejarat       |1401-02-05   | 
        | ReferenceNumber is required       | P-BR-7016     | MT73        | 1401-03-04   |return of goods    |300.000     |                    |1308116125874961   |tejarat       |1401-02-05   | 
        | BankAccountNumber is required     | P-BR-7017     | MT73        | 1401-03-04   |return of goods    |300.000     |33801593845         |                   |tejarat       |1401-02-05   |  
        | Bank  is required                 | P-BR-7018     | MT73        | 1401-03-04   |return of goods    |300.000     |33801593845         |1308116125874961   |              |1401-02-05   |  
        | Referral date is required         | P-BR-7019     | MT73        | 1401-03-04   |return of goods    |300.000     |33801593845         |1308116125874961   |tejarat       |             |  


Scenario Outline: a bank peyment vocher gets modified with its unique properties
        Given 'zahra' has defined a bank peyment vocher with following info
            |Id    |Username    |Date          |Subject          |Amount      |ReferenceNumber  |BankAccountNumber  |Bank     |ReferralDate|
            |700   |MT73        |1401-03-04    |return of goods  |300.000     |33801593845      |1308116125874961   |tejarat  |1401-02-05  |
        And 'zahra' has defined a bank peyment vocher with following info
            |Id    |Username    |Date          |Subject          |Amount      |ReferenceNumber   |BankAccountNumber  |Bank     |ReferralDate|
            |701   |ZM76        |1401-03-06    |return of goods  |400.000     |33801593895       |1420116125874961   |tejarat  |1401-02-05  |
        When 'zahra' tries to modify a bank peyment vocher with id '700' with follwoing info
            |Username    |Date          |Subject      |Amount      |ReferenceNumber     |BankAccountNumber    |Bank     |ReferralDate| 
            |Username    |Date          |Subject      |Amount      |<ReferenceNumber>   |<BankAccountNumber>  |Bank     |ReferralDate|
        Then she gets error <message> and code <code>

Examples:
        | Message                                  |  Code          | Id  |ReferenceNumber     |BankAccountNumber |
        | ReferenceNumber cannot be duplicated     | P-BR-7020      | 701 |33801593845         |2020116125874961  |
        | BankAccountNumber cannot be duplicated   | P-BR-7020      | 701 |33801598574         |1308116125874961  |        

