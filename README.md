# Yet another roguelike tutorial

Based on [tutorials from r/RoguelikeDev](https://www.reddit.com/r/roguelikedev/comments/1dt8bqm/roguelikedev_does_the_complete_roguelike_tutorial/)

## Day 0
It starts from choosing the enviroment. 
I started project in ZeroBrane Studio, but suddenly became aware about [kickstart.nvim](https://youtube.com/watch?v=m8C0Cq9Uv9o) project by TJ DeVries.  
It, with some [advices](https://youtube.com/watch?v=w7i4amO_zaE) from ThePrimeagen, pushed me deep in a rabbit hole.  
I learned a fair share about NeoVim, it's plugins, some new stuff about fuzzy-finder and tree-sitter, realized that LSP are a new norm, so a lot.

All this time i wasn't making progress. 
Single _@_ sign was moving slowly and lonely in labyrinth made from a single wall strunged across screen. 

Tomorrow. Tomorrow i will hike through Roguelike tutorial blazingly fast, you'll see.

## Day 0 for real
Setting up. Yeah i didn't use python here, this project is written in lua.   
TCOD library? I bet it is python bound.  
Dejavu font png downloaded.
Chosen editor fired up, ready to roll.

## Day 1 err, Part 1
Love2d project is easy to start, no problems here.  
Now, i dont know what is wrong with python that it can invoke font\charset from a png file, and use it with colorcoding. Here in graphical realm, i will slice up image in quads and use them.

Moving a picture on a screen, using keystrokes is not very intimidating, so no problems here.

## Part 2
Lua is heavily functional language, so it will be pretty unoptimal to work with Entity-oriented approach. And i will suffer greatly in the future. But will go on.

Setting up different version of tiles and a map of them was suddenly a big problem, but then i hardcoded Scale, WorldSize, FontSize, and get very happy.

After this i reworked the gamemap to be a real 2d array, not a pixels array, and after it i switched to Neovim.

Oh boy, so many warnings. 

## Part 3
Things i lack at this moment: engine, event queue, color tokens. But that won't stop me from generation a dungeon!
