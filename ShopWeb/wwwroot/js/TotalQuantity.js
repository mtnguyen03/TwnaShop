
$(() => {
    LoadProdQuantity();
    var connection = new signalR.HubConnectionBuilder().withUrl("/signalrServer").build();

    connection.start();
    connection.on("LoadProductsQuantity", function () {
        LoadProdQuantity();
    })

    LoadProdQuantity();
    function LoadProdQuantity() {
        $.ajax({
            url: '/Admin/SignalR/GetprodQuantity',
            method: 'GET',
            success: function (result) {
            
                $("#prodquan").html(result.productQuantity); 
                $("#totalAcc").html(result.totalAcc); 
                $("#totalRevenue").html(new Intl.NumberFormat('vi-VN', { style: 'decimal' }).format(result.salesStatistics.totalRevenue) + ' VND');
                $("#totalOrders").html(result.salesStatistics.totalOrders); 
                $("#successfulOrders").html(result.salesStatistics.successfulOrders); 
                $("#pendingOrders").html(result.salesStatistics.pendingOrders); 
                $("#cancelledOrders").html(result.salesStatistics.cancelledOrders); 
                $("#returnedOrders").html(result.salesStatistics.returnedOrders); 
                $("#disputedOrders").html(result.salesStatistics.disputedOrders); 
                $("#dongdangyeuCauTra").html(result.salesStatistics.dangYeuCautra); 
                $("#donDangyeyCauGiaiQuyet").html(result.salesStatistics.dangYeuCauGiaiQuyet); 

            },
            error: (error) => {
                console.log(error)
            }
        });
    }
})
