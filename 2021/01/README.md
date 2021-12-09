# Day 1: Sonar Sweep

## Overview

[Sonar Sweep](https://adventofcode.com/2021/day/1) presents a series of numbers
and the puzzle is to calculate a measure of how often the numbers increase.

In part one the measure is simply a count of how many numbers are greater than
the previous. Part two is the same except that the numbers must first be summed
in a sliding window of three, so the first comparison is between the sum of
numbers one, two and three in the sequence with the sum of numbers two, three
and four.

## Patterns used

* [Strategy](https://en.wikipedia.org/wiki/Strategy_pattern)

## Solution

Two classes are used in each part of the solution;

* [`Compare`](lib/compare.rb) tallies the number of increments in the sequence.
* A grouping **strategy** that is passed to `Compare.new` to determine what
  pairs of numbers are used in the comparison.
  * [`SimpleGroup`](lib/simple_group.rb) is an enumerable that yields pairs of
    numbers as `[n0, n1]`, `[n1, n2]`, etc.
  * [`MultiGroup`](lib/simple_group.rb) is an enumerable that yields pairs of
    numbers as `[n0 + n1 + n2, n1 + n2 + n3]`, `[n1 + n2 + n3, n2 + n3 + n4]`,
    etc.

`Compare` is unaware of how the numbers are paired for comparison and so either
strategy, or any other that may be created in the future, can be used
interchageably. The solutions are;

* Part 1; `Compare.new( SimpleGroup.new(data) ).sum`
* Part 2; `Compare.new( MultiGroup.new(data) ).sum`
