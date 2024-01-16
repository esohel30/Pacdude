# Pac-Dude

Group Name: Pac Bros
Group Members: Eric Sohel, Sunil Parab

To run our project please import the official Sound library.

Our project is going to be an enhanced version of Pac-Man called Pac-Dude, with many new features that are not present in the original. We first aim to have a fully functional Pac-Man game similar to the original, which would mean a preset map, the ability for Pac-Man to move around the map and pick up pellets, ghosts with a simple A.I. for deciding how they move around the map, and power pellets which Pac-Dude could eat to then eat the ghosts. After we finish with this we plan to improve the A.I. of the ghosts to make them similar to the original and add randomly generated maps and sound effects. Once we have achieved this we will start to work on additional features to the game, such as keys that can remove walls enclosing the power pellets, traps that can kill Pac-Dude (e.g. spikes that come out of the wall on a timed interval), or more power-ups that would help Pac-Dude clear the level.

Prototype: https://docs.google.com/document/d/1qzuJQvsFa4Hb9lO_jQYWX_D4uwLA5Xo509a6eXzZ-EY/edit?usp=sharing


Monday - 5/23/2022

Sunil Parab: Made the Entities interface, and the basic functions for the Ghost abstract class and PacDude class.

Eric Sohel: Created the map class which contains the preset map design along with several methods that allow other classes to interact with it. Also created several methods such as pellet generator which place all the in-game objects on the map.


Tuesday - 5/24/2022

Sunil Parab: Finished all of the functions for PacDude

Eric Sohel: Finished working on the map class and recreated every single method needed in the map class as described in our prototype.


Wednesday - 5/25/2022

Sunil Parab: Made PacDude appear on the screen and gave him the ability to move around by tapping the arrow keys. Also improved nextToBlock() for PacDude and Ghost so that it can be called to check any direction.

Eric Sohel: Worked on animating the two dimensional array map using processing. I animated the walls, ghost blocks, and the teleportation block as they are represented in the real game.


Thursday - 5/26/2022

Sunil Parab: PacDude can now move around the map with proper collisions and has a sliding animation.

Eric Sohel: Fixed errors with the map including scaling issues and x position and y position issues with pac-dude. Animated the pellets in the map, and made it so that Pac-Dude could eat these pellets. Also created two new methods which keep track of how many pellets Pac-Dude is eating and worked on creating an end screen for when the player beats the game.


Friday - 5/27/2022

Sunil Parab: Wasn't able to get work done due to my Sister's Graduation

Eric Sohel: Worked on getting the pellets collected and updating pac-dude's pellet count.


Saturday - 5/28/2022

Sunil Parab: Was still at my Sister's Graduation since it was a two-day event.

Eric Sohel: Started working on the ghost's methods. Worked on wander and chase however I could not get them to work properly.


Sunday - 5/29/2022

Sunil Parab: PacDude will now continously move after a button is pressed, and you are able to queue his next movement by entering an input before he reaches a wall where he can  go in the inputed direction.

Eric Sohel: Continued working on wander and chase and made them work a lot better. Then I updated the ghosts speeds and gave them the in-game colors they are supposed to have.


Monday - 5/30/2022

Sunil Parab: Added Game Start and End screens, which appear upon starting the project and collecting all the pellets respectively. Also animated PacDude so that his mouth will open and close while moving.

Eric Sohel: Worked on the score count and live counts for the pac dude game. I worked on accurately calculating the score based on pellets and killing ghost which create multipliers.


Tuesday - 5/31/2022

Sunil Parab: Made the algorithm that the ghosts use to chase PacDude and wander around. Also made a system for them to switch between the two modes on a timer.

Eric Sohel: Worked on the in-game mechanics of the power pellets which included giving pac-dude his special ability to eat ghosts and tried creating a timer which keeps this ability for a certain amount of time.


Wednesday - 6/1/2022

Sunil Parab: The ghosts can now kill PacDude based on when their visible model touches PacDude's visible model. Also added a 3 life system before the player loses.

Eric Sohel: could not get much work done because I am sick.


Thursday - 6/2/2022

Sunil Parab: Fixed errors cause by respawn, such as the pellet count being reset and added a 3 life system.

Eric Sohel: worked on displaying the score and trying to implement the characters lives and displaying them visually.


Friday - 6/3/2022

Sunil Parab: Started working on the advanced chasing methods for the ghosts and improved PacDude's animations.

Eric Sohel: started working on the new randomized maps and created a basic generator for this new map.


Saturday - 6/4/2022

Sunil Parab: Finished the behavior for the ghosts, other than them respawning, and rewrote how their move method works.

Eric Sohel: continued working on trying to implement a randomized map in PacDude. However, the randomized maps I made so far were not very good.


Sunday - 6/5/2022

Sunil Parab: Fixed how the power pellet works and made the ghosts behave properly while in the ghost house.

Eric Sohel: Finished working on the first prototype for the map generator which still does not create nice looking maps.


Monday - 6/6/2022

Sunil Parab: Ghosts can now leave the ghost house and turn blue while you have the power pellet, also the mode calculations now apply to all ghosts.

Eric Sohel: worked on the pellet mechanics and removed the characters invincibility after eating a power pellet. Also started working on being able to eat the ghosts.


Tuesday - 6/7/2022

Sunil Parab: Ghosts can now be eaten and their speeds have been changed. Also started fixing bug with Wander().

Eric Sohel: Started working on animating the ghosts and managed to replace all the ghosts with actual images of the red ghost instead of just circles.


Wednesday - 6/8/2022

Sunil Parab: Started making ghosts work with the maxmovecounter variable, also they can not kill after being eaten.

Eric Sohel: Continued to work on animating the ghost properly and now the ghosts are properly sized and move with out lag.


Thursday - 6/9/2022

Sunil Parab: Ghosts being eaten now fully works and they can kill again after being eaten. Fixed Map.getVal(), fixed score, and Blinky now gets mad when there are few pellets left.

Eric Sohel: Managed to make the eyes of the ghosts move and they are not lagging any more. Started working on the scared mode for the ghosts.


Friday - 6/10/2022

Sunil Parab: Added differentiator for when you win or lose the level, and you can now restart after losing.

Eric Sohel: finished animating the scared mode for the ghosts and properly centered the ghosts. Started working on the dead mode for the ghosts where they turn into eyes.


Saturday - 6/11/2022

Sunil Parab: You can now continue through levels and your score will stay as you progress. Also ghosts can now flash white while you have the power pellet

Eric Sohel: Finished fully animating all of the different modes of the ghosts including dead, alive, scared, inside, and outside of the house. Also added in game audio for ambiance, scared mode, death mode, and killing a ghost. Also added a story that the character is based off and music to match the story.


Sunday - 6/12/2022

Sunil Parab: Ghosts can now flash white while you have the power pellet, their collision now works properly, fixed some speed stuff, levels now get harder as you progress, fixed bugs with audio and added messages telling the player how to restart and pick the mode.

Eric Sohel: Finished working on the randomized maps and finalized worked on audio. Also worked on finalizing the game.
