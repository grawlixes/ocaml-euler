# Project Euler in OCaml

Trying to take advantage of pretty functional patterns to make non-ugly solutions to the problems on [Project Euler](https://projecteuler.net/).

At the time I'm writing this, my exposure to to OCaml is zero, and my experience with purely functional programming languages (read: Haskell) is minimal. I'll undoubtedly be referring to [this repository of solutions and useful functions](https://github.com/bcc32/projecteuler-ocaml) from fellow AoC participant and OCaml contributor, `bcc32`, to compensate for that.

I have solved roughly 80 PE problems with Python before this, but I will be starting from scratch here.

# How to run solutions

I use dune. To execute problem number <X>:

`dune exec src/<X>/main.exe`

This is a little bit cumbersome, so I'll find a way to make it more concise.
