---
title: "Make a RESTFul API to upload files to S3 with Golang"
author: "SteveYi"
date: 2022-03-31T04:30:00+08:00
draft: false
description: "Anyway, I need have a API to upload files to S3 (Eg: image, iso file ...etc)"
---

I have two S3 bucket services, one is sponsored by [@Licson](https://licson.net/), another is [Backblaze B2](https://www.backblaze.com/b2/cloud-storage.html).
I usally upload my static asset file or resource file to them.

Today, I want to make a RESTFul API to upload files to S3.

Let's do it!

## Environment

Package list:

```go
github.com/aws/aws-sdk-go v1.43.28
github.com/gin-contrib/cors v1.3.1
github.com/gin-gonic/gin v1.7.7
github.com/joho/godotenv v1.4.0
```

## Write a gin router

Before start, Let me quick to introduce the gin framework.

[Gin](https://github.com/gin-gonic/gin) is a web framework for Go. It's a high performance and high quality framework for building web applications.

Since it can easily return JSON data, so we can use it to build a RESTful API.

First, use go mod init to create a module.

```shell
go mod init test-go
```

Then, let's import the gin framework and the cors middleware.

```shell
go get github.com/gin-gonic/gin
go get github.com/gin-contrib/cors
```

Create main.go and add the following code:

```go
package main

import (
	"github.com/gin-contrib/cors"
	"github.com/gin-gonic/gin"
)

func main() {
	// Create a gin router
	// gin.SetMode(gin.ReleaseMode)
	router := gin.New()
	router.Use(gin.Logger(), gin.Recovery())

	// Set CORS
	config := cors.DefaultConfig()
	config.AllowOrigins = []string{"*"}
	router.Use(cors.New(config))

	// Run
	router.Run("127.0.0.1:29750")
}
```

Great, now we have a gin router.  
You can use the following command to run the server:

```shell
# Run application
go run test-go

# Use curl to test
$ curl http://127.0.0.1:29750

# It should return the below data.
404 page not found
```

### Add API Endpoint

Once we have the router, we can add the API endpoint.

```go
func UploadFile(c *gin.Context) {
	c.JSON(200, gin.H{"message": "Pong!"})
}

func main() {
    ...
    ...
    ...
    apiv1 := router.Group("/api/v1/") // Create a group
    apiv1.POST("/upload", UploadFile) // Add the endpoint
    ...
}
```

In the above code, we create a group and add the endpoint with its function.  
We can use below command to test the endpoint:

```shell
$ curl -X POST http://127.0.0.1:29750/api/v1/upload

# It should return the below data.
{"message":"Pong!"}
```

## Design the API function

```go
// Define return result
type Result struct {
	Success   bool
	Message   string
	File_Name string
}

// Create folder as storage cache
func CreateFolder(FolderName string) bool {
	returnCheck := false
	if _, err := os.Stat(FolderName); os.IsNotExist(err) {
		err = os.Mkdir(FolderName, 0755)
		if err != nil {
			// fmt.Println(err)
			returnCheck = false
		} else {
			returnCheck = true
		}
	} else {
		returnCheck = true
	}
	return returnCheck
}

// Process file upload
func UploadFile(c *gin.Context) {
    // Pre define variables
	var r Result
	var returnCheck bool
	var returnMessage string
	returnStatusCode := 200

    // Get file information
	file, header, err := c.Request.FormFile("upload_file")
	if err != nil {
		r = Result{false, "Bad Request!", ""}
		c.JSON(400, r)
		return
	}

	filename := header.Filename

    // Check if the folder exist
	if !os.IsNotExist(err) && CreateFolder("tmp") {

        // Copy file to the folder
		out, err := os.Create("tmp/" + filename)
		if err != nil {
			returnStatusCode = 400
			returnCheck = false
			returnMessage = "Error!"
		}
		defer out.Close()

		_, err = io.Copy(out, file)
		if err != nil {
            // If error, return 400 error
			returnStatusCode = 400
			returnCheck = false
			returnMessage = "Error!"
		} else {
            // If success, return 200 success
			returnStatusCode = 201
			returnCheck = true
			returnMessage = "Success!"
		}
	} else {
        // return failed to create the folder
		returnStatusCode = 400
		returnCheck = false
		returnMessage = "Failed to create the tmp folder!"
	}
    // return JSON type
	r = Result{returnCheck, returnMessage, filename}
	c.JSON(returnStatusCode, r)
}
```

I have already published a repository on GitHub [file-upload-to-s3](https://github.com/steveyiyo/file-upload-to-s3). Feel free to check it if needed. 
