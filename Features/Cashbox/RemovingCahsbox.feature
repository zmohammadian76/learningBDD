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