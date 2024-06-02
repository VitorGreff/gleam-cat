# cat

```sh
gleam add cat
```

## Available Commands
```bash
gleam run <filepath/s> # outputs files 
gleam run n <filepath/s> # outputs files with line numbers
gleam run b <filepath/s> # outputs files with line numbers ignoring blank lines
```

## Development
```sh
gleam run   # Run the project
gleam test  # Run the tests
gleam shell # Run an Erlang shell
```

Currently, this project does not support stdin data. I didnt find any convenient way to read from the standard input but maybe, in the future, I'd look foward to adapt some erlang code to do so.
