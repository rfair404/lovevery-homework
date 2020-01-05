# Lovevery Take Home Project

This is the take-home project for engineers at Lovevery, and thanks in advance for taking the time on this.  The
goal of this project is to try to simulate some real-world work you'll do as an engineer for us, so that we can
see you write some code from the comfort of your own computer.

## The Project

This application is a *very* basic simulation of browsing our products and purchasing one of them.  The
application should work and it has tests to demonstrate that.  Much is simplified to keep the code minimal and
avoid making you deal with unnecessary complexity.

The basic flow is:

1. Visit `/` and see the products
1. Select a product to view it
1. Click to purchase that product
1. Fill in the data needed to purchase it:
   - Your name
   - Your child's name and birthdate
   - Your address and zip code
   - Your credit card information
1. This will create an order in our system, as well as a record for your child if they are not already in the database.

What we'd like you to do is allow this app to support gifting.  Instead of a parent buying one of our products for
their child, we want you to *also* allow anyone to buy a product for any child. Imagine you are someone's aunt or
uncle and you want to get them a Lovevery product as a gift.

There are three basic requirements:

* The gift giver can provide an optional message to the child.
* The gift giver must know the child's name and birthdate, as well as the child's parent's name, but does not need
to provide the child's shipping address or zipcode.
* The child must already be in the system, and we can use their previous order shipping information to know how to
ship the gift order.

Beyond that, it's up to you how to implement this and how it should look.

* There is no "one true answer" so write the code as you would normally for a job.
* Don't get fancy—this doesn't have to be a demonstration of every skill you have. Focus on solving the problem above as expediently as you can.  In the real world, that's what you'd do in order to get feedback and iterate.
* Make sure that a) your changes are well tested and b) you don't cause any of the existing tests to fail

Feel free to ask any questions of us, but you can simply make any assumptions you need to get moving. If you ask
us specifics about the requirements, we might say to use your best judgement.

## Getting Set Up

Assuming you have Ruby installed and are using a Ruby version manager like rvm or rbenv, you should be able to:

```
> bin/setup
> bin/rspec
```

This should install needed gems, set up your databases, and then run the tests, which should all pass.  If
anything is wrong at this stage and you can't obviously fix it, let us know.  This is *not* a test of your ability
to setup a Rails dev environment.

## Notes About The Code

We've kept this as free of third party dependencies as possible to keep things simple.  There are two main
dependencies this app uses that aren't part of Rails: Bootstrap and RSpec.

[Bootstrap](https://getbootstrap.com/) is used for styling the site so you don't have to write a bunch of CSS but
can still produce a decent-looking UI.  Hopefully you find it easy enough to use.

[RSpec](https://rspec.info) is a commonly used testing framework that we use, so we thought it was important to
put it into this project.  This is not a test of your ability to use every feature of RSpec, so if you are
unfamiliar with how it works, this is the very very basics that you need:

* `Rspec.describe`, `describe`, `RSpec.feature` create blocks of code and are for organization only.  They have no
other purpose
* `it` and `scenario` create blocks of code that *are* the test cases.  Each test case should be given to an `it`
or `scenario` block, and this app has many examples to follow.
* To assert things in your tests, you would write `expect(«thing to assert»).to eq(«value you expect it to be»)`, for example `expect(4 + 4).to eq(8)`.  RSpec has *many* (many) more ways to assert things, but if all you use is this one mechanism, you are fine.

Finally, while we tried to write a clean and well-tested app for you, we will go ahead and admit now that it's not
perfect and there are things that could be improved.  We might ask you about your thoughts on some of this code
later, but this is all part of the scenario - real-world code is never as nice as we'd like.
