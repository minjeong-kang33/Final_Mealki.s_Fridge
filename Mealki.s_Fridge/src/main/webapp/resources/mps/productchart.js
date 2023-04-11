$(document).ready(function(){ 
	    				getGraph();

	      				function getGraph(){

	    	  			$.ajax({
	    		  			url:'/Mealki/chart/product',
	     		  			type:"GET",
	    		  			dataType:'json',
	    		  			success:function(arr){

	    			  		let nameList = [];
	        	  			let numList = [];

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
	                				'rgba(243, 121, 126, 1)',
	                				'rgba(125, 160, 250, 1)',
	                				'rgba(71, 71, 161, 1)',
	                				'rgba(218, 231, 255, 1)',
	                				'rgba(81, 79, 175, 1)'
	            						],
	            					borderColor: [
					                'rgba(243, 121, 126, 1)',
					                'rgba(125, 160, 250, 1)',
					                'rgba(71, 71, 161, 1)',
					                'rgba(218, 231, 255, 1)',
					                'rgba(81, 79, 175, 1)'
							            ],
							            borderWidth: 1
							        }]
							    },
	    			options: {
	    				 legend: {
      					  display: false
    							},
	    				  maintainAspectRatio: false,
	    				  reponsive: false,
	        			  scales: {
	        			  xAxes: [{
	      ticks: {
	        fontSize: 20 // X축 레이블 값의 글자 크기
	      }
	    }],
	            			 yAxes: [{
	                ticks: {
	                    fontSize: 15, // Y축 레이블 값의 글자 크기
	                    stepSize: 25,
	                    min: 0
	                }
	            }]
	        			}
	    			}
				});
			},

	    	  }); // ajax

	      } //  getGraph

	            }); //document.ready