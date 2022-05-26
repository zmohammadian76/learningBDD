Feature: Removing receipt voucher
    In order to manage receipt voucher and remove receipt voucher information within the system
    As a operator 
    I want to removing a receipt voucher


 Background: 
       Given 'zahra' has admin system and logged in
       And there is a party with following info
            |Id   |username       |Firstname     |Lastname    |PhoneNo        |Address|
            |1    |MT73           |MOhammadReza  |Taghipour   |09911233223    |1st street, Tehran, Iran|
       And there is a cashbox with title 'cashbox-main-3' and following info
            |id     |title cashbox       |status|  
            |101    |cashbox-main-3      |active|

 Scenario: receipt voucher gets removed properly
        Given 'zahra' has defined a receipt voucher with following info
            |Id    |Username    |Date          |subject      |Amount      |cashbox     |
            |200   |MT73        |1401.03.04    |sales goods  |500.000     |cashbox-main|
        And 'zahra' has defined a receipt voucher with following info
            |Id    |Username    |Date          |subject      |Amount      |cashbox     |
            |201   |ZM76        |1401.03.04    |sales goods  |200.000     |cashbox-main|
        When 'zahra' tries to remove the cashbox with id '200'
        Then she will no loger see a party with id '200' within the system