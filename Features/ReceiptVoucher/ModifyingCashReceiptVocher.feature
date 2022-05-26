Feature: Modifying a receipt voucher
    In order to manage and modify receipt voucher information within the system
    As an operator 
    I want to modify a receipt voucher information


    Background: 
       Given 'zahra' has admin system and logged in
       And there is a party with following info
            |Id   |username       |Firstname     |Lastname    |PhoneNo        |Address|
            |1    |MT73           |MOhammadReza  |Taghipour   |09911233223    |1st street, Tehran, Iran|
       And there is a cashbox with title 'cashbox-main-3' and following info
            |id     |title cashbox       |status|  
            |101    |cashbox-main-3      |active|


    Scenario: receipt voucher gets modified properly
        Given 'zahra' has defined a receipt voucher with following info
            |Id    |Username    |Date          |subject      |Amount      |cashbox     |
            |200   |MT73        |1401.03.04    |sales goods  |500.000     |cashbox-main|
        When 'zahra' tries to modify a receipt voucher with id '200' with follwoing info
            |Username   |Date          |subject      |Amount      |cashbox     |
            |ZM76       |1401.03.05    |sales goods  |300.000     |cashbox-main-2|
        Then the party with id '200' gets modified properly

    Scenario Outline: a receipt voucher is not modified with invalid info
       Given 'zahra' has defined a receipt voucher with following info
            |Id    |Username    |Date          |subject      |Amount      |cashbox     |
            |200   |MT73        |1401.03.04    |sales goods  |500.000     |cashbox-main|
        When 'zahra' tries to modify a receipt voucher with id '200' with follwoing info
            |Username    |Date        |subject      |Amount      |cashbox     |
            |<Username>  |<Date>      |<subject>    |<Amount>    |<cashbox>   |
        Then she gets error <message> and code <code>

     Examples:
        | message                    |  code         | username    | Date         |subject        |Amount      |cashbox     |
        | username is Required       | P-BR-3009     |             | 1401.03.04   |sales goods    |500.000     |cashbox-main|
        | Date is Required           | P-BR-3009     |    MT73     |              |sales goods    |500.000     |cashbox-main|
        | subject is Required        | P-BR-3009     |    MT73     | 1401.03.04   |               |500.000     |cashbox-main|
        | Amount is Required         | P-BR-3009     |    MT73     | 1401.03.04   |sales goods    |            |cashbox-main|
        | cashbox is Required        | P-BR-3009     |    MT73     | 1401.03.04   |sales goods    |500.000     |            |


    Scenario Outline: a receipt voucher gets modified with its unique properties
            Given 'zahra' has defined a receipt voucher with following info
                |Id    |Username    |Date          |subject      |Amount      |cashbox     |
                |200   |MT73        |1401.03.04    |sales goods  |500.000     |cashbox-main|
            And 'Mina' has defined a party with following info
                |Id    |Username    |Date          |subject      |Amount      |cashbox     |
                |201   |ZM76        |1401.03.05    |sales goods  |400.000     |cashbox-main-2|
            When 'zahra' tries to modify a party with id '200' with follwoing info
                |Username    |Date       |subject      |Amount      |cashbox     |  
                |<Username>  |Date       |subject      |Amount      |cashbox     |
            Then she gets error <message> and code <code> 

     Examples:
        | message                          |  code       | username    | Date         |subject      |Amount    |cashbox     |
        | username cannot be duplicated    | P-BR-3010   |  ZM76       | 1401.03.04   |sales goods  |500.000   |cashbox-main|
            

