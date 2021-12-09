# Day 1: Dive!

## Overview

The input for [Dive!](https://adventofcode.com/2021/day/2) contains a list of
command for driving the submarine. How the commands act differs between parts
one and two and the solution is the product of the final horizontal and vertial
position.

## Patterns used

* [Command](https://en.wikipedia.org/wiki/Command_pattern)

## Solution

Save the puzzle input as `input.txt` and execute

```bash
./drive.rb
```

The [`Driver`](lib/driver.rb) is created with the [submarine](lib/submarine.rb)
and a list of commands that are defined differently for
[part one](lib/command_one/) and [part two](lib/command_two/) to allow for the
different behaviour.

Each command defines its name as a constant, `Up::NAME`, `Down::NAME` and
`Forward::NAME`. These constants are used by the driver to build and index so
that commands can be called as;

```ruby
# Example input:
# forward 5
# down 5
# forward 8
# up 3
# down 8
# forward 2
driver.execute('forward', 5)
driver.execute('down', 5)
driver.execute('forward', 8)
driver.execute('up', 3)
driver.execute('down', 8)
driver.execute('forward', 2)
```

This allows the commands to be replaced with alternative implementations
without any alteration to the driver.
