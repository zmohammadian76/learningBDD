 Feature: Defining a new  cash receipt voucher
    In order to manage cash receipts
    As a operator 
    I want to define a new cash receipt voucher


    Background: 
       Given 'zahra' has admin system and logged in
       And there is a party with following info
            |Id   |Username       |Firstname     |Lastname    |PhoneNo        |Address|
            |1    |MT73           |MOhammadReza  |Taghipour   |09911233223    |1st street, Tehran, Iran|
       And there is a cashbox with title 'cashbox-main-3' and following info
            |id     |title cashbox       |status|  
            |101    |cashbox-main-3      |active|


     Scenario: a new cash receipt voucher gets defined properly
       When 'Zahra' tries to define a new receipt voucher with follwoing info
          |Id    |Username    |Date          |Subject      |Amount      |Cashbox     |
          |200   |MT73        |1401-03-04    |sales goods  |500.000     |cashbox-main|
       Then a new cash receipt voucher with Id '200' gets defined properly

       Scenario Outline: a new cash receipt voucher is not defined with invalid info
        When 'zahra' tries to define a new cash receipt voucher with follwoing info
           |Id    |Username    |Date        |Subject      |Amount      |Cashbox  |
           |<Id>  |<Username>  |<Date>      |<subject>    |<Amount>    |<cashbox>|
        Then she gets error <message> and code <code>

       Examples:
        | Message                    |  Code         | id | Username    | Date         |Subject        |Amount      |Cashbox     | 
        | Invalid id is provided     | P-BR-3000     |    | MT73        | 1401-03-04   |sales goods    |500.000     |cashbox-main|
        | Invalid id is provided     | P-BR-3000     |-200| MT73        | 1401-03-04   |sales goods    |500.000     |cashbox-main|
        | username is required       | P-BR-3001     |200 |             | 1401-03-04   |sales goods    |500.000     |cashbox-main|
        | Date is required           | P-BR-3002     |200 | MT73        |              |sales goods    |500.000     |cashbox-main|
        | subject is required        | P-BR-3003     |200 | MT73        | 1401-03-04   |               |500.000     |cashbox-main|
        | Amount is required         | P-BR-3004     |200 | MT73        | 1401-03-04   |sales goods    |            |cashbox-main|
        | invalid Amount is provided | P-BR-3005     |200 | MT73        | 1401-03-04   |sales goods    |-500        |cashbox-main|
        | cashbox is required        | P-BR-3006     |200 | MT73        | 1401-03-04   |sales goods    |500.000     |            |


        Scenario Outline: a new cash receipt voucher gets defined with its unique properties
            Given 'zahra' has defined a cash receipt voucher with following info
                |Id    |Username    |Date          |Subject      |Amount      |Cashbox     |
                |200   |MT73        |1401-03-04    |subject      |500.000     |cashbox-main|
            When 'zahra' tries to define a newcash receipt voucher with follwoing info
                |Id    |Username    |Date          |Subject      |Amount      |Cashbox     |
                |<Id>  |Username    |Date          |subject      |Amount      |cashbox     |
            Then she gets error <message> and code <code>


       Examples:
        | Message                              |  Code          | Id |
        | Id cannot be duplicated              | P-BR-3007      | 200|


        Scenario Outline: a new cash receipt voucher gets defined only for active cashbox
           Given 'Mina' has defined a cashbox with following info
               |Id     |Title            |Status|  
               |100    |cashbox-main-1   |false |
           When 'zahra' tries to define a new cash receipt voucher with following info
               |Id    |Username    |Date          |Subject      |Amount      |Cashbox     |
               |200   |MT73        |1401-03-04    |subject      |500.000     |cashbox-main|
           Then she gets error <message> and code <code>

       Examples:
        | Message                          |  Code          | Id    |Status  |
        | cashbox is deactive              | P-BR-3008      | 100   |deactive|

