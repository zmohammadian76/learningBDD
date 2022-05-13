Feature: Defining new party
    Inorder to manage parties information within the system
    As a operator 
    I want to define a new party


    Background: 
    Given An operator named 'Zahra' has logged in

    Scenario: a new party get defined properly
        When 'zahra' tries to define a new party with follwoing info
            |Id|  Firstname     |Lastname    |PhoneNo        |Address|
            |1|   MOhammadReza  |Taghipour   |09911233223    |1st street, Tehran, Iran|
        Then a new party with id '1' gets defined properly

    Scenario: a new party is not defined with invalid info
        When 'zahra' tries to define a new party with follwoing info
            |Id|  Firstname     |Lastname    |PhoneNo        |Address|
            |<id>|  <firstname>  |<lastname>   |<phoneNo>    |<addres>|
        Then she gets error <message> and code <code>

        Examples:
        | message                      |  code          | id | firstname     | lastname     |phoneNo        |address | 
        | Invalid id is provided       | P-BR-1000      |    | MohammadReza  | Taghipour    |09121233223    | Tehran, Iran|
        | Invalid id is provided       | P-BR-1000      |-1  | MohammadReza  | Taghipour    |09121233223    | Tehran, Iran|
        | Firstname is required        | P-BR-1001      | 1  |               | Taghipour    |09121233223    | Tehran, Iran|
        | Lastname is required         | P-BR-1002      | 1  | MohammadReza  |              |09121233223    | Tehran, Iran|
        | PhoneNumber is required      | P-BR-1003      | 1  | MohammadReza  | Taghipour    |               | Tehran, Iran|

        Scenario: a new party gets defined with its unique properties
            Given 'zahra' has defined a party with following info
                |Id|  Firstname     |Lastname    |PhoneNo        |Address|
                |1|   MOhammadReza  |Taghipour   |09911233223    |1st street, Tehran, Iran|
            When 'zahra' tries to define a new party with follwoing info
                |Id|  Firstname         |Lastname    |PhoneNo        |Address|
                |<id>|  Firstname       |Lastname   |<phoneNo>    | Tehran, Iran|
            Then she gets error <message> and code <code>

            
        Examples:
        | message                              |  code          | id  | phoneNo        |
        | Id cannot be duplicated              | P-BR-1004      | 1   | 09121233223    |
        | PhoneNomber cannot be duplicated     | P-BR-1005      | 2   | 09911233223    | 