$( document ).ready(function() {

    console.log('quest.js loaded');

    $('.btn_questinfo').on('click',function(){
        let quest_uuid = $(this).data('quest');
        $('.questinfo_'+quest_uuid).slideToggle();
    });

});
