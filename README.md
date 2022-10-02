# Intellisense Module for Lua

Since Nakama lacks a native way to provide Intellisense data to Lua modules I decided to build this one in order to help speed up my personal development.

This is also shared on the [Nakama forums.](https://forum.heroiclabs.com/t/nakama-lua-intellisense-implementation/2576)

Without further ado, here it is, with instructions on how to use it.

The main objective of this is to add a working Intellisense for Nakama Lua functions, using EmmyLua Intellisense (which is cross IDE enabled).

To do this we are going to first install the [EmmyLua](https://github.com/EmmyLua) plugin for your IDE.

With the plugin installed you now need to download nakama.lua module from this repo.

Then add it to your project in order to allow the require(“nakama”) to import it, this will allow the Nakama functions to display Intellisense based on this new added module.

Before deploying the server always remember to make sure NOT to upload the nakama.lua file since that will break the server framework.

If someone notices any bug on the file, please let me know so I can add or improve already existing Intellisense.
