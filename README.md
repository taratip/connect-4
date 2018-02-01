# connect-4
## Introduction

A command line version of Connect 4 game.

#### Use the Real World Equivalent

Often software mimics or replaces physical objects and processes. In software
development, and particularly with object oriented languages, we use the concept
of **metaphor** to drive the design of our programs. If you are not familiar
with how the game of Connect 4 works, check out the wiki article on it
[here](https://en.wikipedia.org/wiki/Connect_Four).

It will show a visual representation of the board to show with each
turn. Maybe it will look something like this:

```no-highlight
|                   |
|                   |
|                   |
|                   |
|                   |
|                   |
|                   |
|                   |
|                   |
|                   |
 A B C D E F G H I J
 ```

 When the first player moves and opts for column E it might look like this:

```no-highlight
|                   |
|                   |
|                   |
|                   |
|                   |
|                   |
|                   |
|                   |
|                   |
|        X          |
 A B C D E F G H I J
 ```

 A player wins the game when they get a line of 4 pieces. Start with supporting
 lines that are vertical and horizontal.

```no-highlight
|                   |
|                   |
|                   |
|                   |
|                   |
|                   |
|        X          |
|        X          |
|        X          |
|  0 0 0 X          |
 A B C D E F G H I J
 ```

Player X has won the game because of the vertical row of x's.
