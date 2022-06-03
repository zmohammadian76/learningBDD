Feature: Removing cashbox
    In order to manage Cash and remove cashbox information within the system
    As a financial manager 
    I want to removing a cashbox


Background: 
    Given A financial manager named 'Mina' has logged in

 Scenario: cashbox gets removed properly
        Given 'Mina' has defined a cashbox with following info
            |Id     |Title           |Status|  
            |100    |cashbox-main-1  |active|
        And 'Mina' has defined a cashbox with following info
            |Id     |Title           |Status|  
            |101    |cashbox-main-3  |active|
        When 'Mina' tries to remove the cashbox with id '100'
        Then she will no loger see a cashbox with id '100' within the system


Scenario: a cashbox is removed only when the receipt voucher has not been
        Given there is a party with following info
            |Id   |Username       |Firstname     |Lastname    |PhoneNo        |Address|
            |1    |MT73           |MOhammadReza  |Taghipour   |09911233223    |1st street, Tehran, Iran|
        And there is a cashbox with title 'cashbox-main-1' and following info
            |Id     |Title            |Status|  
            |100    |cashbox-main-1   |active|    
        And there is a cash receipt voucher with following info
            |Id    |Username    |Date          |Subject      |Amount      |Cashbox       |
            |200   |MT73        |1401-03-04    |sales goods  |500.000     |cashbox-main-1| 
        When 'Mina' tries to remove the cashbox with id '100'
        Then she gets error 'a receipt voucher has been for this cashbox' and code 'C-BR-2007'  


Scenario: a cashbox is removed only when the peyment voucher has not been
        Given there is a party with following info
            |Id   |Username       |Firstname     |Lastname    |PhoneNo        |Address|
            |1    |MT73           |MOhammadReza  |Taghipour   |09911233223    |1st street, Tehran, Iran|
        And there is a cashbox with title 'cashbox-main-1' and following info
            |Id     |Title            |Status|  
            |100    |cashbox-main-1   |active|
        And there is a cash peyment voucher with following info
            |Id    |Username    |Date          |Subject          |Amount      |Cashbox       |
            |600   |MT73        |1401-03-04    |return of goods  |500.000     |cashbox-main-3| 
        When 'Mina' tries to remove the cashbox with id '100'
        Then she gets error 'a peyment voucher has been for this cashbox' and code 'C-BR-2008' 
