import gleam/int
import gleam/io
import gleam/list
import gleam/string
import simplifile.{read}

pub fn read_lines(path: String) -> List(String) {
  let file_content = read(path)
  let lines = case file_content {
    Ok(c) -> {
      c
      |> string.split("\n")
      |> list.reverse()
      |> list.drop(1)
      |> list.reverse()
    }
    Error(_) -> []
  }
  lines
}

pub fn print_lines(lines: List(String)) -> Nil {
  list.map(lines, fn(l) { io.println(l) })
  Nil
}

pub fn print_numbered_lines(lines: List(String)) -> Nil {
  list.fold(lines, 1, fn(i, l) {
    io.println(string.concat([int.to_string(i), " ", l]))
    i + 1
  })
  Nil
}

pub fn print_not_blank_lines(lines: List(String)) -> Nil {
  let _ =
    list.fold(lines, 1, fn(i, l) {
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
