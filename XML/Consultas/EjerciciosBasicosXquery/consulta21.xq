declare option output:indent "yes";
for $autor in distinct-values(//book/author)
  order by string-length($autor)
  return <autor>
  {
    $autor
  }</autor>
