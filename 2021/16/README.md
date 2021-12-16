# Day 16: Packet Decoder

## Overview

The input for [Packet Decoder](https://adventofcode.com/2021/day/16) is a
hexidecimal string that needs to be converted to binary and then processed
according to a set of rules to turn it into a hierachical structure of packets.
Some of these packets are literal integer values while others are operations on
their children.

## Patterns used

* [Strategy](https://en.wikipedia.org/wiki/Strategy_pattern)
* [Composite](https://en.wikipedia.org/wiki/Composite_pattern)

## Solution

Save the puzzle input as `input.txt` and execute

```bash
./decode.rb
```

There are [two strategies](lib/packets_strategies) that the operator packets
use to create their child packets, depending on whether they are a type 11 or
type 15 operator.

All the packets are arranged using a composite pattern, so that the combined
version and value can be calculated by calling `version` and `value` on the top
node.
The strategy pattern
