Feature: Removing bank transfer receipt
    In order to manage bank transfer receipt and remove bank transfer receipt information within the system
    As a operator 
    I want to removing a bank transfer receipt


Background: 
    Given 'zahra' is system administrator and has logged in
    And there is a party with following info
        |Id   |Username       |Firstname     |Lastname    |PhoneNo        |Address|
        |1    |MT73           |MOhammadReza  |Taghipour   |09911233223    |1st street, Tehran, Iran|

Scenario: bank transfer receipt gets removed properly
        Given 'zahra' has defined a bank transfer receipt with following info
             |Id    |Username    |Date          |Subject      |Amount      |Reference    |Bank name   |Branch name   |Referral date|
             |300   |MT73        |1401-03-04    |sales goods  |300.000     |33801593845  | tejarat    |saadatAbad    |1401-02-05   |
        And 'zahra' has defined a cbank transfer receipt with following info
             |Id    |Username    |Date          |Subject      |Amount      |Reference    |Bank name   |Branch name   |Referral date|
             |301   |ZM76        |1401-03-06    |sales goods  |400.000     |33801593895  | tejarat    |saadatAbad    |1401-02-08   |
        When 'zahra' tries to remove the cash receipt voucher with id '300'
        Then she will no loger see a bank transfer receipt with id '300' within the system