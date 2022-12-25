#### Evaluating the Adherence to OOP Design Principles in a Hangman Project

I write the following for the purpose of gaining a greater understanding of object-oriented design. Numbered below are the main principles of OOP design, along with my (and ChatGPT's) interpretations of how my code adheres or does not adhere to each.

1. Abstraction

  'Abstraction' means representing essential details while hiding non-essential details. Essential details are abstracted away, and non-essential or sensitive details are hidden. Essential details can be represented by classes, properties, or interfaces. An interface can be defined as a set of one or more methods and/or properties; for example, the built-in `Enumerable` module is an interface since it defines a set a methods and properties.
  
  The `play_game` method of the `Game` class is an interface for playing Hangman. None of the other methods or attributes are used by the player aside from being indirectly executed through the `play_game` method. So, the `play_game` interface has been successfully separated from the implementation details (the other methods and properties), thereby allowing the `Game` class to adhere to the abstraction principle. This is further reinforced by the fact that I have set all the other methods to private (as a result of writing this readme!), not out of strict necessity but because my understanding is that it's good practice.

  The `Dictionary` class follows the abstraction principle because its code has been placed exclusively inside that class, and the invocations of its two public methods are all the rest of the program has access to. In this way, the `Dictionary` class adheres to the abstraction principle.

  By separating the code for saving and loading games into the `GamePersistence` module, I abstracted away the implementation details of saving and loading games. Therefore,`GamePersistence` helps the code adhere to the abstraction principle.

2. Encapsulation


3. Single Responsibility Principle


4. Inheritance


5. Polymorphism
