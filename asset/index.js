define([], function () {
    return {
        init: function ($mod) {
            var $f=$('form',$mod).on('submit',function(){
                console.log('form submit')
                return false;
            });
        }
    }
})
