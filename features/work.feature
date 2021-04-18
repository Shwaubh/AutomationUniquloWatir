Feature: Testing the Optus Website
  The website should work fine

  @scenarioApplyFilter
  Scenario: Launch latest phones section and apply filter to retrieve phones
    Given We are able to launch Optus Website
    And We are able to open Shop section from menu
    And We are able to launch latest Phones section in Mobile
    When We Apply filter on Brand as "Samsung"
    And We Apply filter on Internal Memory as "64GB - 128GB"
    And We Apply filter on Network Speed as "5G"
    And We Apply filter on sort as "Price Lowest to Highest"
    Then We are able to retrieve at least 3 phones

  @scenarioDataSim
  Scenario: Add Data Sim only plan in Shopping Cart and checkout till Order Summary page
    Given We are able to launch Optus Website
    And We are able to open Shop section from menu
    And We are able to launch Data SIMs section in Home Internet & nbn
    When We choose a plan "Small Data SIM Plan"
    And We proceed to cart
    And We do checkout
    And We fill our personal details <email> <phoneNum>
    And We fill the Shipment delivery address
    Then We verify the items in order summary page as same as selected
    Examples:
      | email | phoneNum |
      |    invalid88@yopmail.com |   0452525221  |

  @scenarioTablet
  Scenario: Add Tablet Device with plan in shopping cart and checkout till order summary page
    Given We are able to launch Optus Website
    And We are able to open Shop section from menu
    And We are able to launch iPads & Tablets in Mobile
    When We choose a Tablet "iPad Air (4th gen)"
    When We Select a plan "Small Data SIM Plan"
    And We proceed to cart
    And We do checkout
    And We fill our personal details <email> <phoneNum>
    And We fill the Shipment delivery address
    Then We verify the items in order summary page as same as selected
    Examples:
      | email | phoneNum |
      |    invalid89@yopmail.com |   0452525221  |

  @scenarioMobile
  Scenario: Add Mobile Device with plan and one addons & accessories in shopping cart and checkout till order summary page
    Given We are able to launch Optus Website
    And We are able to open Shop section from menu
    And We are able to launch latest Phones section in Mobile
    When We choose a Mobile "Galaxy S21 Ultra 5G"
    When We Select a plan "Medium Optus Choice Plan"
    And We add an Add-On "Optus Sport" and proceed to cart
    And We do checkout
    And We fill our personal details <email> <phoneNum>
    And We choose a MSN Number
    And We fill the Shipment delivery address
    Then We verify the items in order summary page as same as selected
    Examples:
      | email | phoneNum |
      |    invalid90@yopmail.com |   0452525221  |
