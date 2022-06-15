Feature: Getting balance Report of vouchers
In order to manage Company's financial account
As a financial manager
I want to get Balance Report from vouchers

    Background:
    Given 'Mina' is system administrator and has logged in
    And there is a party with following info
        |Id   |Username       |Firstname     |Lastname    |PhoneNo        |Address|
        |1    |MT73           |MOhammadReza  |Taghipour   |09911233223    |1st street, Tehran, Iran |
        |2    |ZM76           |Zahra         |Mohammadian |09135556985    |1st street, esfahan, Iran|
        |3    |EH96           |Elham         |Hamidi      |09131112547    |1st street, karaj, Iran  |
    And there is a cashbox with following info
        |Id     |Title              |Status|  
        |100    |cashbox-main-3     |active|            
    And there are cash receipts vocher with following info
        |Id    |Username    |Date          |Subject      |Amount      |Cashbox       |
        |200   |MT73        |1401-03-04    |sales goods  |500.000     |cashbox-main-3|
        |201   |ZM76        |1401-03-03    |sales goods  |400.000     |cashbox-main-3|
        |202   |EH96        |1401-03-02    |sales goods  |300.000     |cashbox-main-3|
    And there are cash peyments voucher with following info
        |Id    |Username    |Date          |Subject          |Amount      |Cashbox       |
        |600   |MT73        |1401-03-04    |return of goods  |500.000     |cashbox-main-3|
        |601   |ZM76        |1401-03-03    |return of goods  |200.000     |cashbox-main-3|
        |602   |EH96        |1401-03-02    |return of goods  |600.000     |cashbox-main-3|  
    And there are bank payments vocher with following info
        |Id    |Username    |Date          |Subject          |Amount      |ReferenceNumber  |BankAccountNumber  |Bank     |ReferralDate|
        |700   |MT73        |1401-03-04    |return of goods  |300.000     |33801593845      |1308116125874961   |tejarat  |1401-02-05  | 
        |701   |ZM76        |1401-03-03    |return of goods  |400.000     |33801594455      |1308116125877485   |tejarat  |1401-02-04  | 
        |702   |EH96        |1401-03-02    |return of goods  |200.000     |44801593845      |1308116125874111   |tejarat  |1401-02-05  | 
    And there are bank receipts vocher with following info
        |Id    |Username    |Date          |Subject      |Amount      |ReferenceNumber  |BankAccountNumber  |Bank     |ReferralDate|
        |300   |MT73        |1401-03-04    |sales goods  |300.000     |33801593845      |1308116125874961   |tejarat  |1401-02-05  | 
        |301   |ZM76        |1401-03-03    |sales goods  |250.000     |33801595847      |1401106125874961   |tejarat  |1401-02-04  |  
        |302   |EH96        |1401-03-02    |sales goods  |400.000     |44801593845      |1308116125556661   |tejarat  |1401-02-03  |           

    Scenario Outline: Balance report by filtering on date range gets reported properly
        When 'Mina' tries to gets balance report with following info
          | FromDate   | ToDate   | VocherType   | cashbox   | BankAccountNumber   |
          | <FromDate> | <ToDate> | <VocherType> | <cashbox> | <BankAccountNumber> |
        Then she gets balance report with following info
          | Id    | Date    | Amount    | Username    | VocherType    |
          | <Id1> | <Date1> | <Amount1> | <Username1> | <VocherType1> |
          | <Id2> | <Date2> | <Amount2> | <Username2> | <VocherType2> |
          | <Id3> | <Date3> | <Amount3> | <Username3> | <VocherType3> |
          | <Id4> | <Date4> | <Amount4> | <Username4> | <VocherType4> |

        Examples: Filtering based on date range (1401-03-02)
          | FromDate   | ToDate     | VocherType | Cashbox | BankAccountNumber | Id1 | Date1      | Amount1 | Username1 | VoucherType1 | Id2 | Date2      | Amount2 | Username2 | VoucherType2 | Id3 | Date3      | Amount3 | Username3 | VoucherType3 | Id4 | Date4      | Amount4 | Username4 | VoucherType4 |
          | 1401-03-02 | 1401-03-02 |            |         |                   | 202 | 1401-03-02 | 300.000 | EH96      | cash receipt | 602 | 1401-03-02 | 600.000 | EH96      | cash payment | 702 | 1401-03-02 | 200.000 | EH96      | bank payment | 302 | 1401-03-02 | 400.000 | EH96      | bank receipt |

        Examples: Balance report item (1401-03-03)
          | FromDate   | ToDate     | VocherType | Cashbox | BankAccountNumber | Id1 | Date1      | Amount1 | Username1 | VoucherType1 | Id2 | Date2      | Amount2 | Username2 | VoucherType2 | Id3 | Date3      | Amount3 | Username3 | VoucherType3 | Id4 | Date4      | Amount4 | Username4 | VoucherType4 |
          | 1401-03-03 | 1401-03-03 |            |         |                   | 201 | 1401-03-03 | 400.000 | ZM76      | cash receipt | 601 | 1401-03-03 | 200.000 | ZM76      | cash payment | 701 | 1401-03-03 | 400.000 | ZM76      | bank payment | 301 | 1401-03-03 | 250.000 | ZM76      | bank receipt |

        Examples: Balance report item (1401-03-04)
          | FromDate   | ToDate     | VocherType | Cashbox | BankAccountNumber | Id1 | Date1      | Amount1 | Username1 | VoucherType1 | Id2 | Date2      | Amount2 | Username2 | VoucherType2 | Id3 | Date3      | Amount3 | Username3 | VoucherType3 | Id4 | Date4      | Amount4 | Username4 | VoucherType4 |
          | 1401-03-04 | 1401-03-04 |            |         |                   | 202 | 1401-03-04 | 300.000 | MT73      | cash receipt | 602 | 1401-03-04 | 600.000 | MT73      | cash payment | 702 | 1401-03-04 | 200.000 | MT73      | bank payment | 802 | 1401-03-04 | 400.000 | MT73      | bank receipt |

    Scenario Outline: Balance report by filtering on voucher type gets reported properly
        When 'Mina' tries to gets balance report with following info
          | FromDate   | ToDate   | VocherType   | cashbox   | BankAccountNumber   |
          | <FromDate> | <ToDate> | <VocherType> | <cashbox> | <BankAccountNumber> |
        Then she gets balance report with following info
          | Id    | Date    | Amount    | Username    | VocherType    |
          | <Id1> | <Date1> | <Amount1> | <Username1> | <VocherType1> |
          | <Id2> | <Date2> | <Amount2> | <Username2> | <VocherType2> |
          | <Id3> | <Date3> | <Amount3> | <Username3> | <VocherType3> |
          | <Id4> | <Date4> | <Amount4> | <Username4> | <VocherType4> |

        Examples: Filtering based on voucher type (receipt)
          | FromDate   | ToDate     | VocherType   | cashbox | BankAccountNumber | Id1 | Date1      | Amount1 | Username1 | VoucherType1 | Id2 | Date2      | Amount2 | Username2 | VoucherType2 | Id3 | Date3      | Amount3 | Username3 | VoucherType3 |
          | 1401-03-02 | 1401-03-04 | cash receipt |         |                   | 200 | 1401-03-02 | 500.000 | MT73      | cash receipt | 201 | 1401-03-03 | 400.000 | MT73      | cash receipt | 202 | 1401-03-04 | 300.000 | MT73      | cash receipt |
          | 1401-03-02 | 1401-03-04 | bank receipt |         |                   | 800 | 1401-03-02 | 300.000 | MT73      | bank receipt | 801 | 1401-03-03 | 250.000 | MT73      | bank receipt | 802 | 1401-03-04 | 400.000 | MT73      | bank receipt |

        Examples: Filtering based on voucher type (payment)
          | FromDate   | ToDate     | VocherType   | cashbox | BankAccountNumber | Id1 | Date1      | Amount1 | Username1 | VoucherType1 | Id2 | Date2      | Amount2 | Username2 | VoucherType2 | Id3 | Date3      | Amount3 | Username3 | VoucherType3 |
          | 1401-03-02 | 1401-03-04 | cash payment |         |                   | 600 | 1401-03-02 | 500.000 | MT73      | cash payment | 601 | 1401-03-03 | 200.000 | MT73      | cash payment | 602 | 1401-03-04 | 600.000 | MT73      | cash payment |
          | 1401-03-02 | 1401-03-04 | bank payment |         |                   | 700 | 1401-03-02 | 300.000 | MT73      | bank payment | 701 | 1401-03-03 | 400.000 | MT73      | bank payment | 702 | 1401-03-04 | 200.000 | MT73      | bank payment |

     Scenario Outline: Balance report by filtering on voucher type and cashbox gets reported properly
        When 'Mina' tries to gets balance report with following info
          | FromDate   | ToDate   | VocherType   | cashbox   | BankAccountNumber   |
          | <FromDate> | <ToDate> | <VocherType> | <cashbox> | <BankAccountNumber> |
        Then she gets balance report with following info
          | Id    | Date    | Amount    | Username    | VocherType    |
          | <Id1> | <Date1> | <Amount1> | <Username1> | <VocherType1> |
          | <Id2> | <Date2> | <Amount2> | <Username2> | <VocherType2> |
          | <Id3> | <Date3> | <Amount3> | <Username3> | <VocherType3> |
          | <Id4> | <Date4> | <Amount4> | <Username4> | <VocherType4> |

        Examples: Filtering based on voucher type and cashbox (receipt)
          | FromDate   | ToDate     | VocherType   | cashbox       | BankAccountNumber | Id1 | Date1      | Amount1 | Username1 | VoucherType1 | Id2 | Date2      | Amount2 | Username2 | VoucherType2 | Id3 | Date3      | Amount3 | Username3 | VoucherType3 |
          | 1401-03-02 | 1401-03-04 | cash receipt |cashbox-main-3 |                   | 202 | 1401-03-02 | 300.000 | EH96      | cash receipt | 201 | 1401-03-03 | 400.000 | ZM76      | cash receipt | 200 | 1401-03-04 | 500.000 | MT73      | cash receipt |
          
        Examples: Filtering based on voucher type and cashbox (payment)
          | FromDate   | ToDate     | VocherType   | cashbox       | BankAccountNumber | Id1 | Date1      | Amount1 | Username1 | VoucherType1 | Id2 | Date2      | Amount2 | Username2 | VoucherType2 | Id3 | Date3      | Amount3 | Username3 | VoucherType3 |
          | 1401-03-02 | 1401-03-04 | cash payment |cashbox-main-3 |                   | 602 | 1401-03-02 | 600.000 | EH96      | cash payment | 601 | 1401-03-03 | 200.000 | ZM76      | cash payment | 600 | 1401-03-04 | 500.000 | MT73      | cash payment |
        

      Scenario Outline: Balance report by filtering on voucher type and BankAccountNumber gets reported properly
        When 'Mina' tries to gets balance report with following info
          | FromDate   | ToDate   | VocherType   | cashbox   | BankAccountNumber   |
          | <FromDate> | <ToDate> | <VocherType> | <cashbox> | <BankAccountNumber> |
        Then she gets balance report with following info
          | Id    | Date    | Amount    | Username    | VocherType    |
          | <Id>  | <Date>  | <Amount>  | <Username>  | <VocherType>  |
          

        Examples: Filtering based on voucher type and BankAccountNumber (receipt)
          | FromDate   | ToDate     | VocherType   | cashbox       | BankAccountNumber | Id  | Date       | Amount  | Username  | VoucherType | 
          | 1401-03-02 | 1401-03-04 | bank receipt |               | 1308116125874961  | 300 | 1401-03-04 | 300.000 | MT73      | bank receipt|
          | 1401-03-02 | 1401-03-04 | bank receipt |               | 1401106125874961  | 301 | 1401-03-03 | 250.000 | ZM76      | bank receipt| 
          | 1401-03-02 | 1401-03-04 | bank receipt |               | 1308116125556661  | 302 | 1401-03-02 | 400.000 | EH96      | bank receipt| 
          
        Examples: Filtering based on voucher type and BankAccountNumber (payment)
          | FromDate   | ToDate     | VocherType   | cashbox       | BankAccountNumber | Id  | Date       | Amount  | Username  | VoucherType | 
          | 1401-03-02 | 1401-03-04 | bank payment |               | 1308116125874961  | 700 | 1401-03-04 | 300.000 | MT73      | bank payment|
          | 1401-03-02 | 1401-03-04 | bank payment |               | 1401106125874961  | 701 | 1401-03-03 | 400.000 | ZM76      | bank payment| 
          | 1401-03-02 | 1401-03-04 | bank payment |               | 1308116125556661  | 702 | 1401-03-02 | 200.000 | EH96      | bank payment| 
          
      
      Scenario Outline:  Balance report does not report properly with invalid filters
        When 'Mina' tries to gets balance report with following info
          | FromDate   | ToDate   | VocherType   | cashbox   | BankAccountNumber   |
          | <FromDate> | <ToDate> | <VocherType> | <cashbox> | <BankAccountNumber> |
       Then she gets error <message> and code <code>
           
       Examples: 
         | Message                                           |  Code          | FromDate   | ToDate   | VocherType   | cashbox      | BankAccountNumber |
         |FromDate is required                               |R-BR-8000       |            |1401-03-03|              |              |                   |
         |FromDate should be less than or equal to ToDate    |R-BR-8001       |1401-03-04  |1401-03-02|              |              |                   |
         |ToDate is required                                 |R-BR-8002       |1401-03-02  |          |              |              |                   |
         |ToDate should be greater than or equal to FromDate |R-BR-8003       |1401-03-03  |1401-03-02|              |              |                   |
         |Invalid BankAccountNumber is provided              |R-BR-8004       |1401-03-02  |1401-03-04| bank payment |              |-1308116125556661  |
         