define(['oxjs'], function (OXJS) {
    return {
        init: function ($mod) {
            var f=$('form',$mod).on('submit',function(){
                var param=OXJS.formToJSON(f);
                console.log('form submit',param);

                OXJS.dbtool({
                    dsname:'pay',
                    method:'insert',
                    data:param
                },function(r){
                    console.log(r);
                });
                return false;
            })[0];


        }
    }
})
