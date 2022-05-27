Feature: Removing cash receipt voucher
    In order to manage receipt voucher and remove receipt voucher information within the system
    As a operator 
    I want to removing a cash receipt voucher


 Background: 
       Given 'zahra' is system administrator and has logged in
       And there is a party with following info
            |Id   |Username       |Firstname     |Lastname    |PhoneNo        |Address|
            |1    |MT73           |MOhammadReza  |Taghipour   |09911233223    |1st street, Tehran, Iran|
       And there is a cashbox with title 'cashbox-main-3' and following info
            |Id     |Title cashbox       |Status|  
            |101    |cashbox-main-3      |active|

 Scenario: cash receipt voucher gets removed properly
        Given 'zahra' has defined a cash receipt voucher with following info
            |Id    |Username    |Date          |Subject      |Amount      |Cashbox       |
            |200   |MT73        |1401-03-04    |sales goods  |500.000     |cashbox-main-3|
        And 'zahra' has defined a cash receipt voucher with following info
            |Id    |Username    |Date          |Subject      |Amount      |Cashbox       |
            |201   |ZM76        |1401-03-04    |sales goods  |200.000     |cashbox-main-3|
        When 'zahra' tries to remove the cash receipt voucher with id '200'
        Then she will no loger see a cash receipt voucher with id '200' within the system