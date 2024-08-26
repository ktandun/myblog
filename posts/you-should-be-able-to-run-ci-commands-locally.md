---
title: "You should be able to run CI commands locally"
---

I have worked for some years as a software developer and I noticed a reccuring pattern.
The commands in the CI pipeline is not easy or intuitive to run locally.
This makes it harder to check whether things will succeed in pipeline, even more annoying when the pipeline sometimes takes upwards of 10+ minutes or even an hour to complete.
With all the available tools we have nowadays, pipeline commands should be contained in a script or even better a [justfile](https://github.com/casey/just).

Compare the small example below:

```
# without justfile

jobs:
  test:
    runs-on: self-hosted
    steps:
      - uses: actions/checkout@v4

      - run: dbmate drop && dbmate up
        working-directory: ./backend

      - run: gleam deps download
        working-directory: ./backend

      - run: gleam build
        working-directory: ./backend

      - run: gleam test
        working-directory: ./backend
```

```
# all the logic is wrapped inside justfile

jobs:
  test:
    runs-on: self-hosted
    steps:
      - uses: actions/checkout@v4

      - run: just test-ci
```

When something goes wrong and you need to debug it locally, it is waaay easier to just run `just test-ci` instead of copy and pasting commands from your yml file.

/rant
