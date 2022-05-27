Feature: Modifying a cash receipt voucher
    In order to manage and modify cash receipt voucher information within the system
    As an operator 
    I want to modify a cash receipt voucher information


    Background: 
       Given 'zahra' has admin system and logged in
       And there is a party with following info
            |Id   |Username       |Firstname     |Lastname    |PhoneNo        |Address|
            |1    |MT73           |MOhammadReza  |Taghipour   |09911233223    |1st street, Tehran, Iran|
       And there is a cashbox with title 'cashbox-main-3' and following info
            |id     |Title cashbox       |Status|  
            |101    |cashbox-main-3      |active|


    Scenario: cash receipt voucher gets modified properly
        Given 'zahra' has defined a cash receipt voucher with following info
            |Id    |Username    |Date          |Subject      |Amount      |Cashbox     |
            |200   |MT73        |1401.03.04    |sales goods  |500.000     |cashbox-main|
        When 'zahra' tries to modify a cash receipt voucher with id '200' with follwoing info
            |Username   |Date          |Subject      |Amount      |Cashbox     |
            |ZM76       |1401.03.05    |sales goods  |300.000     |cashbox-main-2|
        Then the party with id '200' gets modified properly

    Scenario Outline: a cash receipt voucher is not modified with invalid info
       Given 'zahra' has defined a receipt voucher with following info
            |Id    |Username    |Date          |Subject      |Amount      |Cashbox     |
            |200   |MT73        |1401.03.04    |sales goods  |500.000     |cashbox-main|
        When 'zahra' tries to modify a cash receipt voucher with id '200' with follwoing info
            |Username    |Date        |Subject      |Amount      |Cashbox     |
            |<Username>  |<Date>      |<Subject>    |<Amount>    |<Cashbox>   |
        Then she gets error <message> and code <code>

     Examples:
        | Message                    |  Code         | Username    | Date         |Subject        |Amount      |Cashbox     |
        | username is Required       | P-BR-3009     |             | 1401.03.04   |sales goods    |500.000     |cashbox-main|
        | Date is Required           | P-BR-3009     |    MT73     |              |sales goods    |500.000     |cashbox-main|
        | subject is Required        | P-BR-3009     |    MT73     | 1401.03.04   |               |500.000     |cashbox-main|
        | Amount is Required         | P-BR-3009     |    MT73     | 1401.03.04   |sales goods    |            |cashbox-main|
        | cashbox is Required        | P-BR-3009     |    MT73     | 1401.03.04   |sales goods    |500.000     |            |


    Scenario Outline: a cash receipt voucher gets modified with its unique properties
            Given 'zahra' has defined a cash receipt voucher with following info
                |Id    |Username    |Date          |Subject      |Amount      |Cashbox     |
                |200   |MT73        |1401.03.04    |sales goods  |500.000     |cashbox-main|
            And 'Mina' has defined a party with following info
                |Id    |Username    |Date          |Subject      |Amount      |Cashbox     |
                |201   |ZM76        |1401.03.05    |sales goods  |400.000     |cashbox-main-2|
            When 'zahra' tries to modify a party with id '200' with follwoing info
                |Username    |Date       |Subject      |Amount      |Cashbox     |  
                |<Username>  |Date       |subject      |Amount      |cashbox     |
            Then she gets error <message> and code <code> 

     Examples:
        | Message                          |  Code       | Username    | Date         |Subject      |Amount    |Cashbox     |
        | username cannot be duplicated    | P-BR-3010   |  ZM76       | 1401.03.04   |sales goods  |500.000   |cashbox-main|
            

