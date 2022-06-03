<cfparam name="inputValue" default="">
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Document</title>
        <link href="./css/bootstrap.min.css" rel="stylesheet">
    </head>
    <body>
        <div class="container">
            <div class="row">
                <h2>Insert Data</h2> 
                <form name="form" method="post" action="component/upload.cfc?method=uploadData" enctype="multipart/form-data"> 
                    <div class="form-group col-md-4">
                        <label>Row Count</label>
                        <input type="text" name="inputValue" class="form-control" > 
                    </div><br>
                     <div class="form-group col-md-4">
                        <label>Upload File</label>
                        <input type="file" name="inputFile" class="form-control" > 
                    </div><br>
                    <div class="form-group col-md-4"> 
                        <label></label> 
                        <input type="Submit" class="btn btn-success" value="Submit" name="formSubmit">
                    </div> 
                </form> 
                <cfoutput>
                    
                </cfoutput>
            </div>
        </div>
    </body> 
</html>