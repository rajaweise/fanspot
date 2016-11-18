<!DOCTYPE html>
<html>
    <head>
        <title>Black Jeezus Idol Page</title>
        <meta charset="windows-1252">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <style>
        /*positioning*/
            .center {
                margin: auto;
            }
            .container {
                position: relative;
                margin: auto;
                overflow: hidden;
            }
            .bottomRight {
                position: absolute;
                bottom: 0;
                right: 0;
            }
            .topRight {
                position: absolute;
                top: 0;
                Right: 0;
            }
            .topLeft {
                position: absolute;
                top: 0;
                Left: 0;
            }
            .inline {
                display: inline;
            }
            .floatLeft {
               float: left;
            }
            .floatRight {
                float: right;
            }
            .clearLeft {
                clear: left;
            }
            .clearRight {
                clear: Right;
            }
        /*layout*/
            .noPadding {
                padding: 0px;
            }
            .noTopOrBottomMargin {
                margin-top: 0;
                margin-bottom: 0;
            }
        /*themes*/
            .textStandard {
                font-size: 1.3em;
                font-family: sans-serif;
            }
            .textCenter {
                text-align: center;
            }
            .goldFont {
                color: #fffc4d;
            }
            .goldBorder {
                border: 2px solid #fffc4d;
            }
            .textUnderline {
                text-decoration: underline;
            }
        /*elements*/
            body {
                background-color: #f5f9f9;
            }
            main {
                width: 68.19%;
                height: 430px;
                background-image: url("blackJeezusPhoto.jpg");
                background-size: 100% 593px;
                border-bottom: 1px solid #fffc4d;
            }
            .idolContent {
                width: 68.19%;
                background-color: #d0d9f9;
            }
            aside {
                width: 27.68%;
                min-width: 200px;
                height: 100%;
                background-color: rgba(165, 228, 243, 0.4);
            }
            .idolMarketplace {
                width: 82.58%;
                margin-bottom: 10px;
                margin-top: 10px;
            }
            .gamesSection {
                width: 92.29%;
            }
            .newGamesSection {
                width: 100%;
                background-color: #999999;
                padding-top: 8px;
                padding-bottom: 8px;
            }
            .pastGamesSection {
                width: 100%;
                background-color: #d0d0d0;
                padding-top: 8px;
                padding-bottom: 8px;
            }
            .game {
                width: 92.29%;
                background-color: blue;
                margin-top: 8px;
                margin-bottom: 20px;
            }
            .newGame {
                background-color: #d0d0d0;
            }
            .pastGame {
                background-color: #999999;
            }
        /*modules*/
        .topFansTitle {
            font-size: 2em;
        }
        .button {
            background-color: #dfe5ed;
            border: 0.5px solid #85898e;
            border-radius: 6px;
            width: 100%;
            height: 46px;
            font-size: 1.2em;
        }
        /*list styling*/
        .tab {
            list-style-type: none;
            margin: 0;
            padding: 0;
            overflow: hidden;
            border: 1px solid #ccc;
            background-color: #f1f1f1;
        }
        .tab li {float: left;}
        .tab li a {
            display: inline-block;
            color: black;
            text-align: center;
            padding: 14px 16px;
            text-decoration: none;
            transition: 0.3s;
            font-size: 17px;
        }

        </style>
        <script>
            /* tab javascript */
            function openGames(evt, gameType) {
                var i, tabcontent, tablinks;
                tabcontent = document.getElementsByClassName("tabcontent");
                for (i = 0; i < tabcontent.length; i++) {
                    tabcontent[i].style.display = "none";
                }
                 tablinks = document.getElementsByClassName("tablinks");
                for (i = 0; i < tablinks.length; i++) {
                    tablinks[i].className = tablinks[i].className.replace(" active", "");
                }
                document.getElementById(gameType).style.display = "block";
                evt.currentTarget.className += " active";
            }
        </script>
    </head>
    <body class="noPadding noTopOrBottomMargin textStandard">
        <main class="idolMain container goldFont noPadding noTopOrBottomMargin">
            <h1 class="floatRight noTopOrBottomMargin idolName">
                Idol Name
            </h1>
            <aside class="topFans floatLeft goldBorder">
                <h2 class="noPadding noTopOrBottomMargin textCenter textUnderline topFansTitle">
                    Top Fans
                </h2>
                <table class="center noTopOrBottomMargin topFansTable">
                    <tr>
                        <th class="position"></th>
                        <th class="username"></th>
                        <th class="fanpoints"></th>
                    </tr>
                    <tr>
                        <td class="position1">
                            1
                        </td>
                        <td class="username1">
                            topfan
                        </td>
                        <td class="fanpoints1">
                            25312
                        </td>
                    </tr>
                    <tr>
                        <td class="position2">
                            2
                        </td>
                        <td class="username2">
                            topfan232
                        </td>
                        <td class="fanpoints2">
                            42132
                        </td>
                    </tr>
                    
                </table>
            </aside>
            <h2 class="totalFans bottomRight noTopOrBottomMargin">
                Total Fans: 
            </h2>
        </main>
        <div class="idolContent container noTopOrBottomMargin">
            <div class="container center idolMarketplace">
                <div class="inline floatLeft noPadding inline becomeAFan">
                    <button type="button" class="inline button becomeAFanButton">
                    +Become a Fan
                    </button>
                </div>
                <div class="get321Deal noPadding inline floatRight">
                    <button type="button" class="inline button getThe321DealButton">
                        +Get the 321Deal
                    </button>
                </div>
            </div>
            <div class="center container gamesSection">
                <ul class="tab gameMenu">
                    <li>
                        <a href="#" class="tablinks" onclick="openGames(event, 'newGamesSection')">
                            New Games
                        </a>
                    </li>
                    <li>
                        <a href="#" class="tablinks" onclick="openGames(event, 'pastGamesSection')">
                            Past Games
                        </a>
                    </li>
                </ul>
                <div class="tabContent newGamesSection">
                    <div class="container game newGame game1">
                        <h2 class="gameTitle">
                            Game Title
                        </h2>
                        <ul class="topRight">
                            <li class="reward">
                                reward
                            </li>
                            <li class="entry">
                                entry
                            </li>
                            <li class="ends">
                                ends
                            </li>
                        </ul>
                        <p class="description">
                            This is a short description of the game.
                        </p>
                        <h3 class="entries">
                            Entries
                        </h3>
                        <a href="" class="inline"> All entries</a>
                        <div class="soundEntry11">
                            <a class="playButton11">
                                playButton
                            </a>
                            <p class="entryTitle11">entrytitle1</p>
                        </div>
                        <div class="soundEntry12">
                            <a class="playButton12">
                                playButton
                            </a>
                            <p class="entryTitle12">entryTitle2</p>
                        </div>
                    </div>
                    <div class="container game newGame game2">
                        <h2 class="gameTitle">
                            Game Title
                        </h2>
                        <ul class="topRight">
                            <li class="reward">
                                reward
                            </li>
                            <li class="entry">
                                entry
                            </li>
                            <li class="ends">
                                ends
                            </li>
                        </ul>
                        <p class="description">
                            This is a short description of the game.
                        </p>
                        <h3 class="entries">
                            Entries
                        </h3>
                        <a href=""> All entries</a>
                        <div class="soundEntry21">
                            <a class="playButton21">
                                playButton
                            </a>
                            <p class="entryTitle21">entrytitle1</p>
                        </div>
                        <div class="soundEntry22">
                            <a class="playButton22">
                                playButton
                            </a>
                            <p class="entryTitle22">entryTitle2</p>
                        </div>
                    </div>
                </div>
                <div class="tabContent pastGamesSection">
                   <div class="container game pastGame game3">
                        <h2 class="gameTitle">
                            Game Title
                        </h2>
                        <ul class="topRight">
                            <li class="reward">
                                reward
                            </li>
                            <li class="ends">
                                ended
                            </li>
                        </ul>
                        <p class="description">
                            This is a short description of the game.
                        </p>
                        <h3 class="entries">
                            Entries
                        </h3>
                        <a href=""> All entries</a>
                        <div class="soundEntry31">
                            <a class="playButton31">
                                playButton
                            </a>
                            <p class="entryTitle31">entrytitle1</p>
                        </div>
                        <div class="soundEntry32">
                            <a class="playButton32">
                                playButton
                            </a>
                            <p class="entryTitle32">entryTitle2</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>