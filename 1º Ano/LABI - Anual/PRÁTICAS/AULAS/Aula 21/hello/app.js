function refresh(){
	$.get("/time",function(response){vartext="<h2>"+response.date+"</h2><br /><h2>"+response.time+"</h2>";
	$("#clock").html(text);
	});
}
$( document ).ready(function() {
	$("#refresh").on("click",refresh);
});
