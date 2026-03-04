declare option output:indent "yes";
for $año in distinct-values(//book/year)
  return <año>{
    $año
  }</año>
