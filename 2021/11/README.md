# Day 11: Dumbo Octopus

## Overview

The input for [Dumbo Octopus](https://adventofcode.com/2021/day/11) is a single
10x10 grid of digits representing 100 octopuses. The challenge is to modify
these according to a given set of rules and then count how many times a flash
occurs for part one or count the number of turns for part two.

## Patterns used

* [Observer](https://en.wikipedia.org/wiki/Observer_pattern)

## Solution

Save the puzzle input as `input.txt` and execute

```bash
./flash.rb
```

The Observer pattern is used twice; firstly for the
[`Conductor`](lib/conductor.rb) to control each [`Octopus`](lib/octopus.rb) and
then for each octopus to react to the flashes of their neighbours. The setup
creates the 100 octopuses and attaches them as observers to each of their
neighbours as well as to the conductor.

The `Octopus` class has three methods to control its behaviour;

* `energize`; This increments the energy and is called both by the conductor on
  each turn and also by the neighbouring octopuses when they flash.
* `flash`; This tests if the octopus flashes and marks it as flashed
  accordingly. It also calls `energize` on all of its observers.
* `unflash`; This resets the energy and marks the octopus as not flashed.

The `Conductor` class then does the following on each step;

```
energize all observers
flash all observers
  repeat until no more flashes occur
unflash all observers
```
