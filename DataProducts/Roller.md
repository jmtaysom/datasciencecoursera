

Roller
========================================================
author: jmtaysom
date: 20 Nov 2015
transition: rotate

Character Roller App
========================================================

Did someone just convince you to play D&D and you dont have any dice?

Are you a DM who needs to roll up several characters?

Then use the character roller app to roll your stats!

How it works
========================================================

The app takes the number of dice you choose and rolls 6 stats like so

```r
dice <- 4
roll <- sample(1:6,dice, replace = TRUE)
sorted <- sort(roll,decreasing = TRUE)
total <- sum(sorted[1:3])
```
First is the roll, then it's sorted to choose the top 3 to be summed

```
[1] 5 4 2 3
```

```
[1] 5 4 3 2
```

```
[1] 12
```

The Window
========================================================
This is what the app looks like
![A view of the app](Screenshot.png)

Options
========================================================
You even have some options. Normally you owill roll 4d6 for stats 
but the following are also available.

- 3d6 - Used for many NPCs or low powered campaigns
- 4d6 - This is standard and for strong NPCs
- 5d6 - This is for high powered campiagns and maybe the BBEG

Thanks
========================================================
Let me know if you have any suggestions


Have Fun Rolling!!!!
