# README

# Marketplace Documentation

## Identification of the problem
After searching google, one can determine that there is no popular marketplace application which caters specifically to peer to peer buying and selling of succulents in Brisbane. If a user wishes to sell or buy succulents, they will typically go through facebook marketplace or gumtree, or some such other non-specific marketplace.

## Why is this a problem?
If a user does not wish to use large social media sites like facebook, or gumtree for this specific, niche purpose, they currently have no other option. Users may prefer to interact with and see content from a user-base who shares a single particular interest.  
Having a highly specific purpose and user base for this application, allows for additional functionality which is directly linked to that purpose, for example, built in succulent descriptions, names or stock images, which are not available on large, multi-purpose marketplaces.

Link to the deployed app: https://succulent-marketplace.herokuapp.com/listings

Link to the app’s github repo: https://github.com/jordanfox1/succulent-marketplace

# Purpose
The purpose of this application is to provide succulent enthusiasts with an alternative marketplace to trade their items. Large sites such as facebook marketplace or ebay do not cater to specific communities or groups of people since they aren’t aimed at selling one particular type of item. Designing a site with a specific user base in mind also allows for displaying information that might be useful to that user base, for example, this site has information about different categories of succulents that exist. This typically could not be found on ebay or facebook marketplace.  
All users on this app will also be linked together by email, so it encourages users to form communities centered around sharing the same hobby. The scope of this application may be updated in the future to be specific to the Brisbane area, but for now, it is not location specific.

# Functionality/Features

* Users can create an account which is verified by an email confirmation, to prevent against users signing up with a fake email.
* Users can view all the listings available on the site.
* User's can view all listings made by another particular user.
* Users can create, update and delete a succulent listing. These listings are displayed to other users. This includes the ability to upload images and write descriptions, Users can not edit or delete the listings of other users.
* Users can search for a succulent by name or by category.
* Users can make an email request for the succulents of other users.
* Users can view information about several different categories of succulents.

# Sitemap
The sitemap can be found in the docs folder if not loaded
![Also found in the docs folder](storage/documentation_pictures/sitemap.jpg "a title")


# Screenshots
Also found in docs folder if not loading
![Also found in the docs folder](storage/documentation_pictures/index.png "a title")
![Also found in the docs folder](storage/documentation_pictures/index2.png "a title")
![Also found in the docs folder](storage/documentation_pictures/view.png "a title")
![Also found in the docs folder](storage/documentation_pictures/cat.png "a title")
![Also found in the docs folder](storage/documentation_pictures/ipad.png "a title")
![Also found in the docs folder](storage/documentation_pictures/mobile.png "a title")

# Target audience
The target audience of this application will be people interested in trading succulents with other people. The scope of this application may be updated in the future to be specific to the Brisbane area, but for now, it is not location specific.

# Tech Stack
* **Languages**: HTML, CSS, Ruby, Rails
* **Gems**: Devise, Rolify, Pundit, Active Storage Validations
* **Other**: Heroku, Cloudinary, PostgreSQL

# User Stories 
Link to the project’s trello board containing user stories: https://trello.com/b/XoSP6Goy/marketplace-app

# Wireframes
Also found in docs folder if not loading
![Also found in the docs folder](storage/documentation_pictures/wireframes.png "a title")

# ERD
Also found in docs folder if not loading
![Also found in the docs folder](storage/documentation_pictures/erd.png "a title")

# High level abstraction of the components of the app
The following will be a discussion of the various components of the app and how they interact, which are implemented through models and associations. The exact names in this description may not be the same as the models as the app, for the sake of simplicity.

### Users
A user creates an account and logs into the app, and can then see and request all of the listings made by other users. They can also create, update and delete their own listings. If a user is destroyed, their listings are also destroyed. A user has attributes which are used to identify and authenticate them, such as email and password. Their email address must be confirmed before using the application, which helps to prevent fake users. The entire functionality of the app relies on there being many users creating many listings.

