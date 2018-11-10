# Fairgrounds

[![Build Status](https://travis-ci.org/dkniffin/fairgrounds.svg?branch=master)](https://travis-ci.org/dkniffin/fairgrounds)

Fairgrounds is an app for sharing and voting on sets of cards (aka "Kingdoms") for the card game
[Dominion](https://boardgamegeek.com/boardgame/36218/dominion).

## Table of Contents

- [Stack](#stack)
- [Getting Started](#getting-started)
  - [Installation](#installation)
  - [Usage](#usage)
  - [Seeded Logins](#seeded-logins)

## Stack

- Rails - ~> 5.1.4
- Ruby - 2.4.2
- PostgreSQL

## Getting Started

### Installation

If you haven't installed ruby, bundler, and postgresql, do that first. Then, do the following to
set up this app:

```sh
git clone git@github.com:dkniffin/fairgrounds.git
cd fairgrounds
bundle install
cp .env.example .env
bundle exec rails db:setup
```

### Importing Cards

To import the data about all of Dominion's cards, run `bundle exec rake import:cards`.
**Note: This step is automatically run when running `db:seed` or `db:setup`**

### Usage

To run the app locally:

```sh
bundle exec foreman start
```

Then navigate to http://localhost:3000
