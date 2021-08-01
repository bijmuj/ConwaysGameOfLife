# ConwaysGameOfLife

A simple Godot implementation of [Conway's Game of Life](https://en.wikipedia.org/wiki/Conway%27s_Game_of_Life).

In this implementation, pressing start at the start menu will give you an empty grid to fill up. Left clicking at a position spawns a cell there and right clicking despawns it. 
You can even hold left mouse button and drag to fill up multiple positions, same holding true for RMB.

The first part of the following video shows a Gosper glider gun, the latter parts showing other functionality.

[example video](https://user-images.githubusercontent.com/25398720/127778392-f51196dd-b06a-4be5-87dd-5667e324354b.mp4)

## Possible Improvements

- A way to save structures and reuse them later. Possibly with rotations added.
- Saving the whole grid state to replay.
- Turning wrap around on and off.
- Speeding up or slowing down the simulation while its running.
- A grid outline to make drawing structures easier.
