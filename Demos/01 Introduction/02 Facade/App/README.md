# Demo 01: Very Tightly Coupled Code

This demo illustrates a less tightly-coupled code through codeunit facades.

Points to make:
1. Code is less tightly coupled and is more extensible
2. But, some mapping between facade ID and logical ID is still needed
3. Worst of all, there is no compile-time contract validation; any codeunit can be invoked
