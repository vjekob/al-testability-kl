# Demo 1: Tightly-coupled old-school code

This is exactly the same code you have seen and improved in Exercise 1. This is our starting point.
There are a lot of problems in this code, and also in the test code. Tests expose how bad the code
really is:
* All the tests are integration tests
* They require a lot of setup
* They perform slow
* They seem to be mostly concerned with Microsoft's functionality
* Most "givens" are there to satisfy Microsoft's base app dependency
  
We will do improvements to these tests gradually, while also improving our core app.
