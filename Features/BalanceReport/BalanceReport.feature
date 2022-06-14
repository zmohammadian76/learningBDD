Feature: Getting balance Report of vouchers
    In order to manage Company's financial account 
    As a financial manager 
    I want to get Balance Report from vouchers


Background: 
    Given 'Mina' is system administrator and has logged in
    And there is a party with following info
        |Id   |Username       |Firstname     |Lastname    |PhoneNo        |Address|
        |1    |MT73           |MOhammadReza  |Taghipour   |09911233223    |1st street, Tehran, Iran|
    And there is a cashbox with following info
        |Id     |Title              |Status|  
        |100    |cashbox-main-3     |active|            
    And there are cash receipts vocher with following info
        |Id    |Username    |Date          |Subject      |Amount      |Cashbox     |
        |200   |MT73        |1401-03-04    |sales goods  |500.000     |cashbox-main-3|
        |201   |ZM76        |1401-03-03    |sales goods  |400.000     |cashbox-main-3|
        |202   |EH96        |1401-03-02    |sales goods  |300.000     |cashbox-main-3|
    And there are cash peyments voucher with following info
        |Id    |Username    |Date          |Subject          |Amount      |Cashbox       |
        |600   |MT73        |1401-03-04    |return of goods  |500.000     |cashbox-main-3|
        |601   |ZM76        |1401-03-03    |return of goods  |200.000     |cashbox-main-2|
        |602   |EH96        |1401-03-02    |return of goods  |600.000     |cashbox-main-1|  
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
    
Scenario Outline:Balance Report gets reported properly
    When 'Mina' tries to gets all documents with following info
        |FromDate       |ToDate        |VocherType      |cashbox     |BankAccountNumber   | 
        |<FromDate>     |<ToDate>      |<VocherType>    |<cashbox>   |<BankAccountNumber> |
    Then she gets balance report with with following info
        |Id       |Date       |Amount      |Username      |VocherType   |
        |<Id1>    |<Date1>    |<Amount1>   |<Username1>   |<VocherType1> |
        |<Id2>    |<Date2>    |<Amount2>   |<Username2>   |<VocherType2> |
        |<Id3>    |<Date3>    |<Amount3>   |<Username3>   |<VocherType3> |


Examples:
|FromDate    |ToDate      |VocherType   | cashbox   | BankAccountNumber |   Id1  |   Date1    |   Amount1  |   Username1    |   VoucherType1     |  Id2  |   Date2    |   Amount2  |   Username2    |   VoucherType2     |  Id3  |   Date3    |   Amount3  |   Username3   |   VoucherType3    | Id4  |   Date4    |   Amount4  |   Username4   |   VoucherType4     | 
|1401-03-01  |1401-03-01  |             |           |                   |        |            |            |                |                    |       |            |            |                |                    |       |            |            |               |                   |      |            |            |               |                    |                       
|1401-03-02  |1401-03-02  |             |           |                   |   202  |1401-03-02  |200.000     |     EH96       |bank receipt vocher |602    |1401-03-02  | 600.000    | EH96           |cash payment vocher |702    |1401-03-02  |200.000     | EH96          |bank payment vocher| 302  |1401-03-02  |400.000     | EH96          |bank receipt vocher |              
|1401-03-03  |1401-03-03  |             |           |                   |   201  |1401-03-03  |400.000     |     ZM76       |bank receipt vocher |601    |1401-03-03  | 200.000    | ZM76           |cash payment vocher |701    |1401-03-03  |400.000     | ZM76          |bank payment vocher| 301  |1401-03-03  |250.000     | ZM76          |bank receipt vocher |      
|1401-03-04  |1401-03-04  |             |           |                   |   200  |1401-03-04  |500.000     |     MT73       |bank receipt vocher |600    |1401-03-04  | 500.000    | MT73           |cash payment vocher |700    |1401-03-04  |300.000     | MT73          |bank payment vocher| 300  |1401-03-04  |300.000     | MT73          |bank receipt vocher |      
|1401-03-05  |1401-03-05  |             |           |                   |        |            |            |                |                    |       |            |            |                |                    |       |            |            |               |                   |      |            |            |               |                    |