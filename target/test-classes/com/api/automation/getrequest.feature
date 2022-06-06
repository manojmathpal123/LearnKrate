Feature: GET api Feature

  @Regression
  Scenario: get user details
    Given url baseUrl+'/public/v2/users'
    And path '2924'
    When method get
    Then status 200

    * print response
    * match response ==
    """
  {
    "id": 13,
    "name": "Satyen Namboothiri",
    "email": "namboothiri_satyen@cruickshank.org",
    "gender": "female",
    "status": "inactive"
}
    """





    * def jsonresponse = response
    * print jsonresponse

    * def count = jsonresponse.length
    * print count

    And match response contains deep {"name" : "Satyen Namboothiri"}

    * def actname = jsonresponse.name
    * print actname
    * match  actname == 'Satyen Namboothiri'
    * def actemail = jsonresponse.email
    * print actemail
    * match  actemail == 'namboothiri_satyen@cruickshank.org'

@Smoke
Scenario: get user details user not found
    Given url baseUrl+'/public/v2/users'
    And path '1'
    When method get
    Then status 404

    Scenario: Read jsond ata
      * def Jsondata  =
      """
      [
      {
      "name" : "manoj",
      "email" : "manoj@gmail.com",
      "age" : "25"

      },
      {
      "name" : "rahul",
      "email" : "rahul@gmail.com",
      "age" : "26"

      }

      ]
      """

      * print Jsondata
      * print Jsondata[0].name
      * print Jsondata[1].name +" " +  Jsondata[1].email +" "+ Jsondata[1].age


@Smoke
Scenario: Get request with query parameter
  * def query = {status:'active',gender:'male'}
  Given url baseUrl+'/public/v2/users'
  And params query
  When method get
  Then status 200
  * print response
  * def rescount = response
  * def count1 = rescount.length
  * print count1
  * match count1 == 20
  @Regression
  Scenario: Validate the authetication token
    * print tokenId
    Given header Authorization = 'Bearer '+ tokenId
    Given url baseUrl+'//public/v2/users'
    When method get
    Then status 200