# Demo 01: Very Tightly Coupled Code

This demo illustrates a very tightly coupled old-school code.

Points to make:
1. It is not very extensible
2. It is very difficult to test
3. Tests are fairly fragile due to hardcoding of output messages
4. A lot of tests are needed to properly assert that the `PlayWithPet` codeunit really works as expected
5. Tests are all copies of each other
6. A change in logic requires a change in all tests
