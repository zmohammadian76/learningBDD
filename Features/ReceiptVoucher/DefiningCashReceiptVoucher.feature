 Feature: Defining a new  cash receipt voucher
    In order to manage cash receipts
    As a operator 
    I want to define a new cash receipt voucher


    Background: 
       Given 'zahra' is system administrator and has logged in
       And there is a party with following info
            |Id   |Username       |Firstname     |Lastname    |PhoneNo        |Address|
            |1    |MT73           |MOhammadReza  |Taghipour   |09911233223    |1st street, Tehran, Iran|
       And there is a cashbox with title 'cashbox-main-3' and following info
            |id     |title cashbox       |status|  
            |101    |cashbox-main-3      |active|


     Scenario: a new cash receipt voucher gets defined properly
       When 'Zahra' tries to define a new receipt voucher with follwoing info
          |Id    |Username    |Date          |Subject      |Amount      |Cashbox     |
          |200   |MT73        |1401-03-04    |sales goods  |500.000     |cashbox-main-3|
       Then a new cash receipt voucher with Id '200' gets defined properly

       Scenario Outline: a new cash receipt voucher is not defined with invalid info
        When 'zahra' tries to define a new cash receipt voucher with follwoing info
           |Id    |Username    |Date        |Subject      |Amount      |Cashbox  |
           |<Id>  |<Username>  |<Date>      |<subject>    |<Amount>    |<cashbox>|
        Then she gets error <message> and code <code>

       Examples:
        | Message                    |  Code         | id | Username    | Date         |Subject        |Amount      |Cashbox       | 
        | Invalid id is provided     | R-BR-3000     |    | MT73        | 1401-03-04   |sales goods    |500.000     |cashbox-main-3|
        | Invalid id is provided     | R-BR-3000     |-200| MT73        | 1401-03-04   |sales goods    |500.000     |cashbox-main-3|
        | username is required       | R-BR-3001     |200 |             | 1401-03-04   |sales goods    |500.000     |cashbox-main-3|
        | Date is required           | R-BR-3002     |200 | MT73        |              |sales goods    |500.000     |cashbox-main-3|
        | subject is required        | R-BR-3003     |200 | MT73        | 1401-03-04   |               |500.000     |cashbox-main-3|
        | Amount is required         | R-BR-3004     |200 | MT73        | 1401-03-04   |sales goods    |            |cashbox-main-3|
        | invalid Amount is provided | R-BR-3005     |200 | MT73        | 1401-03-04   |sales goods    |-500        |cashbox-main-3|
        | cashbox is required        | R-BR-3006     |200 | MT73        | 1401-03-04   |sales goods    |500.000     |              |


        Scenario: a new cash receipt voucher gets defined with its unique properties
            Given 'zahra' has defined a cash receipt voucher with following info
                |Id    |Username    |Date          |Subject      |Amount      |Cashbox       |
                |200   |MT73        |1401-03-04    |subject      |500.000     |cashbox-main-3|
            When 'zahra' tries to define a new cash receipt voucher with follwoing info
                |Id    |Username    |Date          |Subject      |Amount      |Cashbox       |
                |200   |EM76        |1401-03-06    |subject      |450.000     |cashbox-main-3|
            Then she gets error 'Id cannot be duplicated' and code 'R-BR-3007'


        Scenario: a new cash receipt voucher gets defined only for active cashbox
           Given there is a cashbox with title 'cashbox-main-1' and following info
               |Id     |Title            |Status  |  
               |100    |cashbox-main-1   |deactive|
           When 'zahra' tries to define a new cash receipt voucher with following info
               |Id    |Username    |Date          |Subject      |Amount      |Cashbox       |
               |200   |MT73        |1401-03-04    |subject      |500.000     |cashbox-main-1|
           Then she gets error 'cashbox is deactive' and code 'R-BR-3008'