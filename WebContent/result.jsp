<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<meta charset="utf-8">
        <script src='https://cdn.bootcss.com/echarts/3.7.0/echarts.simple.js'></script>
        <script src='js/echarts-wordcloud.js'></script>
 <script src="js/jquery-1.8.2.js"></script>js
  <script type="text/javascript">
function getResult()
  {
      //alert(dataURL);
	//http://192.168.153.128:8080/CJHadoopOnline/hadoop/wordcountResult
      $.ajax({
          type: "POST",
          url:"hadoop/wordcountResult",
          async:false,
          success:function(map){
            alert(map);
           
            var jsonobj=eval('('+map+')');
            
            var keys = new Array();
            var values = new Array();
            for(var key in jsonobj)
            	{
            	keys.push(key);
            	values.push(jsonobj[key]);
            	//alert(key);
            	}
   				
           
            
            var myChart = echarts.init(document.getElementById('main'));
         // 显示标题，图例和空的坐标轴
         myChart.setOption({
             title: {
                 text: 'Hadoop处理的词频统计'
             },
             tooltip: {},
             legend: {
                 data:['出现次数']
             },
             xAxis: {
                 data: []
             },
             yAxis: {},
             series: [{
                 name: '出现次数',
                 type: 'bar',
                 data: []
             }]
         });
            
         myChart.setOption({
             xAxis: {
                 data: keys
             },
             series: [{
                 // 根据名字对应到相应的系列
                 name: '出现次数',
                 data: values
             }]
         });
            
            
          }
      });
  }
</script>

</head>
<body>
	<Button onclick="getResult()" >查询结果</Button>
	 <style>
            html, body, #main {
                width: 100%;
                height: 100%;
                margin: 0;
            }
        </style>
        <div id='main'></div>
	
	
</body>
</html>