Feature: Validate the Scenario outline.
  Background:
    * url baseUrl


Scenario Outline: Create new user
Given path '/public/v2/users'
And request {"name": '#(name)',"gender": '#(gender)',"status": '#(status)',"email":'#(email)'}
And header Authorization = 'Bearer ' + tokenId
When method post
Then status <status1>
  Examples:
  |name|gender|status|email|status1|
  |Manoj|male |active|as11@gmail.com|201|
  |Manoj2|Female |inactive|as111@gmail.com|201|


