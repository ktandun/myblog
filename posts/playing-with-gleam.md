---
title: "Playing with Gleam"
author: "Kenzie Tandun"
---

Haskell was my first introduction to programming, this was taught in university and as a first year student I was really confused with the language. Many year after that I have worked on many different languages, mostly OOP like Java, python and C#. I really liked how simple python was, how easy to work with C# and Java was just meh. The thought of functional programming was always at the back of my head, but whenever I look at the syntax of it, it looks so scary, where are the brackets?? I tried F#, Elixir and Clojure. The last two I'm not a fan of just because it is not statically typed. I stumbled across Gleam when it released its version 1.0 but never thought about it until last week when I saw this video by [Hayleigh Thompson](https://www.youtube.com/watch?v=3lYHFctx2Ks&t=557s&pp=ygUQaGF5bGVpZ2ggcGhhbnRvbQ%3D%3D). This is when I got hooked to the language.

Gleam is a really cool language, it is really readable and the syntax feels familiar when you are coming from OOP background. Comparing it to F# or Elixir, it does not feel like a "functional" "nerdy" language. Compare the syntax below:

```fsharp
// F#
open System

let from whom =
    sprintf "from %s" whom

let main argv =
    let message = from "F#"
    printfn "Hello world %s" message
```

```gleam
// Gleam
import gleam/io

pub fn main() {
    io.println("Hello, Joe!")
}
```

Isn't Gleam just way easier to read? The brackets after function names and curly braces to wrap the function body just feels comfy.

Gleam does not have concept of exceptions, so we have to handle errors as they come. This is done by using `Result` types. Result types consists of two states, `Ok` and `Error`. It is handled like so:

```gleam
let result = function_that_returns_result()

case result {
    Ok(res) -> do_something()
    Error(err) -> handle_error()
}
```

If we have multiple functions that returns Result type, the `gleam/result` lib has a helper `try` which can be used to chain them. In the example below, the functions will only proceed if the responses are `Ok` otherwise it will short-circuit immediately. This concept is also known as [Railway Oriented Programming](https://fsharpforfunandprofit.com/rop/).

```gleam
use value1 <- result.try(function_that_returns_result())
use value2 <- result.try(another_function_that_returns_result(value1))
```

I have been writing Gleam for a week or so now and it feels really nice. The tooling is quite mature relative to how young the language is and it integrates well with neovim. Definitely give it a go if you want to learn functional programming! [Gleam Website](https://gleam.run/)
