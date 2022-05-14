Feature: Modifying a party
    Inorder to manage and modify parties information within the system
    As an operator 
    I want to modify a party information


    Background: 
        Given An operator named 'Zahra' has logged in

    Scenario: party gets modified properly
        Given 'zahra' has defined a party with following info
            |Id|  Firstname     |Lastname    |PhoneNo        |Address|
            |1|   MOhammadReza  |Taghipour   |09911233223    |1st street, Tehran, Iran|
        When 'zahra' tries to modify a party with id '1' with follwoing info
            | Firstname     |Lastname    |PhoneNo        |Address|
            | MOhammadReza  |Taghipour   |09911233223    |1st street, Tehran, Iran|
        Then the party with id '1' gets modified properly

     Scenario Outline: a party is not modified with invalid info
        Given 'zahra' has defined a party with following info
            |Id|  Firstname     |Lastname    |PhoneNo        |Address|
            |1|   MOhammadReza  |Taghipour   |09911233223    |1st street, Tehran, Iran|
        When 'zahra' tries to modify a party with id '1' with follwoing info
            |Firstname     |Lastname    |PhoneNo        |Address|
            |  <firstname>  |<lastname>   |<phoneNo>    |<addres>|
        Then she gets error <message> and code <code>

        Examples:
        | message                      |  code          | id | firstname     | lastname     |phoneNo        |address | 
        | Firstname is required        | P-BR-1001      | 1  |               | Taghipour    |09121233223    | Tehran, Iran|
        | Lastname is required         | P-BR-1002      | 1  | MohammadReza  |              |09121233223    | Tehran, Iran|
        | PhoneNumber is required      | P-BR-1003      | 1  | MohammadReza  | Taghipour    |               | Tehran, Iran|

        Scenario Outline: a party gets modified with its unique properties
            Given 'zahra' has defined a party with following info
                |Id|  Firstname     |Lastname    |PhoneNo        |Address|
                |1|   MOhammadReza  |Taghipour   |09911233223    |1st street, Tehran, Iran|
            And 'zahra' has defined a party with following info
                |Id|  Firstname  |Lastname    |PhoneNo        |Address|
                |2|   Arsalan    |Kazemi      |0991123300    |1st street, Tehran, Iran|
            When 'zahra' tries to modify a party with id '1' with follwoing info
                | Firstname      | Lastname    | PhoneNo      |Address|
                | MohammadReza   | Taghipour   | <phoneNo>    | Tehran, Iran|
            Then she gets error <message> and code <code>

        Examples:
        | message                              |  code          | id  | phoneNo        |
        | PhoneNomber cannot be duplicated     | P-BR-1005      | 1   | 0991123300    | 
