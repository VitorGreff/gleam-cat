import gleam/io
import gleam/list
import gleam/string
import simplifile.{read}

pub fn read_lines(path: String) -> List(String) {
  let file_content = read(path)
  let lines = case file_content {
    Ok(c) -> {
      string.replace(c, "\"", "")
      |> string.split("\n")
      |> list.reverse()
      |> list.drop(1)
      |> list.reverse()
    }
    Error(_) -> panic as "Error reading file"
  }
  lines
}

pub fn print_lines(lines: List(String)) {
  list.map(lines, fn(l) { io.debug(l) })
}
