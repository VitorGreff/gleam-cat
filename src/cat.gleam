import argv
import filehandler/file.{
  print_lines, print_not_blank_lines, print_numbered_lines, read_lines,
}
import gleam/list

pub fn main() {
  case argv.load().arguments {
    [] -> panic as "No filepaths provided."
    ["n", ..filepaths] -> {
      filepaths
      |> list.each(numbered_option)
    }
    ["b", ..filepaths] -> {
      filepaths
      |> list.each(blank_option)
    }
    filepaths -> {
      filepaths
      |> list.each(normal_option)
    }
  }
}

fn numbered_option(path: String) {
  read_lines(path)
  |> print_numbered_lines()
}

fn blank_option(path: String) {
  read_lines(path)
  |> print_not_blank_lines()
}

fn normal_option(path: String) {
  read_lines(path)
  |> print_lines()
}
