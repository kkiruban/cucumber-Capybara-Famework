Feature: General
  In order to create test data for different entities
  As a tester
  I should validate the functionalities as per test caseNumber of New Cases

  Background:
    Given I should navigate to "Home" tab in saleforce application  

  @US-004271 @US-004334 @Admin_Generals
  Scenario: US-004271 US-004334 Added Currencies & Rates
    And I navigate to manager currency page
    When I click on Manage Currencies button
    Then I should see following currency code in Manage currency page:
      | Currency | CurrencyRate |
      | AUD      | 0.696450     |
      | CAD      | 0.773990     |
      | CHF      | 1.022910     |
      | CNY      | 0.149270     |
      | DKK      | 0.149940     |
      | EUR      | 1.137650     |
      | GBP      | 1.328020     |
      | HKD      | 0.129160     |
      | IDR      | 0.000070     |
      | INR      | 0.014510     |
      | KRW      | 0.000892     |
      | MYR      | 0.245940     |
      | NOK      | 0.122030     |
      | NZD      | 0.626300     |
      | PHP      | 0.021330     |
      | PLN      | 0.252420     |
      | RUB      | 0.014780     |
      | SEK      | 0.118910     |
      | SGD      | 0.738550     |
      | TWD      | 0.031640     |
      | USD      | 1.000000     |
      | ZAR      | 0.072320     |

  @US-004335 @Admin_Generals
  Scenario: US-004335 Added Currencies & Rates
    And I navigate to All users page layout
    Then I should see following users as per config guide:
      | Users                         |
      | ehansen@servicesource.com     |
      | rvillasenor@servicesource.com |
      | lbrasel@servicesource.com     |
      | pscheck@servicesource.com     |
      | acooke@servicesource.com      |
      | jaranas@servicesource.com     |
      | ronareyes@servicesource.com   |
      | tbruback@servicesource.com    |
      | jaoneill@servicesource.com    |
      | gnetzer@servicesource.com     |
      | mleon@servicesource.com       |
      | jprudence@servicesource.com   |
      | tlow@servicsource.com         |
      | mabdulmanak@servicesource.com |
      | dperson@servicesource.com     |
      | tigaz@servicesource.com       |