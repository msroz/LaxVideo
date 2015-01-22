$(function(){
console.log('image.js loaded');
    $('#video-file').change(function(e){
        console.log('file change event started');

        var files = e.target.files;
        var file = files[0];
        console.log(file);

        var reader = new FileReader();
        reader.onload = function(e) {
            var base64 = e.target.result.split(',')[1];
            $.ajax({
                  type: 'POST',
                  url: "/image/upload",
                  dataType: "json",
                  data: {
                      base64: base64,
                      type: file.type,
                  },
                  success: function(responseData) {
                     console.log('success');
                     console.log(responseData);
                     $('#video-result-image').attr('src', e.target.result);
                     $('#video-form-base64').val(responseData.base64);
                     $('#video-form-title').val(responseData.message);
                  },
            });
        };
        reader.readAsDataURL(file);
    });
});
