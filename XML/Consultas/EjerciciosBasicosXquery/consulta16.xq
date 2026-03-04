declare option output:indent "yes";
for $libro in //book
  where ends-with($libro/year, "3")
  return $libro
