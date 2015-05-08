## Enhancing the Robot with Exceptions

### Getting Familiar with Exceptions

Prior to starting this exercise, you should read the following introductory writeups:

1. <http://rubylearning.com/satishtalim/ruby_exceptions.html>
2. <http://www.skorks.com/2009/09/ruby-exceptions-and-exception-handling/>

As you read through these, I would suggest that you experiment with the code that they use as examples.

### 1. Implement `Robot#heal!`

Create a new instance method in the `Robot` class called `heal!`. This method will be slightly different than the previously defined `heal` (without a bang) method, in that this one is more aggressive in how it behaves.

`Robot#heal!` should `raise` an exception if the robot is already at 0 health or less. In other words, once a robot is dead, it cannot be revived.

### 2. Implement `Robot#attack!`

`Robot#attack!` should `raise` an exception if the target being attacked is not a robot. A user should not be able to attack an `Item` or anything other than a `Robot`.

Note: There is already an `attack!` method on Robot. So it is suggested that you rename that original method to `attack`, and fix all the broken specs (run all of them) so that you can then define `attack!` as a new method.

### Tips

#### Tip 1

You can raise `RuntimeError` exceptions for this exercise, at first. This is the simplest type of error to raise, because you can just use a string. 

**Example:** 

    raise "Can only attack a Robot!"
    
**Question:** If this raises a `RuntimeError` exception class, what is the string used for?

#### Tip 2

Attempt to call this these methods from IRB/Pry (use `require` or `require_relative` to load the appropriate classes first) and ensure that they do throw exceptions

#### Tip 3

You should of course write specs for these new methods as well, to ensure that they are working as specified. Testing frameworks like RSpec support the ability to test and make sure your methods throw exceptions when they should. 

See <https://www.relishapp.com/rspec/rspec-expectations/v/2-6/docs/built-in-matchers/raise-error-matcher> for syntax, documentation and examples for how to do this.

## Custom Exception Classes (Optional / Bonus)

Raising a `RuntimeError` isn't great practice, since many different things can cause a RuntimeError. It's too generic or vague. In order to be more specific, we could define our own exception classes, that should inherit from the `StandardError` class.

Example Error classes: 

* `RobotAlreadyDeadError` for the `heal!` method
* `UnattackableEnemy` for the `attack!` method

