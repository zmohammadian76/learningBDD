Feature: Removing party
    Inorder to manage parties information and remove party information within the system
    As an operator 
    I want to removing a party


     Background: 
        Given An operator named 'Zahra' has logged in

    Scenario: party gets removed properly
        Given 'zahra' has defined a party with following info
            |Id|  Firstname     |Lastname    |PhoneNo        |Address|
            |1|   MOhammadReza  |Taghipour   |09911233223    |1st street, Tehran, Iran|
        And 'zahra' has defined a party with following info
            |Id|  Firstname  |Lastname    |PhoneNo        |Address|
            |2|   Arsalan    |Kazemi      |0991123300    |1st street, Tehran, Iran|
        When 'zahra' tries to remove the party with id '1'
        Then she will no loger see a party with id '1' within the system

    @skipped
    Scenario: party is not removed when it is used in any payment voucher

    @skipped
    Scenario: party is not removed when it is used in any receipt voucher