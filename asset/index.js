define(['oxjs'], function (OXJS) {
    return {
        init: function ($mod) {
            var payurl = $mod.attr('data-payurl');

            var syncAction = function () {
                if(f.paymethod) {
                    var paymethod = f.paymethod.value;
                    if (!paymethod) {
                        f.paymethod[0].checked = true;
                    }
                    paymethod = f.paymethod.value;
                    //console.log('ssss',paymethod);
                    f.action = payurl.replace(/\{paymethod\}/g, paymethod);
                }else{
                    $mod.html('<h3 class="error">无相应的支付方式</h3>')
                }

            };
            var f = $('form', $mod).on('change', syncAction)[0];



            syncAction();


        }
    }
})
