# Database Design

### 1. Users Table

|  No  |    Field    |  Type  | Min Length | Max Length | Required | Unique |    Note     |
| :--: | :---------: | :----: | :--------: | :--------: | :------: | :----: | :---------: |
|  1   | **User ID** | Number |            |            |   Yes    |  Yes   | Primary Key |
|  2   |   E-mail    |  Text  |     10     |     64     |   Yes    |  Yes   |             |
|  3   |  Full Name  |  Text  |     8      |     30     |   Yes    |        |             |
|  4   |  Password   |  Text  |     8      |     16     |   Yes    |        |             |

\**User table is for back end admin*



### 2. Category Table

|  No  |      Field      |  Type  | Min Length | Max Length | Required | Unique |    Note     |
| :--: | :-------------: | :----: | :--------: | :--------: | :------: | :----: | :---------: |
|  1   | **Category ID** | Number |            |            |   Yes    |  Yes   | Primary Key |
|  2   |  Category Name  |  Text  |     5      |     30     |   Yes    |  Yes   |             |

### 3. Book Table

|  No  |        Field         |   Type    | Min Length | Max Length | Required | Unique |             Note              |
| :--: | :------------------: | :-------: | :--------: | :--------: | :------: | :----: | :---------------------------: |
|  1   |     **Book ID**      |  Number   |            |            |   Yes    |  Yes   |          Primary Key          |
|  2   |        Title         |   Text    |     10     |    128     |   Yes    |  Yes   |                               |
|  3   |        Author        |   Text    |     3      |     64     |   Yes    |        |                               |
|  4   |     Description      |   Text    |    200     |    2000    |   Yes    |        |                               |
|  5   |         ISBN         |   Text    |     10     |     15     |   Yes    |        |                               |
|  6   |        Image         |   Image   |            |            |   Yes    |        |                               |
|  7   |        Price         |   Float   |            |            |   Yes    |        |                               |
|  8   |     Publish Date     |   Date    |            |            |   Yes    |        |                               |
|  9   |   Last Update Time   | Date time |            |            |   Yes    |        |                               |
|  10  | <u>*Category ID*</u> |  Number   |            |            |   Yes    |        | Foreign Key to Category table |



### 4. Customer Table

|  No  |      Field      |     Type      | Min Length | Max Length | Required | Unique | Note        |
| :--: | :-------------: | :-----------: | :--------: | :--------: | :------: | :----: | ----------- |
|  1   | **Customer ID** |    Number     |            |            |   Yes    |  Yes   | Primary key |
|  2   |     E-mail      |     Text      |     10     |     64     |   Yes    |  Yes   |             |
|  3   |   First Name    |     Text      |     2      |     30     |   Yes    |        |             |
|  4   |    Last Name    |     Text      |     1      |     30     |   Yes    |        |             |
|  5   | Address Line 1  |     Text      |     10     |     64     |   Yes    |        |             |
|  6   | Address Line 2  |     Text      |     10     |     64     |   Yes    |        |             |
|  7   |      City       |     Text      |     3      |     32     |   Yes    |        |             |
|  8   |      State      |     Text      |     3      |     32     |   Yes    |        |             |
|  9   |     Country     |     Text      |     10     |     32     |   Yes    |        |             |
|  10  |      Phone      |     Text      |     10     |     15     |   Yes    |        |             |
|  11  |     Zipcode     |     Text      |     3      |     24     |   Yes    |        |             |
|  12  |    Password     |     Text      |     8      |     16     |   Yes    |        |             |
|  13  |  Register Date  | Date and time |            |            |   Yes    |        |             |



### 5. Order Table

|  No  |        Field         |     Type      | Min Length | Max Length | Required | Unique | Note                          |
| :--: | :------------------: | :-----------: | :--------: | :--------: | :------: | :----: | ----------------------------- |
|  1   |     **Order ID**     |    Number     |            |            |   Yes    |  Yes   | Primary key                   |
|  2   | <u>*Customer ID*</u> |    Number     |     10     |     64     |   Yes    |  Yes   | Foreign Key to Customer table |
|  3   |      Order Date      | Date and Time |            |            |   Yes    |        |                               |
|  4   |      First Name      |     Text      |     1      |     32     |   Yes    |        |                               |
|  5   |      Last Name       |     Text      |     1      |     32     |   Yes    |        |                               |
|  6   |    Address Line 1    |     Text      |     10     |     64     |   Yes    |        |                               |
|  7   |    Address Line 2    |     Text      |     0      |     64     |    No    |        |                               |
|  8   |    Recipient City    |     Text      |     3      |     32     |   Yes    |        |                               |
|  9   |   Recipient State    |     Text      |     3      |     32     |   Yes    |        |                               |
|  10  |  Recipient Country   |     Text      |     3      |     15     |   Yes    |        |                               |
|  11  |   Recipient Phone    |     Text      |     10     |     15     |   Yes    |        |                               |
|  12  |       Zipcode        |     Text      |     5      |     15     |   Yes    |        |                               |
|  13  |    Payment Method    |     Text      |            |            |   Yes    |        |                               |
|  14  |        Total         |     Float     |     0      |            |   Yes    |        |                               |
|  15  |     Shipping Fee     |     Float     |     0      |            |   Yes    |        |                               |
|  16  |         Tax          |     Float     |     0      |            |   Yes    |        |                               |
|  17  |       Subtotal       |     Float     |     0      |            |   Yes    |        |                               |
|  18  |        Status        |    varchar    |            |            |          |        |                               |



### 6. Order Detail Table

| No   | Field             | Type   | Min Length | Max Length | Required | Unique | Note                            |
| ---- | ----------------- | ------ | ---------- | ---------- | -------- | ------ | ------------------------------- |
| 1    | <u>*Order ID*</u> | Number |            |            |          |        | Foreign Key to Book Order Table |
| 2    | <u>*Book ID*</u>  | Number |            |            |          |        | Foreign key to Book Table       |
| 3    | Quantity          | Number |            |            | Yes      |        |                                 |
| 4    | Subtotal          | Float  |            |            | Yes      |        |                                 |



### 7. Review Table

| No   | Field                | Type      | Min Length | Max Length | Required | Unique | Note                          |
| ---- | -------------------- | --------- | ---------- | ---------- | -------- | ------ | ----------------------------- |
| 1    | **Review ID**        | Number    |            |            | Yes      | Yes    | Primary Key                   |
| 2    | *<u>Book ID</u>*     | Number    |            |            |          |        | Foreign Key to Book Table     |
| 3    | *<u>Customer ID</u>* | Number    |            |            |          |        | Foreign key to Customer Table |
| 4    | Rating               | Number    |            |            |          |        |                               |
| 5    | Headline             | Text      | 20         | 128        | Yes      |        |                               |
| 6    | Comment              | Text      | 100        | 500        | Yes      |        |                               |
| 7    | Review Time          | Date time |            |            |          |        |                               |