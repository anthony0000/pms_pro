<!DOCTYPE html>
<html lang="en" dir="ltr">
  <head>
    <meta charset="utf-8">
    <title>Add New Medicine</title>
    <link rel="stylesheet" href="bootstrap/css/bootstrap.min.css">
		<script src="bootstrap/js/jquery.min.js"></script>
		<script src="bootstrap/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.3.1/css/all.css" integrity="sha384-mzrmE5qonljUremFsqc01SB46JvROS7bZs3IO2EmfFsd15uHvIt+Y8vEf7N7fWAU" crossorigin="anonymous">
    <link rel="shortcut icon" href="images/icon.svg" type="image/x-icon">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="css/sidenav.css">
    <link rel="stylesheet" href="css/home.css">
    <script src="js/suggestions.js"></script>
    <script src="js/validateForm.js"></script>
    <script src="js/restrict.js"></script>
  </head>
  <body>
    <div id="add_new_supplier_model">
      <div class="modal-dialog">
      	<div class="modal-content">
      		<div class="modal-header" style="background-color: #ff5252; color: white">
            <div class="font-weight-bold">Add New Supplier</div>
      			<button class="close" style="outline: none;" onclick="document.getElementById('add_new_supplier_model').style.display = 'none';"><i class="fa fa-close"></i></button>
      		</div>
      		<div class="modal-body">
            <?php
              include('sections/add_new_supplier.html');
            ?>
      		</div>
      	</div>
      </div>
    </div>
    <!-- including side navigations -->
    <?php include("sections/sidenav.html"); ?>

    <div class="container-fluid">
      <div class="container">

        <!-- header section -->
        <?php
            require "php/header.php";
            createHeader('shopping-bag', 'Add Medicine Stock', 'New Medicine Stock');
        ?>
        <!-- header section end -->

        <!-- form content -->
        <?php
            require "sections/add_new_medicine_stock.html";
        ?>
        <hr style="border-top: 2px solid #ff5252;">
        <!-- form content end -->
      </div>
    </div>
  </body>
</html>
<script src="js/manage_medicine_stock.js"></script>
<script src="js/manage_medicine.js"></script>
<script>
    // load lists of medicines
    listMedicine();
    $('#loadStockData').on('change',function(){
        var stockload = $(this);
        var name_drug = $('#name_drug');
        var id= stockload.val();
        $.ajax({
            url:"php/manage_medicine_stock.php",
            type : 'GET',
            cache: true,
            data : {action:"fetch",id:id},
            datatype: 'json',
            success : function(data){
                var convData = JSON.parse(data);
                name_drug.val(convData.NAME);
            }
        });
    })
    // calculate rate & qty
    function CalcTotalStockCost(rate,qty){
        var totalled = rate*qty;
        $('#totalStock').val(totalled);
    }
    $('#rateStock').on('keyup',function(){
        var rate = $(this).val();
        var qty = $('#qtyStock').val();
        CalcTotalStockCost(rate,qty);
    })
    $('#qtyStock').on('keyup',function(){
        var rate = $('#rateStock').val();
        var qty = $(this).val();
        CalcTotalStockCost(rate,qty);
    })
    $('#add_stock').on('submit',function(e){
        e.preventDefault();
        $.ajax({
            url:"php/manage_medicine_stock.php?action=create",
            type : 'GET',
            cache: true,
            data : $('#add_stock').serialize(),
            dataType: 'html',
            success : function(e){
                $('#medicine_acknowledgement').html(e);
            }
        })
    })
</script>