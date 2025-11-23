<!DOCTYPE html>
<html>    
    <head>
        <h1>Business Search Results</h1>
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
            $min_price  = $_POST['min_price'] ?? null;
            $max_price  = $_POST['max_price'] ?? null;
            $min_size   = $_POST['min_size'] ?? null;
            $max_size   = $_POST['max_size'] ?? null;

            $query = "
            SELECT 
                Listings.mlsNumber,
                Property.address,
                Property.ownerName,
                Property.price,
                BusinessProperty.type,
                BusinessProperty.size,
                Agent.name AS agentName,
                Agent.phone AS agentPhone,
                Listings.dateListed
                FROM Listings
                JOIN Property ON Listings.address = Property.address
                JOIN BusinessProperty ON Listings.address = BusinessProperty.address
                JOIN Agent ON Listings.agentId = Agent.agentId
                WHERE 1 = 1
            ";

            if (!empty($min_price)) {
                $query .= "AND price >= " . intval($min_price);
            }

            if (!empty($max_price)) {
                $query .= " AND price <= "  . intval($max_price);
                
            }

            if (!empty($min_size)) {
                $query .= " AND size >= " . intval($min_size);
            }

            if (!empty($max_size)) {
                $query .= " AND size <= " . intval($max_size);
            }
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
        <tr>
            <th>MLS #</th>
            <th>Address</th>
            <th>Owner</th>
            <th>Price</th>
            <th>Type</th>
            <th>Size (sqft)</th>
            <th>Agent Name</th>
            <th>Agent Phone</th>
            <th>Date Listed</th>
        </tr>

        <?php
            while ($row = mysqli_fetch_row($result)) {
            print("<tr>");
            foreach ($row as $value)
                print("<td>$value</td>");
            print("</tr>");
            }
        ?>
     </table>

     <p>Your search yielded 
        <?php print(mysqli_num_rows($result)); ?> results.
     </p>

    </body>
</html>