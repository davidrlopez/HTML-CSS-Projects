declare option output:indent "yes";
let $libros :=//book
return 
<total>
{sum($libros/price)}
</total>
