declare option output:indent "yes";
<libros>
{
for $precio in //book
  return $precio/price
}
{
  let $libros :=//book/price
  return <total>{sum($libros)}</total>
}
</libros>
