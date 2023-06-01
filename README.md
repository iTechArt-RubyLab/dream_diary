# Slumber

<img src="./public/evil-moon.png" width="200" />

This is a web application that allows users to keep track of their dreams by recording their experiences and adding tags to categorize them.

## The Most Challenging Task

The most challenging task in this project was implementing the search functionality. I had to figure out how to search for dreams based on keyword or tag, and then display the results in a user-friendly way.

## The Most Interesting Task

The most interesting task in this project was working with the Turbo framework in Rails.

Turbo provides a new approach to building interactive web applications, allowing developers to create web pages with minimal JavaScript and reducing the complexity of building advanced web applications.

In this project, we used Turbo to implement partial page updates without reloading the entire page. With Turbo, we were able to update the contents of a page without requiring the page to reload or writing complex JavaScript code.

## What Could Be Done If More Time Was Available?

If more time was available, there are several additional features and improvements that could be implemented in this project:

- More background jobs could be used to improve performance.
- More design patterns could be implemented to make the code more modular and maintainable.
- Raw SQL queries could be explored and utilized in cases where they may be more efficient than using ActiveRecord for database interactions.
- More detailed reports could be created to allow users to analyze their data more thoroughly.
- The bonus tasks listed in the project requirements could be completed.

Overall, there are many areas where the functionality of the project could be expanded and improved with more time. These areas could be explored more thoroughly to create an even more robust and user-friendly application.

## Installation

### Prerequisites

You need to have installed in your system:

- RVM
- Ruby 3.1.2
- PostgreSQL 15
- Redis
- Elasticsearch 8.7.1

#### RVM Installation

Install [RVM](https://rvm.io/).

#### Ruby Installation

```
rvm install 3.1.2
```

```
rvm use 3.1.2
```

#### PostgreSQL Installation

Visit https://www.postgresql.org/download/.

#### Redis Installation

Visit https://redis.io/docs/getting-started/installation/.

#### Elasticsearch Installation

Install [Elasticsearch](https://www.elastic.co/downloads/elasticsearch) 8.7.1.

## Project Setup

Navigate the project folder and run:

```
bundle
```

### Environment Variables and Keys

Create a `.env` file at the highest level of your app. The easiest way to do this is by typing `touch .env` into your terminal.

Add your credentials to the `.env` file.

#### SMTP

```
SMTP_USER=
SMTP_PASSWORD=
```

#### Google OAuth

```
GOOGLE_ID=
GOOGLE_SECRET=
```

#### Admin variables for seeds

```
ADMIN_EMAIL=
ADMIN_PASSWORD=
```

#### VisualCrossing API

Visit [VisualCrossing API](https://www.visualcrossing.com/weather-api) and add your credentials.

```
MOON_KEY=
```

#### Google Cloud Storage

In your google console create a new `.json` key, rename to `gcs.keyfile` and move it to the highest level of your app.

### Initialize project database settings

```
rails db:setup
```

### Run server

```
redis-server
```

```
sidekiq
```

```
rails s
```

Or you can use script:

```
./start.sh
```

## Profit!!!
