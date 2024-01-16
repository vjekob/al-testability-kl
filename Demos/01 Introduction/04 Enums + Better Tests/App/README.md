# Demo 01: Very Tightly Coupled Code

This demo illustrates a very good state of decoupling through enums and interfaces. Also, it shows how interfaces, especially when used in conjunction with enums, can be used to test individual components in isolation.

Points to make:
1. Functional code is loosely coupled
2. Process (`PlayWithPat` codeunit) is decoupled from any actual implementation
3. Extending through new pet type requires no change in either functional or test code!
4. It is now possible to test individual implementations in isolation
5. It is possible to test the `PlayWithPet` process decoupled from any actual implementation
