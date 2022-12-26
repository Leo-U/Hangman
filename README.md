#### Evaluating the Adherence to OOP Design Principles in a Hangman Project

I write the following for the purpose of gaining a greater understanding of object-oriented design. Presented below are the main principles of OOP design, along with my interpretations of what the principles actually are, as well as my interpretations of how my code adheres or does not adhere to each principle.

##### Abstraction

'Abstraction' means representing essential details while hiding non-essential details. Essential details are abstracted away, and non-essential or sensitive details are hidden. Essential details can be represented by classes, properties, or interfaces. An interface can be defined as a set of one or more methods and/or properties; for example, the built-in `Enumerable` module is an interface since it defines a set of methods and properties.

The `play_game` method of the `Game` class is an interface for playing Hangman. None of the other methods or attributes are directly used by the player. So, the `play_game` interface has been successfully separated from the implementation details (the other methods and properties), thereby allowing the `Game` class to adhere to the abstraction principle. This is further reinforced by the fact that I have set all the other methods to private (as a result of writing this readme!), not out of strict necessity but because my understanding is that it's good practice.

The `Dictionary` class follows the abstraction principle because its code (implementation details) has been placed exclusively inside that class, and because the rest of the program only has access to its two public methods. In this way, the `Dictionary` class adheres to the abstraction principle.

By separating the code for saving and loading games into the `GamePersistence` module, I abstracted away the implementation details of saving and loading games. Therefore,`GamePersistence` helps the code adhere to the abstraction principle.

##### Encapsulation

'Encapsulation' means bundling methods and data into a single unit. That unit can be a class, a structure, or an interface. A goal of abstraction is to hide data from the outside world, and encapsulation can achieve that goal.

The `Game` class is one such unit. Its methods and and instance variables are bundled and confined to its interior.

My code wraps a bunch of methods with `private`; making use of `private` in this way is considered an encapsulation method even though doing so additionally helps achieve abstraction. The reason for this is, to the best of my understanding, that *encapsulation is a technique that is used to achieve abstraction*.


##### Single Responsibility Principle


##### Inheritance


##### Polymorphism
