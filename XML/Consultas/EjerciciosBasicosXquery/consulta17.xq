declare option output:indent "yes";
for $libro in //book
  where starts-with($libro/@category, "C")
  return $libro
