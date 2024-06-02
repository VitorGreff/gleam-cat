import filehandler/file.{print_lines, read_lines}

pub fn main() {
  let lines = read_lines("input/test.txt")
  print_lines(lines)
}
