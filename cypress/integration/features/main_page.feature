Feature: this is poc test scenario for central tech

  @english
  Scenario: TC_MAINPAGE_001 - TC_MAINPAGE_012 - verify in each categories menu should appear url as expectation
    When I click at 'Categories'
    Then Expect displayed the categories should be correctly
      | categories             | result                  |
      | Office Supplies        | office-supplies         |
      | Electronics & IT       | electronics-it          |
      | Cleaning               | cleaning                |
      | Furniture              | furniture               |
      | Food Service           | food-service            |
      | Healthcare             | medical-healthcare      |
      | Industrial             | industrial              |
      | Tools                  | tools                   |
      | Smart Lifestyle        | smart-lifestyle         |
      | Printing & Gifts       | printing-gifts          |
      | Software & Services    | software-services       |
      | School & Entertainment | education-entertainment |

  @english
  Scenario: TC_MAINPAGE_013 - verify image file should be credit term policy
    When I click at 'Credit Terms 30 Days'
    Then expect image file shoule be 'https://aumento.officemate.co.th/media/wysiwyg/LD_Credit-Term_01.jpg?imwidth=1920'

  @english
  Scenario: TC_MAINPAGE_014 - verify the search result is displayed relate the keyword
    When I type 'fish' at the 'SearchBar' field
    And I click search button
    Then search result 'fish' displayed in 'english'
    And expect search result location 'pnl-productGrid' should be 'fish'

  @english
  Scenario: TC_MAINPAGE_015 - expect search not exist data test
    When I type 'kiminoto' at the 'SearchBar' field
    And I click search button
    Then search result 'kiminoto' displayed in 'english'
    And expect search result location 'pnl-listPageNotFound' should be 'ขออภัย! ไม่พบสินค้าที่ตรงกับ "kiminoto"'

  @thai
  Scenario: TC_MAINPAGE_016 - verify image file should be credit term policy
    When I click at 'เครดิตเทอม 30 วัน'
    Then expect image file shoule be 'https://aumento.officemate.co.th/media/wysiwyg/LD_Credit-Term_01.jpg?imwidth=1920'

  @thai
  Scenario Outline: TC_MAINPAGE_017 - TC_MAINPAGE_021 - verify search '<data>' is displayed relate the keyword
    When I type '<data>' at the 'SearchBar' field
    And I click search button
    Then search result '<data>' displayed in 'thai'
    And expect search result location 'pnl-productGrid' should be '<data>'
    Examples:
      | data      |
      | แฟ้ม       |
      | หนังสือ     |
      | ลูกบอล     |
      | กอล์ฟ      |
      | สว่าน      |

  @thai
  Scenario: TC_MAINPAGE_022 - expect search not exist data test
    When I type 'kiminoto' at the 'SearchBar' field
    And I click search button
    Then search result 'kiminoto' displayed in 'thai'
    And expect search result location 'pnl-listPageNotFound' should be 'ขออภัย! ไม่พบสินค้าที่ตรงกับ "kiminoto"'

