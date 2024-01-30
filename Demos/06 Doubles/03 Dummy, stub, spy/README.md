# Demo 3: Dummy, stub, spy

Here you can see how you can use different types of doubles to test your decoupled code.

## Dummy

You use it when you don't care about a particular dependency in a process that involves it.
For example, test named `ConvertCurrency_NoPermission` only cares that when there is an
error, there must be no log entry. In that particular test we don't care at all about the
conversion, but the process requires a converter. We can use a dummy converter for that.

## Stub

You use it when you want to control the flow. We have two stubs for permission checker: one
that always returns `true` and another that always returns `false`. By using them as needed
in your tests, you can provide different answers to the question "is there permission to
convert these currencies" and thus control which path of code you test.

## Spy

You use it when you want to know if or how a component was used. In our cae, we use spy logger
to make sure that the loger was called when conversion succeeded, and that the right parameter
values were sent.
