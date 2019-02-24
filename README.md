<p align="center">
    <img src="https://user-images.githubusercontent.com/1342803/36623515-7293b4ec-18d3-11e8-85ab-4e2f8fb38fbd.png" width="320" alt="API Template">
    <br>
    <br>
    <a href="http://docs.vapor.codes/3.0/">
        <img src="http://img.shields.io/badge/read_the-docs-2196f3.svg" alt="Documentation">
    </a>
    <a href="https://discord.gg/vapor">
        <img src="https://img.shields.io/discord/431917998102675485.svg" alt="Team Chat">
    </a>
    <a href="LICENSE">
        <img src="http://img.shields.io/badge/license-MIT-brightgreen.svg" alt="MIT License">
    </a>
    <a href="https://circleci.com/gh/vapor/api-template">
        <img src="https://circleci.com/gh/vapor/api-template.svg?style=shield" alt="Continuous Integration">
    </a>
    <a href="https://swift.org">
        <img src="http://img.shields.io/badge/swift-4.1-brightgreen.svg" alt="Swift 4.1">
    </a>
</p>

## Baseball Tracker Server
This application is the backend for my [Baseball Tracker](https://github.com/benyoung96/baseball-tracker) repository. The database stores all the MLB Teams, their 25 man rosters and their 162 game schedules. For now the backend is only need to preload the teams, rosters and schedules during the on boarding process because this app is intented to be able to use with no internet connect except for the initial setup.

## Setup Instructions
The following steps walk you through how to setup the database. These directions assume you are install on a mac.
#### PostgreSQL Installation
If you dont already have ProstgreSQL installed run the following command:
```
brew tap homebrew/services && brew install postgres && brew services start postgres
```
After the previous command is completed you need to create the database for the baseball tracker. The name used in the database setup is "baseball_tracker" but it can be changed to whatever you choose:
```
create baseball_tracker
```
If you choose to use baseball_tracker as the database you will still need to change the username of the database with the output of the whoami command:
```
whoami
```
And if you decided to change the name of the database you need to change the follow in the configure.swift file:
```swift
let config = PostgreSQLDatabaseConfig(hostname: "localhost", username: "<WHOAMI OUTPUT>", database: "<YOUR DATABASE NAME>")
```

#### Running Server
At this point you are ready to run the server. Running the server will automaticly populate the tables with the correct columns for each model declared in the models folder. To build and run the server run the following command in the project main directory:
```
vapor build && vapor run
```

#### Loading with Data
To load the database with data all you need to do is run the scripts in the scripts folder.

## Supported Teams
#### New York Yankees
 - 25 man roster
 - Schedule through the end of May
 
 ### Things I Learned
  - Server side swift with Vapor 3
