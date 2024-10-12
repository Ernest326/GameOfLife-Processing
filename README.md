# GameOfLife-Processing
This is an old side project of mine I made back in first year 2023 to practice one of my modules.  

This is an implementation of [Conway's Game Of Life](https://en.wikipedia.org/wiki/Conway%27s_Game_of_Life) which is a famous cellular automatation based on a few simple rules:
1. Any live cell with fewer than two live neighbour dies by underpopulation
2. Any live cell with two or three life neighbours lives to next generation
3. Any live cell with more than three live neighbours dies by overpopulation
4. Any dead cell with exactly three neighbours becomes a live cell by reproduction 

This is a basic project which includes a set grid layout and allows the user to draw cells, and play the simulation

> [!WARNING]
> This project uses an arraylist for Nodes rather than a 2D array, which is quite unoptimized so keep that in mind! This is an old project which I haven't touched and left as is
