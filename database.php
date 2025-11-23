<!DOCTYPE html>
<html>
    <head>
      <meta charset = "utf-8">
      <title>Search Results</title>
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
                $query = $_POST["query"];
                if ( !( $database = mysqli_connect( "localhost",
                "root", "" ) ) )                      
                    die( "Could not connect to database </body></html>" );
                if ( !mysqli_select_db($database, "Real_Estate" ) )
                    die( "Could not open real estate database </body></html>" );
                if ( !( $result = mysqli_query( $database, $query ) ) ) 
                {
                    print( "<p>Could not execute query</p>" );
                    die( mysql_error() . "</body></html>" );
                }
                mysqli_close($database);
            ?>
            <table>
                <caption>Results of <?php print("$query") ?></caption>
                <?php
                    if($result instanceof mysqli_result){
                        while($row = mysqli_fetch_row($result)){
                            print("<tr>");
                            foreach($row as $value)
                                print("<td>$value</td>");
                            print("<tr>");
                        } 
                    }
                    else if($result === true){
                        print("<p>$result</p>");
                    }
                    else{
                        print("<p>Query failed</p>");
                    }
                ?>
            </table>
   </body>
</html>