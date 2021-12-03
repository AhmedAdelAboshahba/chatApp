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

## Get Application

### Request

```
GET /api/v1/applications/:application_token HTTP/1.1
Host: localhost:3000

```

### Response
```
{
    "token": "KbX11c8eZqBaWF896sBbNYD5",
    "name": "firstApp",
    "chats_count": 0
}
```




## Create chat
```
POST /api/v1/applications/:application_token/chats HTTP/1.1
Host: localhost:3000

```
### Response 
```
{
    "chat": {
        "number": 1,
        "messages_count": 0
    }
}
```

## List all chats
```
GET /api/v1/applications/:application_token/chats HTTP/1.1
Host: localhost:3000

{
    "page": 1,
    "per_page": 2
}
```
### Response
```
{
    "chats": [
        {
            "number": 1,
            "messages_count": 1
        },
        {
            "number": 2,
            "messages_count": 1,
        }
    ],
    "count": 3,
    "per_page": 2,
    "page": 1
}
```
## Get chat

```
GET /api/v1/applications/:application_token/chats/:chat_number HTTP/1.1
Host: localhost:3000
```
### Response 
```
[
    {
        "number": 1,
        "messages_count": 1
    }
]
```
  
## Create message

```
POST /api/v1/applications/:application_token/chats/:chat_number/messages/ HTTP/1.1
Host: localhost:3000

{
    "message":  {
        "content": "Hello"
    }
}
```
### Response
```
{
    "message": {
        "content": "Hello",
        "number": 1
    }
}
```

## List all messages
```
GET /api/v1/applications/:application_token/chats/:chat_number/messages HTTP/1.1
Host: localhost:3000

{
    "page": 1,
    "per_page": 2
}
```
### Response
```
{
    "messages": [
        {
            "content": "Hello",
            "number": 1
        },
        {
            "description": "Hi",
            "number": 2
        }
    ],
    "count": 4,
    "per_page": 2,
    "page": 1
}
```
## Get message

```
GET /api/v1/applications/:application_token/chats/:chat_number/messages/:message_number HTTP/1.1
Host: localhost:3000
```
### Response 
```
{
    "content": "Hello",
    "seq_num": 1
}
```
## Search for a message

```
GET /api/v1/applications/:application_token/chats/:chat_number/messages/search HTTP/1.1
Host: localhost:3000

{
    "query": "Hello"
}
```
### Response
```
{
    "messages": [
        {
            "_index": "messages",
            "_type": "message",
            "_score": 2.540445,
            "_source": {
                "content": "Hello world",
                "number": 1,
                "created_at": "2021-12-03T15:27:32.000Z",
                "updated_at": "2021-12-03T15:27:32.000Z"
            }
        }
    ]
}
```

