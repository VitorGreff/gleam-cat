import argv
import filehandler/file.{
  print_lines, print_not_blank_lines, print_numbered_lines, read_lines,
}
import gleam/list

pub fn main() {
  case argv.load().arguments {
    [] -> panic as "No filepaths provided."
    ["n", ..filepaths] -> {
      let lines = list.flat_map(filepaths, read_lines)
      print_numbered_lines(lines)
    }
    ["b", ..filepaths] -> {
      let lines = list.flat_map(filepaths, read_lines)
      print_not_blank_lines(lines)
    }
    filepaths -> {
      let lines = list.flat_map(filepaths, read_lines)
      print_lines(lines)
    }
  }
}
