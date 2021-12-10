# Day 10: Syntax Scoring

## Overview

The inputs for [Syntax Scoring](https://adventofcode.com/2021/day/1) are a list
of patterns of nested brackets of different types. The nesting is broken in two
ways; unmatched terminating brackets and unterminated brackets. The challenge is
to identify the errors.

## Patterns used

* [Composite](https://en.wikipedia.org/wiki/Composite_pattern)

## Solution

Save the puzzle input as `input.txt` and execute

```bash
./parse.rb
```

The Composite pattern is a structural pattern that builds a tree of objects that
can be teated as if it were a single object. Nodes in the tree can either be
leaf nodes or composite nodes, which have one or more child nodes that may in
turn be leaf or composte.

In this puzzle the common interface of the nodes is

| Method | Leaf | Composite |
|---|---|---|
| `corrupt_score` | Part 1 score for this node | The first non-nul part 1 score of this nodes subnodes, or the score of this node |
| `completer_string` | Terminating bracket for this node, if it is missing | Concatination of the completer strings for all subnodes plus the terminating bracked for this node, if it is missing |

As well as the [`Leaf`](lib/leaf.rb) and [`Compound`](lib/compound.rb) nodes
there is also a [`Wrapper`](lib/wrapper.rb) node that acts as a `Compound` node
except that it has no brackets of its own. This is used for the very top level
node.
