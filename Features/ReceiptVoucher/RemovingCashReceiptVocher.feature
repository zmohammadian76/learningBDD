Feature: Removing receipt voucher
    In order to manage receipt voucher and remove receipt voucher information within the system
    As a operator 
    I want to removing a receipt voucher


 Background: 
       Given An operator named 'Zahra' has admin system and logged in
       Given there is a party and a cashbox active

 Scenario: receipt voucher gets removed properly
        Given 'zahra' has defined a receipt voucher with following info
            |Id    |Username    |Date          |subject      |Amount      |cashbox     |
            |200   |MT73        |1401.03.04    |sales goods  |500.000     |cashbox-main|
        And 'zahra' has defined a receipt voucher with following info
            |Id    |Username    |Date          |subject      |Amount      |cashbox     |
            |201   |ZM76        |1401.03.04    |sales goods  |200.000     |cashbox-main|
        When 'zahra' tries to remove the cashbox with id '200'
        Then she will no loger see a party with id '200' within the system