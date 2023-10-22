<a name="readme-top"></a>

<!-- PROJECT LOGO -->
<br />
<div align="center">
  <a href="https://github.com/github_username/repo_name">
    <img src="public/images/escapelinklogo.png" alt="Logo" width="300" height="65">
  </a>

<h3 align="center">EscapeLink</h3>

  <p align="center">
    Embark on a mind-bending journey with our sleek and minimalistic escape room app. Featuring five captivating puzzles, you can challenge your wits alone or collaborate with friends to crack the codes and unravel the mysteries together. Get ready to unlock the door to adventure and test your problem-solving skills in the world of EscapeLink!
    <br />
  
  </p>
</div>



<!-- TABLE OF CONTENTS -->
<details>
  <summary>Table of Contents</summary>
  <ol>
    <li>
      <a href="#about-the-project">About The Project</a>
      <ul>
        <li><a href="#overview">Built With</a></li>
      </ul>
    </li>
    <li>
      <a href="#built-with">Getting Started</a>
      <ul>
        <li><a href="#running-on">Prerequisites</a></li>
        <li><a href="#installation-and-contribution">Installation</a></li>
      </ul>
    </li>
    <li><a href="#usage">Usage</a></li>
    <li><a href="#roadmap">Roadmap</a></li>
    <li><a href="#contributing">Contributing</a></li>
    <li><a href="#endpoints">License</a></li>
    <li><a href="#authors">Contact</a></li>
    <li><a href="#planning-tools">Acknowledgments</a></li>
  </ol>
</details>



<!-- ABOUT THE PROJECT -->
## About The Project

EscapeLink is a SOA app and needs both this backend repo AND [![GitHub](https://img.shields.io/badge/GitHub-100000?style=for-the-badge&logo=github&logoColor=white) ](https://github.com/escape-link/escapelink-fe) (front-end) in order to be fully functioning.


## Overview
This project is built to satisfy the requirements of the Turing School of Software and Design's [Capstone Project](https://mod4.turing.edu/projects/capstone/), where students come up with their own idea for an application and build it as a group project.

This application is designed for those who enjoy standard escape rooms, as well as those who appreciate puzzle and problem-solving games.

After being debriefed on the current mission, users have the option to either team up with others or embark on a solo adventure in EscapeLink. Once every team member is prepared to start the game, they are taken into the escape room, where they are presented with an intuitive and user-friendly interface that contains a handful of hidden puzzles.


<p align="right">(<a href="#readme-top">back to top</a>)</p>



## Built With

* ![Ruby](https://img.shields.io/badge/ruby-%23CC342D.svg?style=for-the-badge&logo=ruby&logoColor=white)
* ![Postgresql](https://img.shields.io/badge/PostgreSQL-316192?style=for-the-badge&logo=postgresql&logoColor=white)
* ![Rails](https://img.shields.io/badge/rails-%23CC0000.svg?style=for-the-badge&logo=ruby-on-rails&logoColor=white)
* ![Visual Studio Code](https://img.shields.io/badge/Visual%20Studio%20Code-0078d7.svg?style=for-the-badge&logo=visual-studio-code&logoColor=white)
* ![Heroku](https://img.shields.io/badge/heroku-%23430098.svg?style=for-the-badge&logo=heroku&logoColor=white)
* ![CircleCI](https://img.shields.io/badge/circle%20ci-%23161616.svg?style=for-the-badge&logo=circleci&logoColor=white)
* ![Redis](https://img.shields.io/badge/redis-%23DD0031.svg?style=for-the-badge&logo=redis&logoColor=white)


<p align="right">(<a href="#readme-top">back to top</a>)</p>

## Running On
- Rails 7.0.8
- Ruby 3.2.2
<br>

## Installation and Contribution

Contributions are what make the open source community such an amazing place to learn, inspire, and create. Any contributions you make are **greatly appreciated**.

If you have a suggestion that would make this better, please fork the repo and create a pull request. You can also simply open an issue with the tag "enhancement".
Don't forget to give the project a star! Thanks again!

To get a local copy, follow these simple instructions

1. Fork the project
2. Clone the repo
   ```
   git clone git@github.com:your_username/escapelink-be.git
   ```
3. Install the gems
   ```
   bundle install
   ```
4. Create the database
   ```
   rails db:{create,migrate}
   ```
5. Create your feature branch
  ```
  git checkout -b feature/AmazingFeature
  ```
6. Commit your changes
  ```
  git commit -m "add AmazingFeature"
  ```
7. Push to the branch
  ```
  git push origin feature/AmazingFeature
  ```
8. Open a pull request

<p align="right">(<a href="#readme-top">back to top</a>)</p>



## Endpoints
```
POST 'api/v0/games' 
```
KEY: 'room_name' <br>
VALUE: 'Where's Bob?'<br>
(creates a game and returns a unique link)
```
POST 'api/v0/messages' 
```
(creates and broadcasts a new message via websockets)
```
GET 'api/v0/leaderboards' 
```
KEY: 'room_name'<br>
VALUE: 'Where's Bob?'<br>
(accesses leaderboard data and returns the top ten of a given escape room)


<p align="right">(<a href="#readme-top">back to top</a>)</p>



## Authors
- Dani Wilson [![GitHub](https://img.shields.io/badge/GitHub-100000?style=for-the-badge&logo=github&logoColor=white) ](https://github.com/dani-wilson) [![LinkedIn](https://img.shields.io/badge/LinkedIn-0077B5?style=for-the-badge&logo=linkedin&logoColor=white) ](https://www.linkedin.com/in/daniraewilson/)
- Kaina Cockett [![GitHub](https://img.shields.io/badge/GitHub-100000?style=for-the-badge&logo=github&logoColor=white) ](https://github.com/kcockett) [![LinkedIn](https://img.shields.io/badge/LinkedIn-0077B5?style=for-the-badge&logo=linkedin&logoColor=white) ](https://www.linkedin.com/in/kcockett/)
- Mike Wood [![GitHub](https://img.shields.io/badge/GitHub-100000?style=for-the-badge&logo=github&logoColor=white) ](https://github.com/MWoodshop) [![LinkedIn](https://img.shields.io/badge/LinkedIn-0077B5?style=for-the-badge&logo=linkedin&logoColor=white) ](https://www.linkedin.com/in/michaelwilliamwood/)


<p align="right">(<a href="#readme-top">back to top</a>)</p>

## Planning Tools
- [![Miro Board](https://img.shields.io/badge/Miro-050038?style=for-the-badge&logo=Miro&logoColor=white)](https://miro.com/app/board/uXjVMmKnWLE=/?share_link_id=729961862050)
- [![GitHub](https://img.shields.io/badge/GitHub-100000?style=for-the-badge&logo=github&logoColor=white) ](https://github.com/orgs/ontrack-2305/projects/1/views/1)
- ![Slack](https://img.shields.io/badge/Slack-4A154B?style=for-the-badge&logo=slack&logoColor=white)

<p align="right">(<a href="#readme-top">back to top</a>)</p>




