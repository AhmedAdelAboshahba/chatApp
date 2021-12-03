# README

# ChatSystem
A chat system which create messages related to certain chats and applications .

## Technologies
* **MySQL**: For database
* **Ruby on rails**: Backend framework
## Installation
run ` docker-compose up `

# API's

## List Applications

### Request

```
GET /api/v1/applications/ HTTP/1.1
Host: localhost:3000

{
    "page": 1,
    "per_page": 2
}
```


### Response

```
{
    "applications": [
        {
            "token": "KbX11c8eZqBaWF896sBbNYD5",
            "name": "firstApp",
            "chats_count": 2
        },
        {
            "token": "HyX11c8eZaaaWF896sBbNYD5",
            "name": "secondApp",
            "chats_count": 3
        }
    ],
    "number_of_pages": 3,
    "per_page": 2,
    "page": 1
}
```

## Create a new Application

### Request

```
POST /api/v1/applications HTTP/1.1
Host: localhost:3000

{
    "application": {
        "name": "firstApp"
    }
}
```

### Response
```
{
    "token": "KbX11c8eZqBaWF896sBbNYD5",
    "name": "firstApp",
    "chats_count": 0
}
```

