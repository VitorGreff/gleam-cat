import gleam/int
import gleam/io
import gleam/list
import gleam/string
import simplifile.{read}

pub fn read_lines(path: String) -> List(String) {
  let file_content = read(path)
  case file_content {
    Ok(c) -> {
      c
      |> string.split("\n")
    }
    Error(_) -> []
  }
}

pub fn print_lines(lines: List(String)) -> Nil {
  lines
  |> list.map(fn(l) { io.println(l) })
  Nil
}

pub fn print_numbered_lines(lines: List(String)) -> Nil {
  lines
  |> list.fold(1, fn(i, l) {
    io.println(string.concat([int.to_string(i), " ", l]))
    i + 1
  })
  Nil
}

pub fn print_not_blank_lines(lines: List(String)) -> Nil {
  lines
  |> list.fold(1, fn(i, l) {
    case string.length(l) {
      0 -> {
        io.println("")
        i
      }
      _ -> {
        io.println(string.concat([int.to_string(i), " ", l]))
        i + 1
      }
    }
  })
  Nil
}
