# R2

The Football App is a mobile application that provides users with live scores, match schedules, player statistics, and more, This App UI is like the FotMob app, Whether you're a football enthusiast or just want to keep track of your favorite teams and players.
## ScreenShots

<p float="left">
    <img src="https://raw.githubusercontent.com/rho-cassiopeiae/the12thplayer/dev/.github/images/1.png" width="24%" />
    <img src="https://raw.githubusercontent.com/rho-cassiopeiae/the12thplayer/dev/.github/images/2.png" width="24%" />
    <img src="https://raw.githubusercontent.com/rho-cassiopeiae/the12thplayer/dev/.github/images/5.png" width="24%" />
    <img src="https://raw.githubusercontent.com/rho-cassiopeiae/the12thplayer/dev/.github/images/7.png" width="24%" />
</p>

<details>
<summary>More screenshots</summary>

<p float="left">
    <img src="https://raw.githubusercontent.com/rho-cassiopeiae/the12thplayer/dev/.github/images/8.png" width="32%" />
    <img src="https://raw.githubusercontent.com/rho-cassiopeiae/the12thplayer/dev/.github/images/4.png" width="32%" />
    <img src="https://raw.githubusercontent.com/rho-cassiopeiae/the12thplayer/dev/.github/images/12.png" width="32%" />
</p>
<p float="left">
    <img src="https://raw.githubusercontent.com/rho-cassiopeiae/the12thplayer/dev/.github/images/9.png" width="32%" />
    <img src="https://raw.githubusercontent.com/rho-cassiopeiae/the12thplayer/dev/.github/images/6.png" width="32%" />
    <img src="https://raw.githubusercontent.com/rho-cassiopeiae/the12thplayer/dev/.github/images/13.png" width="32%" />
</p>
<p float="left">
    <img src="https://raw.githubusercontent.com/rho-cassiopeiae/the12thplayer/dev/.github/images/10.png" width="32%" />
    <img src="https://raw.githubusercontent.com/rho-cassiopeiae/the12thplayer/dev/.github/images/11.png" width="32%" />
    <img src="https://raw.githubusercontent.com/rho-cassiopeiae/the12thplayer/dev/.github/images/3.png" width="32%" />
</p>

</details>



## Features

- Google sign-in
- Match schedules and results
- Match statistics and head to head
- Detailed player and team statistics
- User-friendly interface


## API Reference
This is a freemium API  that gives you only 50 requests per day. 
```http
  GET https://v3.football.api-sports.io/
```

| Parameter | Type     | Description                |
| :-------- | :------- | :------------------------- |
| `api_key` | `string` | **Required**. Your API key |






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

- The app is a work in progress. There are still many essential things missing — input validation, tests, graceful error display, lots of UI elements, better caching — just to name a few.
- UI colors are supposed to change depending on which team community is selected. At the moment though all colors are simply hardcoded.
- The app hasn't been tested on IOS devices (even an emulator) as of yet, since I don't have a Mac, which is required to build an actual executable file. The app itself doesn't have any platform-specific code, though there are a couple of dependencies that do. I configured them according to the instructions, so the app should work fine on both Android and IOS.
