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
        
    
        
        
 <script src="js/jquery-1.8.2.js"></script>
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
            var items = new Array();
            for(var key in jsonobj)
            	{
            	var item = new Object(); 
            	item.name = key;
            	item.value = jsonobj[key];
        
            	keys.push(key);
            	values.push(jsonobj[key]);
            	items.push(item);
            	//alert(key);
            	}
   				
            var chart = echarts.init(document.getElementById('main'));

            var option = {
                tooltip: {},
                series: [ {
                    type: 'wordCloud',
                    gridSize: 2,
                    sizeRange: [12, 50],
                    rotationRange: [-90, 90],
                    shape: 'pentagon',
                    width: 600,
                    height: 400,
                    drawOutOfBound: true,
                    textStyle: {
                        normal: {
                            color: function () {
                                return 'rgb(' + [
                                    Math.round(Math.random() * 160),
                                    Math.round(Math.random() * 160),
                                    Math.round(Math.random() * 160)
                                ].join(',') + ')';
                            }
                        },
                        emphasis: {
                            shadowBlur: 10,
                            shadowColor: '#333'
                        }
                    },
                    
                    data:items
                    /*
                     data: [
                        {
                            name: '词云',
                            value: 10000,
                            textStyle: {
                                normal: {
                                    color: 'black'
                                },
                                emphasis: {
                                    color: 'red'
                                }
                            }
                        },
                        {
                            name: '云计算',
                            value: 555
                        },
                        {
                            name: '人工智能',
                            value: 550
                        }
                    ]
                    */
                   
                } ]
            };

            chart.setOption(option);
            window.onresize = chart.resize;
            
            
            
         
            
            
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