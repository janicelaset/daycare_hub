# Beebsy
#####12/14/2015

####By: Janice Laset-Parkerson

Beebsy is a web application that connects parents with daycares in their area. It allows daycares to add relevant information and generates a profile that parents can view. It features a simple user interface for daycare providers to make the process as easy as possible. Parents can search for daycares based on their location and view a map of the nearest facilities in their area.

This application is live and can be viewed at [beebsy.herokuapp.com](http://beebsy.herokuapp.com)

This project is ongoing. Please visit the [beebsy Trello Board](https://trello.com/b/7MDhahCf/beebsy) to view the progress.

## Prerequisites

You will need the following things properly installed on your computer.

* [Git](http://git-scm.com/)
* [PhantomJS](http://phantomjs.org/)
* Postgres
* Rails 4.2.4

## Installation

* open a command terminal
* `git clone https://github.com/janicelaset/daycare_hub.git`
* `cd daycare_hub` to navigate to project directory
* `bundle install` to install program dependencies
* `postgres` to start postgres server
* `rake db:create`
* `rake db:migrate`

## Running / Development

* `rails server`
* Visit app at [http://localhost:3000](http://localhost:3000).

### Running Tests

* `rake db:test:prepare`
* `rails server`
* `rspec`

### Deploying

Amazon Web Services used

## Technologies Used

* Ruby on Rails
* Capybara and RSpec test framework
* PostgreSQL database
* Active Record and Rake
* Bootstrap
* Paperclip
* Devise
* Amazon Web Services
* JQuery UI
* Google Maps


  ### Legal

Copyright (c) 2015 **Janice Laset-Parkerson**

This software is licensed under the MIT license.

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in
all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
THE SOFTWARE.
