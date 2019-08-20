@add_to_cart
Feature: Adding item to the cart

Scenario Outline: Adding an item to the cart
# Given "<user>" with "<email>" and "<passwd>" searched for "<search_input>"
Given User seached for "<search_input>"
Given Item page was opened
When I choose all needed options
And I add the item to the cart
Then I am asked to input my credit card credentials

Examples:
# | user |  email                          | passwd      | search_input  |
# |user1 |ashley_heidenreich@kochboyle.name| nWkSuOGdeg261 | trousers    |

| search_input  |
|  trousers     |

# | jacket woman  |