### Listings
Listings are the things, (succulents), that are displayed on the app as for sale, and have been created by users. They can also be viewed and requested by other users. They contain whatever information the user gives them, such as price, name description, an image and whichever category the succulent falls under. They can be searched for by name or by category or found simply by looking at the homepage. A listing can not be made without a name, price, category or image associated with it, however, the description may be left blank. A user can not edit or delete the listings of another user, but can do so for their own.

### Categories
Categories are some of the most common types of succulents which may be used on the site. Each succulent listing made on the site must belong to a category, even if that is simply ‘other’. Succulents can be searched for by category, which will give a list of all the succulent listings on the site which fall into that particular category. The number of categories on the site is static, so categories can only be added by the developer in Rails itself and not in the application.


### Requests
Requests can be made by a user for a particular succulent and in the event of that happening, the user it belongs to is sent an email at the address they signed up with. The listings that have been requested by a user are recorded so that a user can not request the same listing more than once and send more than one email. If a listing is destroyed, all requests associated with that listing are also destroyed. 


# Third party services used by the app

### Heroku
This app is deployed with heroku and it has been configured to use the project’s github repository.

### Sendgrid
The emailing service used with this app is Sendgrid, which has been configured with ActionMailer in Rails to send emails using an address I created specifically for this app. The emails templates sent through devise are also reliant on this service.

### Cloudinary
This app uses cloudinary to host the images uploaded by users. Cloudinary has been configured with Active Storage in Rails.

### Postgresql
This application uses postgresql for its database which has been configured with Rails from the beginning of development.

### Bootstrap
This application’s styling incorporates several bootstrap components.

### Github
This application uses github for version control.

### Trello
The tool used to manage and track the progress of this application was a Kanban board hosted on trello.

# Models: in terms of the relationships (active record associations) they have with each other
The two main models this application is built on are Listing and User. There are also some additional models such as category and requested_listing(which was used only to implement requests) There is no actual requests model, as it was not necessary,  only the association and join table were needed.

1. **Listing**: A listing belongs to a user (many to one), has many categories, through listing_categories(many to many), has many requesters through requested_listings(many to many)

2. **User**: A user has many listings (one to many), has many requested, through requested_listings(many to many)

3. **Category**: category has many listings, through listing_categories(many to many)

# Database relations implemented

* **User and Listing**: One to many
Category and Listing: Many to many relationship, implemented through a join table name listing_category which has a foriegn key reference to the category and listing entities.

* **Listing and Category**: Many to many relationship, implemented through a join table called listing_category which has a foreign key reference to both Listing and Category.

* **Listing and Requesters(not created)**: Many to many Many to many relationship, implemented through a join table name requested_listing which has a foriegn key reference to the user and listing entities. The Requesters entity does not exist, and is only used as an attribute of Listing.

* **User and Requested(not created)**: Many to many Many to many relationship, implemented through a join table name requested_listing which has a foriegn key reference to the user and listing entities. The Requested entity does not exist, and is only used as an attribute of User.

# Database schema design
* Can be found in the ERD and the above descriptions.

# How tasks are allocated and tracked in the project
I originally designed the application to be something I could realistically finish, and completely understand the inner workings of. I followed the advice of defining the minimum viable product that would represent the application, creating that very quickly, and adding on top of that.  
I rewatched many of the class lectures and implemented the image uploading, and authentication and authorization features first, and I also went back and watched the lecture on rails scaffolding to quickly create all of the necessary CRUD operations and associated views and controller actions. At that point I deployed the app to heroku and began the actual process of coding, collecting seed data, and creating and linking the models that I already had outlined in an ERD.
I originally had plans to implement payments with stripe and peer to peer messaging, but decided it was beyond what I saw this application doing. In the future, I want to come back to those things.  
I also defined and broke down all of my features as prioritised user stories in my kanban board, so that I could focus on the highest priority features first and get the application off the ground quickly.  
So in conclusion, I had already outlined exactly what the application would do, then I defined the most important and fundamental parts of it, and implemented them first, which meant I was not spending too much time on unimportant or unused features.