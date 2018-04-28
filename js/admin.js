$(document).ready(function(){
    $("#btn001").click(function(){
    	$("#002").hide();
        $("#001").show();
        $("#003").hide();
        $("#004").hide();
        $("#005").hide();
    });
    $("#btn002").click(function(){
    	$("#001").hide();
        $("#002").show();
        $("#003").hide();
        $("#004").hide();
        $("#005").hide();

    });
    $("#btn003").click(function(){
    	$("#001").hide();
    	$("#002").hide();
        $("#003").show();
        $("#004").hide();
        $("#005").hide();

    });
    $("#btn004").click(function(){
    	$("#001").hide();
    	$("#002").hide();
        $("#003").hide();
        $("#004").show();
        $("#005").hide();

    });
    $("#btn005").click(function(){
    	$("#001").hide();
    	$("#002").hide();
        $("#003").hide();
        $("#004").hide();
        $("#005").show();

    });
});