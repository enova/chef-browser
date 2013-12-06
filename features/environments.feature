Feature: Browse environments

Background:
  Given a Chef server populated with following data:
    """json
      {
        "environments": {
          "_default": {
            "chef_type": "environment",
            "name": "_default",
            "default_attributes": {
              "First": "A",
              "Second": "B"
            }
          },
          "some-environment": {
            "chef_type": "environment",
            "name": "some-environment",
            "default_attributes": {
              "third" : "c", 
              "fourth": "d"
            },
            "override_attributes": {
              "fifth": "e",
              "sixth": "f"
            },
            "cookbook_versions": {
              "cookbook1": "version1",
              "cookbook2": "version2"
            }
          }
        }
      }
    """

Scenario: List of environments
  When I visit "/environments"
  Then I can see "some-environment"
  And I can see "_default"

Scenario: Selecting environments
  When I visit "/environments"
  And I click on "_default"
  Then I am at "/environment/_default"
