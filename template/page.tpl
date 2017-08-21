<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/css/bootstrap.min.css" integrity="sha384-/Y6pD6FV/Vv2HJnA6t+vslU6fwYXjCFtcEpHbNJ0lyAFsXTsjBbfaDjzALeQsN6M" crossorigin="anonymous">
  </head>
  <body>
  <div class="row">
    <div class="col-md-4"><h2><span class="glyphicon glyphicon-book" aria-hidden="true"></span>Booklib</h2></div>
    <div class="col-lg-7">
      <form method="post">
        <div class="input-group">
          <input type="text" name="searchTerm" class="form-control" placeholder="Search for..." value="[@searchTerm]">
          <select class="form-control" name="sort">
            <option value="asc|price">Preis aufsteigend</option>
            <option value="desc|price">Preis absteigend</option>
            <option value="asc|publish_date">Veröffentlichung aufsteigend</option>
            <option value="desc|publish_date">Veröffentlichung absteigend</option>
          </select>
        </div>
      </form>
    </div>
    <div class="col-md-1"></div>
  </div>
    <div class="row">
      <div class="col-md-3"></div>
      <div class="col-md-8" id="table">[@table]</div>
      <div class="col-md-1"></div>
    </div>
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.11.0/umd/popper.min.js" integrity="sha384-b/U6ypiBEHpOf/4+1nzFpr53nxSS+GLCkfwBdFNTxtclqqenISfwAzpKaMNFNmj4" crossorigin="anonymous"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/js/bootstrap.min.js" integrity="sha384-h0AbiXch4ZDo7tp9hKZ4TsHbi047NrKGLO3SEJAg45jXxnGIfYzk4Si90RDIqNm1" crossorigin="anonymous"></script>
    <script src="./assets/pjax.js" />
    <script>
        $(document).on('submit', 'form[data-pjax]', function(event) {
          $.pjax.submit(event, '#table')
        })
    </script>
  </body>
</html>
