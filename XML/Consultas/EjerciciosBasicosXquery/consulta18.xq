declare option output:indent "yes";
for $libro in //book
  where contains(lower-case($libro/title), "x")
  order by $libro/title descending
  return $libro
