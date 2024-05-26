# R2

The Football App is a mobile application that provides users with live scores, match schedules, player statistics, and more, This App UI is like the FotMob app, Whether you're a football enthusiast or just want to keep track of your favorite teams and players.
## ScreenShots



<p float="left">
   <img src="https://github.com/aymanshaheen/Football-Score/assets/52037629/c0dc53db-e521-4b43-893e-d8cbcb9ff8db" width="18%" />
   <img src="https://github.com/aymanshaheen/Football-Score/assets/52037629/50593585-7afb-4368-bba7-b002b45fd970" width="18%" />
   <img src="https://github.com/aymanshaheen/Football-Score/assets/52037629/64560f24-dddb-4b92-be4f-86ca80de59bd" width="18%" />
   <img src="https://github.com/aymanshaheen/Football-Score/assets/52037629/cb60932d-b81d-4533-b003-764df200d061" width="18%" />
   <img src="https://github.com/aymanshaheen/Football-Score/assets/52037629/28f934e1-5043-4815-bfd3-e116a88d5d5f" width="18%" />
</p>
<details>
<summary>More screenshots</summary>

<p float="left">
   <img src="https://github.com/aymanshaheen/Football-Score/assets/52037629/6c92510f-ac91-4fb5-bf4a-bf9903443fd2" width="32%" />
   <img src="https://github.com/aymanshaheen/Football-Score/assets/52037629/410557f8-b404-4b40-aed8-cc06fe44f497" width="32%" />
   <img src="https://github.com/aymanshaheen/Football-Score/assets/52037629/d08b0615-4e46-44c3-abe0-7fb0bc7163d6" width="32%" />
</p>
<p float="left">
   <img src="https://github.com/aymanshaheen/Football-Score/assets/52037629/d1fceadc-82d3-4eab-b21e-fdf3c5283d63" width="32%" />
   <img src="https://github.com/aymanshaheen/Football-Score/assets/52037629/7d7661e2-1e20-4f08-b448-213bc1246db7" width="32%" />
   <img src="https://github.com/aymanshaheen/Football-Score/assets/52037629/aced511d-3289-4f5e-b740-39b58c981fac" width="32%" />
</p>

</details>


## Features

- Google sign-in
- Match schedules and results
- Match statistics and head-to-head
- Detailed player and team statistics
- User-friendly interface

## Technologies Used

- **State Management:** BLoC (Business Logic Component)
- **Dependency Injection:** get_it
- **HTTP Client:** Dio
- **Local Database:** Hive



## API Reference
This is a freemium API that gives you only 100 request per day. 
[https://v3.football.api-sports.io/](https://v3.football.api-sports.io/)





## Installation

Clone the repository:

```bash
 git clone https://github.com/aymanshaheen/Football-Score.git
 cd football-app
```
Install dependencies:

```bash
  flutter pub get
```
Run the app:

```bash
  flutter run
```

## Keep in mind

- The app hasn't been tested on IOS devices (even an emulator) as of yet, since I don't have a Mac, which is required to build an actual executable file. The app itself doesn't have any platform-specific code, though there are a couple of dependencies that do. I configured them according to the instructions, so the app should work fine on both Android and IOS.
