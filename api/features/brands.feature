Feature:
  In order to prove the api for brands is correct functioning

  Scenario Outline: I can get all brands from the api
    When I add "Content-Type" header equal to "application/<content-type-prefix>"
    And I add "Accept" header equal to "application/<content-type-prefix>"
    And I send a "GET" request to "/api/brands"
    Then the response status code should be 200
    And the header "Content-Type" should contain "application/<content-type-prefix>"

    Examples:
      | content-type-prefix   |
      | json                  |
      | hal+json              |
      | ld+json               |
      | vnd.api+json          |
      | xml                   |

  Scenario Outline: I can get a specific brand from the api
    When I add "Content-Type" header equal to "application/<content-type-prefix>"
    And I add "Accept" header equal to "application/<content-type-prefix>"
    And I send a "GET" request to "/api/brands/<id>"
    Then the response status code should be 200
    And the header "Content-Type" should contain "application/<content-type-prefix>"

    Examples:
      | content-type-prefix   | id  |
      | json                  | 1   |
      | hal+json              | 1   |
      | ld+json               | 1   |
      | vnd.api+json          | 1   |
      | xml                   | 1   |

