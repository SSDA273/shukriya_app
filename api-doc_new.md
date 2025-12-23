

## **API Request/Response Documentation**



### **1. Customer Profile API**
**Endpoint:** `GET /customer/profile`
**URL:** `http://demo.ctrmv.com:3000/api-customer/customer/profile`

**Request:**
```http
GET /customer/profile HTTP/1.1
Host: demo.ctrmv.com:3000
Authorization: Bearer {token}
Content-Type: application/json
```
**Request Body:** `null` (GET request)

**Expected Response:**
```json
{
  "statusCode": 200,
  "message": "Success",
  "result": {
    "id": "customer_id",
    "username": "customer_username",
    "firstName": "John",
    "lastName": "Doe", 
    "mobileNumber": "+971501234567",
    "email": "john.doe@example.com",
    "emirate": "Dubai",
    "profileImage": "https://example.com/profile.jpg"
  }
}
```

### **2. Account Details API**
**Endpoint:** `POST /accounts/details/customer-id`
**URL:** `http://demo.ctrmv.com:3000/api-customer/accounts/details/customer-id`

**Request:**
```http
POST /accounts/details/customer-id HTTP/1.1
Host: demo.ctrmv.com:3000
Authorization: Bearer {token}
Content-Type: application/json

{
  "entity_id": "61e3badbdf3ceff3769ebf97",
  "entity_key": "ENT-5678901234567890", 
  "customer_id": "693fd0850fd6c28d9d9266a8"
}
```

**Expected Response:**
```json
{
  "statusCode": 200,
  "message": "Success",
  "result": {
    "accountNumber": "1234567890",
    "balance": 1500.50,
    "currency": "AED",
    "accountType": "CURRENT"
  }
}
```

### **3. Currency List API**
**Endpoint:** `GET /app-settings/currency-list`
**URL:** `http://demo.ctrmv.com:3000/api-customer/app-settings/currency-list`

**Request:**
```http
GET /app-settings/currency-list HTTP/1.1
Host: demo.ctrmv.com:3000
Authorization: Bearer {token}
Content-Type: application/json
```
**Request Body:** `null` (GET request)

**Expected Response:**
```json
{
  "statusCode": 200,
  "message": "Success",
  "result": [
    {
      "code": "AED",
      "name": "UAE Dirham",
      "symbol": "د.إ"
    },
    {
      "code": "INR", 
      "name": "Indian Rupee",
      "symbol": "₹"
    }
  ]
}
```

### **4. Beneficiary List API**
**Endpoint:** `GET /beneficiaries`
**URL:** `http://demo.ctrmv.com:3000/api-customer/beneficiaries`

**Request:**
```http
GET /beneficiaries HTTP/1.1
Host: demo.ctrmv.com:3000
Authorization: Bearer {token}
Content-Type: application/json
```
**Request Body:** `null` (GET request)

**Expected Response:**
```json
{
  "statusCode": 200,
  "message": "Success", 
  "result": [
    {
      "id": "beneficiary_id_1",
      "beneficiaryName": "Jane Smith",
      "beneficiaryNickName": "Jane",
      "beneficiaryAccount": "9876543210",
      "accountBankName": "ABC Bank",
      "logo": "https://example.com/bank-logo.jpg"
    }
  ]
}
```

### **5. Entity Info API**
**Endpoint:** `POST /customer/entity_info`
**URL:** `http://demo.ctrmv.com:3000/api-customer/customer/entity_info`

**Request:**
```http
POST /customer/entity_info HTTP/1.1
Host: demo.ctrmv.com:3000
Authorization: Bearer {token}
Content-Type: application/json

{
  "entity_id": "entity_id_value",
  "entity_key": "entity_key_value"
}
```

**Expected Response:**
```json
{
  "statusCode": 200,
  "message": "Success",
  "result": {
    "entityId": "entity_id_value",
    "entityName": "Company Name",
    "entityKey": "entity_key_value",
    "settings": {}
  }
}
```

### **6. Exchange House List API**
**Endpoint:** `POST /exchange-houses`
**URL:** `http://demo.ctrmv.com:3000/api-customer/customer/exchange-houses`

**Request:**
```http
POST /exchange-houses HTTP/1.1
Host: demo.ctrmv.com:3000
Authorization: Bearer {token}
Content-Type: application/json

{
  "entity_id": "61e3badbdf3ceff3769ebf97",
  "from_currency": "AED",
  "to_currency": "INR",
  "to_country": "IN",
  "modeOfTransfer": "BANK"
}
```

**Expected Response:**
```json
{
  "statusCode": 200,
  "message": "Success",
  "result": [
    {
      "id": "exchange_house_id",
      "name": "Exchange House Name",
      "logo": "https://example.com/logo.jpg",
      "serviceId": "service_id",
      "fee": {
        "id": "fee_id",
        "fxRate": 22.50
      }
    }
  ]
}
```

### **7. Billers List API**
**Endpoint:** `GET /billers/customer-id`
**URL:** `http://demo.ctrmv.com:3000/api-customer/billers/customer-id`

**Request:**
```http
GET /billers/customer-id HTTP/1.1
Host: demo.ctrmv.com:3000
Authorization: Bearer {token}
Content-Type: application/json
```

**Expected Response:**
```json
{
  "statusCode": 200,
  "message": "Success",
  "result": [
    {
      "serviceID": "service_id",
      "billerName": "Electricity Company",
      "logo": "https://example.com/biller-logo.jpg"
    }
  ]
}
```

### **8. Bill List API**
**Endpoint:** `GET /customer/bill-categories?isInternational=false&entity_id=61e3badbdf3ceff3769ebf97`
**URL:** `http://demo.ctrmv.com:3000/api-customer/customer/bill-categories?isInternational=false&entity_id=61e3badbdf3ceff3769ebf97`

**Request:**
```http
GET /customer/bill-categories?isInternational=false&entity_id=61e3badbdf3ceff3769ebf97 HTTP/1.1
Host: demo.ctrmv.com:3000
Authorization: Bearer {token}
Content-Type: application/json
```

**Expected Response:**
```json
{
  "statusCode": 200,
  "message": "Success",
  "result": [
    {
      "categoryId": "category_id",
      "categoryName": "Utilities",
      "icon": "https://example.com/category-icon.jpg"
    }
  ]
}
```

### **9. Popular Bills API**
**Endpoint:** `POST /customer/popular-billers`
**URL:** `http://demo.ctrmv.com:3000/api-customer/customer/popular-billers`

**Request:**
```http
POST /customer/popular-billers HTTP/1.1
Host: demo.ctrmv.com:3000
Authorization: Bearer {token}
Content-Type: application/json

{
  "entity_id": "entity_id_value",
  "entity_key": "entity_key_value"
}
```

**Expected Response:**
```json
{
  "statusCode": 200,
  "message": "Success",
  "result": [
    {
      "billerId": "biller_id",
      "billerName": "Popular Biller Name",
      "logo": "https://example.com/popular-biller-logo.jpg"
    }
  ]
}
```

