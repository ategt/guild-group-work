/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
tinymce.init({
    selector: 'textarea',
    height: 500,
    theme: 'modern',
    plugins: [
        'advlist autolink lists link image charmap print preview hr anchor pagebreak',
        'searchreplace wordcount visualblocks visualchars code fullscreen',
        'insertdatetime media nonbreaking save table contextmenu directionality',
        'emoticons template paste textcolor colorpicker textpattern imagetools jbimages'
    ],
    toolbar1: 'insertfile undo redo | styleselect | bold italic | alignleft aligncenter alignright alignjustify | bullist numlist outdent indent | link',
    toolbar2: 'print preview media | forecolor backcolor emoticons',
    image_advtab: true,
    relative_urls: false,
    templates: [
        {title: 'Test template 1', content: 'Test 1'},
        {title: 'Test template 2', content: 'Test 2'}
    ],
    content_css: [
        'http://fast.fonts.net/cssapi/e6dc9b99-64fe-4292-ad98-6974f93cd2a2.css',
        'http://www.tinymce.com/css/codepen.min.css'
    ]
});


