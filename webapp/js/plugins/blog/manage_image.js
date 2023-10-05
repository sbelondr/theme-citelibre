function getImage( ){
   var fileType = $('#fileType').val();
   var file = $('#attachment').get(0).files[0];
   var idBlog = $('#id').val();
   var fileInfo={size: file.size, ext: file.type};
   var reader = new FileReader();
   reader.readAsDataURL(file);
   reader.onload = function () {
	  var rgx = /image/g;
	  var fileType = rgx.test( fileInfo.ext ) ? 1 : 2;
      doAddContent( file.name, fileInfo, reader.result, fileType, idBlog);
   };
   reader.onerror = function (error) {
     console.log('Error: ', error);
   };
}

function getCroppedCanva(fieldName){
	var fileType = $('#fileType').val();
	var idBlog = $('#id').val();
	var $element= $('.img-container' + fieldName + ' > img');
	result = $element.cropper('getCroppedCanvas', { width: "222", height:"555" });
	doAddContent( fieldName,{}, result.toDataURL(), fileType, idBlog );
};

function deleteImage(idContent){
  var idBlog = $('#id').val();
	doDeleteContent(idContent, idBlog);
	$(".blog-resources #doc_"+idContent).remove();
};

function doAddContent( fileName, fileInfo, result, fileType, idBlog ){
	var res='';
	$.ajax({
		url : baseUrl + "jsp/admin/plugins/blog/DoCreateImage.jsp?action=addContent",
		type: 'POST',
		dataType: "json",
		data: { fileContent:result, fileName:fileName, fileType:fileType, id:idBlog},
		async: false,
		cache:true,
		success:function(data){
		    if ( data.status == 'OK' ){
			  if( data.result == "BLOG_LOCKED" ){
				  alert( "Billet Verrouillé" );
			  } else {

          if ( fileType == 1 ){
            //$('#imagesrc' + data.result[0] ).val(result);
            $('#content-list').append('<li class="list-group-item blog-item-resource blog-image-content" id="doc_'+ data.result[1] +'"><img class="img-fluid img-thumbnail blog-thumbnails" src="servlet/plugins/blogs/file?id_file=' + data.result[1] + '" title="'+data.result[0]+'" alt="' + data.result[0] + '"><span class="pull-right"><button type="button" class="btn btn-link btn-xs btn-flat btn-down" title="Descendre" onclick="doUpdatePriorityContent(' + data.result[1] + ', \'moveDown\' )"><i class="fa fa-arrow-down"></i></button><button type="button" class="btn btn-link btn-xs btn-flat btn-up" title="Monter" onclick="doUpdatePriorityContent(' + data.result[1] +  ', \'moveUp\')"><i class="fa fa-arrow-up"></i></button></span></li>');
          } else {
            var fileSize = fileInfo.size;
            $('#content-list').append('<li class="list-group-item blog-item-resource blog-file-content" id="doc_'+data.result[1]+'"><p><a href=servlet/plugins/blogs/file?id_file='+data.result[1]+' alt="Download">'+ fileName + '<br><small>' + fileSize + ' Ko </small><span class="pull-right"><button type="button" class="btn btn-link btn-xs btn-flat btn-down" title="Descendre" onclick="doUpdatePriorityContent(' + data.result[1] + ', \'moveDown\' )"><i class="fa fa-arrow-down"></i></button><button type="button" class="btn btn-link btn-xs btn-flat btn-up" title="Monter" onclick="doUpdatePriorityContent(' + data.result[1] + ', \'moveUp\')"><i class="fa fa-arrow-up"></i></button></span></p></li>');
          }
          res = {location: 'servlet/plugins/blogs/file?id_file=' + data.result[1] };
			  }
			} else {
			  alert( "Echec" );
		   }
		},
		error: function(jqXHR, textStatus, errorThrown) {
			alert( "Error" );
		}
	});
	return res;
}

function doDeleteContent( idContent, idBlog ){
	$.ajax({
    url : baseUrl + "jsp/admin/plugins/blog/DoDeleteImage.jsp?action=removeContent&idContent=" + idContent +"&id="+ idBlog ,
  	type: 'GET',
    dataType: "json",
  	data: {},
    async: false,
  	cache:false,
  	success:function(data) {
	  	if ( data.status == 'OK' )
			{
	  		if(data.result == "BLOG_LOCKED"){
  				alert( "Billet Verrouillé" );
  			}

	  	} else	{
				alert("echec")
			}
		},
  	error: function(jqXHR, textStatus, errorThrown) {
			alert("error : " + textStatus + errorThrown )
    }
	});
}

function doUpdateContentType( idContent, idTypeContent){
	var idBlog = $('#id').val();
	updateContentType( idContent, idTypeContent, idBlog);
}

function updateContentType( idContent, idTypeContent, idBlog){
    $.ajax({
    url : baseUrl + "jsp/admin/plugins/blog/DoUpdateContentType.jsp?action=updateContentType",
    type: 'POST',
    dataType: "json",
    data: {idType:idTypeContent, idContent:idContent, id:idBlog},
    async: false,
    cache:true,
    success:function(data) {
  	if ( data.status == 'OK' )
		{
  		if(data.result == "BLOG_LOCKED"){
				alert( "Billet Verrouillé" );
		}
    	}	else	{
				alert( "Echec" );
			}
		},
  	error: function(jqXHR, textStatus, errorThrown) {
			alert( "Error" );
    }
	});
}


function doUpdatePriorityContent( idContent, action )
{
	var idBlog = $('#id').val();
	updatePriorityContent( idContent, action, idBlog );
}

function updatePriorityContent( idContent, action, idBlog )
{
	$.ajax({
    url : baseUrl + "jsp/admin/plugins/blog/DoUpdatePriorityContent.jsp?contentAction="+action+"&idContent="+idContent+ "&id="+idBlog,
    type: 'GET',
    dataType: "json",
    data: {},
    async: false,
    cache:false,
    success:function(data) {
  	if ( data.status == 'OK' )
  		{
  			if( data.result == "BLOG_LOCKED" ){
				alert( "Billet Verrouillé" );
			}else if( action == "moveUp" ){
				$('#doc_' + data.result ).insertAfter( $('#doc_' + idContent) );
			} else if( action == "moveDown" ){
				$('#doc_' + idContent ).insertAfter( $('#doc_' + data.result) );
			}
  	}
  	else
		{
		alert("echec")
		}
	},
  error: function(jqXHR, textStatus, errorThrown) {
	alert("error")
  }
});
}