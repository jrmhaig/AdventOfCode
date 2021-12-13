# Day 13: Transparent Origami

## Overview

The input for [Transparent Origami](https://adventofcode.com/2021/day/13) is in
two parts; a set of coordinates and then a sequence of commands to 'fold' the
coordinates when they are plotted.

## Patterns used

* [Flyweight](https://en.wikipedia.org/wiki/Flyweight_pattern)
* [Command](https://en.wikipedia.org/wiki/Command_pattern)

## Solution

Save the puzzle input as `input.txt` and execute

```bash
./folding.rb
```

I am not entirely sure this is the correct use of the Flyweight pattern as I am
not familiar with it (I keep thinking it is
[Flywheel](https://www.youtube.com/watch?v=0Hv5lqE0f3Q)). Its purpose is to save
memory usage by storing multiple items of data that share some functionaility in
a single object instead of multiple objects. In this case all the point are
stored in the [`Paper`](lib/paper.rb) object instead of individual points.

The Command pattern is used for the two folding actions,
[`fold_along_x`](lib/fold_along_x.rb) and [`fold_along_y`](lib/fold_along_y.rb).
