# Day 12: Passage Pathing

## Overview

The input for [Passage Pathing](https://adventofcode.com/2021/day/12) represents
the connections between a series of caves, some of which are small indicating
that they may only be visited once. The challenge is to find the number of
routes from the start to the finish. For part two, one of the 'small' caves may
optionally be visited twice in a path.

## Patterns used

* [Factory](https://en.wikipedia.org/wiki/Factory_pattern)

## Solution

Save the puzzle input as `input.txt` and execute

```bash
./path_finder.rb
```

The solution is a recursive algorithm where the number of paths from a cave to
the exit is the sum of the number of paths to the exit from each of the
available next caves. The available next caves depends on the passages defined
in the input, the type of the cave and whether the cave has already been
visited.

There are three types of cave;

* Small; May only be visited once. Optionally, a single small cave may be
  visited a second time in a path for part two.
* Big; May be visited multiple times.
* Terminus; Like a small cave but may only be visited once even in part two.

The [`CaveFactory`](lib/cave_factory.rb) chooses the correct class, each of
which provide corresponding implementations of the methods that are used by the
patch finder;

* `#available` returns `true` or `false` to indicate whether the cave can be
  visited. Big caves always return `true` while small and terminus caves may
  return `true` or `false`.
* `#options` returns an array of neighbouring caves that can be visited next.
  The `#available` method of neighbouring caves is used to prevent revisiting
  small caves.
* `#visit` marks the cave as being visited. For small caves the traveller is
  also updated to indicate if a small cave has been visited twice.
