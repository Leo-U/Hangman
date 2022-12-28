####Determining the Adherence to OOP Design Principles in a Hangman Project

I am writing this to gain a foundational understanding of object-oriented design. Below are the main principles of OOP design, along with my understanding of what the principles actually are, as well as my interpretations of how my code adheres or does not adhere to each principle.

#####Abstraction

'Abstraction' refers to representing essential details while hiding non-essential details. Essential details are abstracted away, and non-essential or sensitive details are hidden. Essential details can be represented by classes, properties, or interfaces. In computing, an interface is a boundary across which information can be exchanged between two parts of a machine (hardware or software) or between a human and the machine. In OOP, 'interface' can be defined as a set of one or more methods in a class that allow a user or code outside the program to interact with the class. By only using that interface to interact with the class, and by setting all other methods and data in the class to `private`, abstraction is achieved.

The `play_game` method of the `Game` class is an interface for playing Hangman. None of the other methods or attributes are directly used by the player or by code outside the class. Therefore, the `play_game` interface has been successfully separated from the implementation details (the other methods and properties) in the Game class, allowing adherence to the abstraction principle. This is further reinforced by the fact that all other methods are set to private (as a result of writing this readme!).

The `Dictionary` class does not follow the abstraction principle because all of its methods are public and used outside the class.

By separating the code for saving and loading games into the `GamePersistence` module, I abstracted away the implementation details of saving and loading games. Therefore, `GamePersistence` helps the code adhere to the abstraction principle.

#####Encapsulation

'Encapsulation' refers to bundling methods and data into a single unit. That unit can be a class, a structure, or an interface. Encapsulation can be achieved through

The `Game` class is one such unit. Its methods and instance variables are bundled and confined to its interior.

The `Dictionary` class is partially encapsulated in the sense that dictionary-related methods and data are defined inside the class, but is not encapsulated in the sense that all its methods are public.

The `GamePersistence` module is encapsulated in the sense that its methods are private and can only be accessed by the `Game` class that `include`s it.

My code wraps a bunch of methods with `private`. Making use of `private` in this way is considered an encapsulation method, even though it also helps achieve abstraction. The reason for this is, to the best of my understanding, that encapsulation is a technique used to achieve abstraction. That is, abstraction is a design goal, and encapsulation is one way to accomplish it. If I'm not mistaken, the use of abstraction also helps enable encapsulation.

#####Single Responsibility Principle

The single responsibility principle states that every class, module, or function/method in a program should only be doing one thing.

I attempted to follow the single responsibility principle by making the methods in the `Game` class perform one task each, and by separating the save/load game functionality, the dictionary functionality, and the gameplay functionality into different classes/modules. One could argue that it would be a good idea to also separate the display functionality into a separate class, but that has not been done.

#####Inheritance

Inheritance is the process by which qualities are passed down - in the context of OOP, inheritance means that one class can be set up so that it also has access to data that is in another class. This is similar to how a class can include a module, but that is not considered inheritance. Inheritance is useful because it allows for code reuse and modularization.

I have not used inheritance in this project.

#####Polymorphism

'Polymorphism' refers to the ability of different objects to respond to the same message in different ways. This is achieved through inheritance and method overriding.

I have not used polymorphism in this project.