Feature: Defining a new bank receipt vocher
    In order to manage bank receipt vocher
    As a operator 
    I want to define a new bank receipt vocher


Background: 
       Given 'zahra' is system administrator and has logged in
       And there is a party with following info
           |Id   |Username       |Firstname     |Lastname    |PhoneNo        |Address|
           |1    |MT73           |MOhammadReza  |Taghipour   |09911233223    |1st street, Tehran, Iran|

Scenario: a new bank receipt vocher gets defined properly
       When 'Zahra' tries to define a new bank transfer receipt vocher with follwoing info
          |Id    |Username    |Date          |Subject      |Amount      |ReferenceNumber   |Bank        |BankBranch    |ReferralDate|
          |300   |MT73        |1401-03-04    |sales goods  |300.000     |33801593845       | tejarat    |saadatAbad    |1401-02-05  |
       Then a new bank receipt vocher with Id '300' gets defined properly 


Scenario Outline: a new bank receipt is not defined with invalid info
        When 'zahra' tries to define a new bank receipt with follwoing info
           |Id    |Username    |Date        |Subject      |Amount      |ReferenceNumber     |Bank        |BankBranch    |ReferralDate  |
           |<Id>  |<Username>  |<Date>      |<subject>    |<Amount>    |<ReferenceNumber>   |<Bank>      |<BankBranch>  |<ReferralDate>|
        Then she gets error <message> and code <code>

  Examples:
        | Message                    |  Code         | id | Username    | Date         |Subject        |Amount      |ReferenceNumber  |Bank        |BankBranch    |ReferralDate | 
        | Invalid id is provided     | P-BR-4000     |    | MT73        | 1401-03-04   |sales goods    |300.000     |33801593845      | tejarat    |saadatAbad    |1401-02-05   |
        | Invalid id is provided     | P-BR-4000     |-300| MT73        | 1401-03-04   |sales goods    |300.000     |33801593845      | tejarat    |saadatAbad    |1401-02-05   |
        | username is required       | P-BR-4001     |300 |             | 1401-03-04   |sales goods    |300.000     |33801593845      | tejarat    |saadatAbad    |1401-02-05   |
        | Date is required           | P-BR-4002     |300 | MT73        |              |sales goods    |300.000     |33801593845      | tejarat    |saadatAbad    |1401-02-05   |
        | subject is required        | P-BR-4003     |300 | MT73        | 1401-03-04   |               |300.000     |33801593845      | tejarat    |saadatAbad    |1401-02-05   |
        | Amount is required         | P-BR-4004     |300 | MT73        | 1401-03-04   |sales goods    |            |33801593845      | tejarat    |saadatAbad    |1401-02-05   |
        | invalid Amount is provided | P-BR-4005     |300 | MT73        | 1401-03-04   |sales goods    |-300        |33801593845      | tejarat    |saadatAbad    |1401-02-05   |
        | Refrence is required       | P-BR-4006     |300 | MT73        | 1401-03-04   |sales goods    |300.000     |                 | tejarat    |saadatAbad    |1401-02-05   |
        | Bank name is required      | P-BR-4007     |300 | MT73        | 1401-03-04   |sales goods    |300.000     |33801593845      |            |saadatAbad    |1401-02-05   |
        | Branch name is required    | P-BR-4008     |300 | MT73        | 1401-03-04   |sales goods    |300.000     |33801593845      | tejarat    |              |1401-02-05   |
        | Referral date is required  | P-BR-4009     |300 | MT73        | 1401-03-04   |sales goods    |300.000     |33801593845      | tejarat    |saadatAbad    |             |


Scenario Outline: a new bank receipt gets defined with its unique properties
        Given 'zahra' has defined a bank receipt with following info
            |Id    |Username    |Date          |Subject      |Amount      |ReferenceNumber  |Bank        |BankBranch    |ReferralDate |
            |300   |MT73        |1401-03-04    |sales goods  |300.000     |33801593845      | tejarat    |saadatAbad    |1401-02-05   |
        When 'zahra' tries to define a new bank receipt vocher with follwoing info
            |Id    |Username    |Date          |Subject      |Amount      |ReferenceNumber       |Bank        |BankBranch    |ReferralDate |
            |<Id>  |MT73        |1401-03-04    |sales goods  |300.000     |<ReferenceNumber>     | tejarat    |saadatAbad    |1401-02-05   |
        Then she gets error <message> and code <code>

 Examples:
        | Message                              |  Code          | Id  |ReferenceNumber |
        | Id cannot be duplicated              | P-BR-4010      | 300 |33805065987     |
        | Reference cannot be duplicated       | P-BR-4011      | 301 |33801593845     |
