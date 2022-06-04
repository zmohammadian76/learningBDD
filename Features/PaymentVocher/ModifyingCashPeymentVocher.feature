Feature: Modifying a cash peyment voucher
    In order to manage and modify cash peyment voucher information within the system
    As an operator 
    I want to modify a cash peyment voucher information


Background: 
    Given 'zahra' is system administrator and has logged in
    And there is a party with following info
        |Id   |Username       |Firstname     |Lastname    |PhoneNo        |Address|
        |1    |MT73           |MOhammadReza  |Taghipour   |09911233223    |1st street, Tehran, Iran|
    And there is a cashbox with title 'cashbox-main-3' and following info
        |id     |Title cashbox       |Status|  
        |101    |cashbox-main-3      |active|  


Scenario: cash peyment voucher gets modified properly
    Given 'zahra' has defined a cash peyment voucher with following info
        |Id    |Username    |Date          |Subject          |Amount      |Cashbox       |
        |600   |MT73        |1401-03-04    |return of goods  |500.000     |cashbox-main-3|
    When 'zahra' tries to modify a cash peyment voucher with id '600' with follwoing info
        |Username   |Date          |Subject          |Amount      |Cashbox     |
        |MT73       |1401-03-05    |return of goods  |300.000     |cashbox-main-3|
    Then the party with id '600' gets modified properly


Scenario Outline: a cash peyment voucher is not modified with invalid info
    Given 'zahra' has defined a cash peyment voucher with following info
        |Id    |Username    |Date          |Subject          |Amount      |Cashbox       |
        |600   |MT73        |1401-03-04    |return of goods  |500.000     |cashbox-main-3|
    When 'zahra' tries to modify a cash peyment voucher with id '600' with follwoing info
        |Username    |Date        |Subject      |Amount      |Cashbox     |
        |<Username>  |<Date>      |<Subject>    |<Amount>    |<Cashbox>   |
    Then she gets error <message> and code <code>  

Examples:
        | Message                    |  Code         | Username    | Date         |Subject            |Amount      |Cashbox       |
        | username is Required       | P-BR-6007     |             | 1401-03-04   |return of goods    |500.000     |cashbox-main-3|
        | Date is Required           | P-BR-6008     |    MT73     |              |return of goods    |500.000     |cashbox-main-3|
        | subject is Required        | P-BR-6009     |    MT73     | 1401-03-04   |                   |500.000     |cashbox-main-3|
        | Amount is Required         | P-BR-6010     |    MT73     | 1401-03-04   |return of goods    |            |cashbox-main-3|
        | cashbox is Required        | P-BR-6011     |    MT73     | 1401-03-04   |return of goods    |500.000     |              |

Scenario: a cash peyment voucher is modified only for active cashbox
        Given there is a cashbox with title 'cashbox-main-1' and following info
            |Id     |Title            |Status|  
            |100    |cashbox-main-1   |active|
        And there is a cashbox with title 'cashbox-main-2'
            |Id     |Title            |Status  |  
            |102    |cashbox-main-2   |deactive|
        And there is a cash peyment voucher with following info
            |Id    |Username    |Date          |Subject          |Amount      |Cashbox       |
            |600   |MT73        |1401-03-04    |return of goods  |500.000     |cashbox-main-1|
        When 'zahra' tries to modify a cash peyment voucher with following info
            |Username    |Date          |Subject          |Amount      |Cashbox       |
            |MT73        |1401-03-04    |return of goods  |500.000     |cashbox-main-2|
        Then she gets error 'cashbox is deactive' and code 'P-BR-6012'         