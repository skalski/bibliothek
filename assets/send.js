$("#book").submit(function(e) {

    var url = "add.php";

    $.ajax({
           type: "POST",
           url: url,
           data: $("#book").serialize(),
           success: function(data)
           {
               alert(data);
           }
         });

    e.preventDefault();
});
