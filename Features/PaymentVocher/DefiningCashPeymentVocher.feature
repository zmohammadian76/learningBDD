Feature: Defining a new  cash peyment voucher
    In order to manage cash peyment voucher
    As a operator 
    I want to define a new cash peyment voucher


Background: 
    Given 'zahra' is system administrator and has logged in
    And there is a party with following info
        |Id   |Username       |Firstname     |Lastname    |PhoneNo        |Address|
        |1    |MT73           |MOhammadReza  |Taghipour   |09911233223    |1st street, Tehran, Iran|
    And there is a cashbox with title 'cashbox-main-3' and following info
        |id     |title cashbox       |status|  
        |101    |cashbox-main-3      |active|

Scenario: a new cash peyment voucher gets defined properly
    When 'Zahra' tries to define a new cash peyment voucher with follwoing info
        |Id    |Username    |Date          |Subject          |Amount      |Cashbox       |
        |600   |MT73        |1401-03-04    |return of goods  |500.000     |cashbox-main-3|
    Then a new cash receipt voucher with Id '600' gets defined properly   

 Scenario Outline: a new cash peyment voucher is not defined with invalid info
    When 'zahra' tries to define a new cash peyment voucher with follwoing info
        |Id    |Username    |Date        |Subject      |Amount      |Cashbox  |
        |<Id>  |<Username>  |<Date>      |<subject>    |<Amount>    |<cashbox>|
    Then she gets error <message> and code <code> 

Examples:
        | Message                    |  Code         | id | Username    | Date         |Subject            |Amount      |Cashbox       | 
        | Invalid id is provided     | P-BR-6000     |    | MT73        | 1401-03-04   |return of goods    |500.000     |cashbox-main-3|
        | Invalid id is provided     | P-BR-6000     |-600| MT73        | 1401-03-04   |return of goods    |500.000     |cashbox-main-3|
        | username is required       | P-BR-6001     |600 |             | 1401-03-04   |return of goods    |500.000     |cashbox-main-3|
        | Date is required           | P-BR-6002     |600 | MT73        |              |return of goods    |500.000     |cashbox-main-3|
        | subject is required        | P-BR-6003     |600 | MT73        | 1401-03-04   |                   |500.000     |cashbox-main-3|
        | Amount is required         | P-BR-6004     |600 | MT73        | 1401-03-04   |return of goods    |            |cashbox-main-3|
        | invalid Amount is provided | P-BR-6005     |600 | MT73        | 1401-03-04   |return of goods    |-500        |cashbox-main-3|
        | cashbox is required        | P-BR-6006     |600 | MT73        | 1401-03-04   |return of goods    |500.000     |              |


Scenario: a new cash peyment voucher gets defined with its unique properties
        Given 'zahra' has defined a cash peyment voucher with following info
            |Id    |Username    |Date          |Subject           |Amount      |Cashbox       |
            |600   |MT73        |1401-03-04    |return of goods   |500.000     |cashbox-main-3|
        When 'zahra' tries to define a new cash peyment voucher with follwoing info
            |Id    |Username    |Date          |Subject          |Amount      |Cashbox       |
            |600   |EM76        |1401-03-06    |return of goods  |450.000     |cashbox-main-3|
        Then she gets error 'Id cannot be duplicated' and code 'P-BR-6007'


Scenario: a new cash peyment voucher gets defined only for active cashbox
        Given there is a cashbox with title 'cashbox-main-1' and following info
            |Id     |Title            |Status  |  
            |100    |cashbox-main-1   |deactive|
        When 'zahra' tries to define a new cash peyment voucher with following info
            |Id    |Username    |Date          |Subject          |Amount      |Cashbox       |
            |600   |MT73        |1401-03-04    |return of goods  |500.000     |cashbox-main-1|
        Then she gets error 'cashbox is deactive' and code 'P-BR-3008'
