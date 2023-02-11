### OOP Design Principles in Hangman

I am writing this to gain a foundational understanding of object-oriented design. Below are the main principles of OOP design, along with my understanding of what the principles actually are, as well as my interpretations of how my code adheres or does not adhere to each principle.

#### Abstraction

'Abstraction' refers to representing essential details while hiding non-essential details. Essential details are abstracted away, and non-essential or sensitive details are hidden. Essential details can be in classes, properties, or interfaces. In computing, an interface is a boundary across which information can be exchanged between two parts of a machine (hardware or software) or between a human and the machine. In OOP, 'interface' can be defined as a set of one or more methods in a class that allow a user or code outside the program to interact with the class. By only using that interface to interact with the class, and by setting all other methods and data in the class to `private`, abstraction is achieved.

The `play_game` method of the `Game` class is an interface for playing Hangman. None of the other methods or attributes are directly used by the player or by code outside the class. The `play_game` interface has been separated from the implementation details (the other methods and properties) in the Game class, thereby adhering to the abstraction principle. This is further reinforced by the fact that all other methods are set to private (as a result of writing this readme!).

The `Dictionary` class does not follow the abstraction principle because all of its methods are public and used outside the class.

By separating the code for saving and loading games into the `GamePersistence` module, I abstracted away the implementation details of saving and loading games. Therefore, `GamePersistence` helps the code adhere to the abstraction principle.

#### Encapsulation

'Encapsulation' refers to bundling methods and data into a single unit. That unit can be a class, a structure, or an interface. Encapsulation can be achieved by privatizing instance variables, using getters and setters, implementing an interface, or by using design patterns.

My code wraps a bunch of methods with `private`. Making use of `private` in this way is considered an encapsulation method, even though it also helps achieve abstraction. The reason for this is, to the best of my understanding, that encapsulation is a technique used to achieve abstraction. That is, abstraction is a design goal, and encapsulation is one way to accomplish it. If I'm not mistaken, the use of abstraction also helps enable encapsulation.

The `Game` class's methods and instance variables are bundled and confined to its interior, and only its interface is public. Therefore, `Game` has been sucessfully encapsulated.

The `Dictionary` class is partially encapsulated in the sense that dictionary-related methods and data are defined inside the class, but is not encapsulated in the sense that all its methods are public.

The `GamePersistence` module is encapsulated in the sense that its methods are private and can only be accessed by the `Game` class that `include`s it.

#### Single Responsibility Principle

The single responsibility principle states that every class, module, or function/method in a program should only be doing one thing.

The single responsibility principle is followed in this project because its methods perform one task each. Additionally, `Game`, `Dictionary`, and `GamePersistence` are each responsible for managing their respective data. Separating the display functionality into a separate class would be a potential improvement.

#### Inheritance

Inheritance is the process by which qualities are passed down — in the context of OOP, inheritance means that one class can be given acess to another class's data. This is similar to how a class can `include` a module, but including a module is not considered inheritance. Inheritance is useful because it allows for code reuse and modularization.

Inheritence was not used in this project, and is a potential area of improvement.

#### Polymorphism

'Polymorphism' refers to the ability of different objects to respond to the same message in different ways. This is achieved through inheritance, method overriding, and other techniques.

As with inheritance, polymorphism was not implemented in this project, and is a potential area of improvement.