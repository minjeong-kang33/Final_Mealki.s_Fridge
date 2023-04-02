$(document).ready(function(){ 
    				getGraph();
    	
      				function getGraph(){
       	 	 	
    	  			$.ajax({
    		  			url:'/Mealki/chart/contract',
//     		  			type:"GET",
    		  			dataType:'json',
    		  			success:function(arr){
    			  		console.log("이달의수주왕 성공");
    			  		console.log(arr);
    			  		
    			  		let nameList = [];
        	  			let numList = [];
    			  		
    			 		 // 그래프로 나타낼 자료 리스트에 담기
    			  		for (let i = 0; i<arr.length;i++){
								nameList.push(arr[i].name);    				  
								numList.push(arr[i].num);    				  
    			  					}
				const ctx = document.getElementById('myChart').getContext('2d');
				const myChart = new Chart(ctx, {
    							type: 'bar',
    							data: {
        						labels: nameList,
        						datasets: [{
            					data: numList,
           				 		backgroundColor: [
                				'rgba(255, 99, 132, 0.2)',
                				'rgba(54, 162, 235, 0.2)',
                				'rgba(255, 206, 86, 0.2)',
                				'rgba(75, 192, 192, 0.2)',
                				'rgba(153, 102, 255, 0.2)',
                				'rgba(255, 159, 64, 0.2)'
            						],
            					borderColor: [
				                'rgba(255, 99, 132, 1)',
				                'rgba(54, 162, 235, 1)',
				                'rgba(255, 206, 86, 1)',
				                'rgba(75, 192, 192, 1)',
				                'rgba(153, 102, 255, 1)',
				                'rgba(255, 159, 64, 1)'
						            ],
						            borderWidth: 1
						        }]
						    },
    			options: {
        			scales: {
            			y: {
            				min: 0
            			}
        			}
    			}
			});
		},
    		  error:function(){
    			  console.log("이달의수주왕 실패");
    		  },
    		  complete: function() {
    			    console.log("이달의수주왕 완료");
    			  }
	     		  
    	  }); // ajax
    	
      } //  getGraph
 
            }); //document.ready
           