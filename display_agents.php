<!DOCTYPE html>
<html>
    <head>
        <h1>Agent Information</h1>
        <style type = "text/css">
         body  { font-family: sans-serif;
                 background-color: lightblue; } 
         table { background-color: pink; 
                 border-collapse: collapse; 
                 border: 1px solid gray; }
         td    { padding: 5px; }
         tr:nth-child(odd) {
                 background-color: white; }
      </style>
    </head>
    <body>
        <?php
            $query = "SELECT * FROM Agent";
            if ( !( $database = mysqli_connect( "localhost", "root", "" ) ) )
                die("Could not connect to database </body></html>");
            if(!mysqli_select_db($database, "Real_Estate"))
                die("Could not open real estate database </body></html>");
            if(!($result = mysqli_query($database, $query))){
                print("<p>Could not execute query</p>");
                die(mysql_error() . "</body></html>");
            }
            mysqli_close($database);

            ?>
            <table>
                <?php
                    while($row = mysqli_fetch_row($result)){
                        print("<tr>");
                        foreach($row as $value)
                            print("<td>$value</td>");
                        print("</tr>");
                    }
                ?>
            </table>
    </body>
</html>

