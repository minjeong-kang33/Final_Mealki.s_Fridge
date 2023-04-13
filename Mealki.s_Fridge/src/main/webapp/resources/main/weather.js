function loadJSON(callback){

	var url = "https://api.openweathermap.org/data/2.5/weather?lat=35.1028&lon=129.0403&appid=d16297588a3864a1c944d0fb394e2423"

	var request = new XMLHttpRequest();
	request.overrideMimeType("application/json");
    request.open('GET', url, true);
    
    request.onreadystatechange = function() {
        if (request.readyState === 4 && request.status === 200) {
        	var jsonData = JSON.parse(request.responseText);
            callback(jsonData);
        }
    };
    request.send(null);
}

function parseWeather(jsonData){
	 var weatherMain = jsonData["weather"][0]["main"];
	 var weatherTemp = (jsonData["main"]["temp"] - 273.15).toFixed(1);
	 document.getElementById("todaysTemp").innerHTML = weatherTemp + "℃";
	 
	 var iconClass = "icon-cloud mr-3"; // 기본값 흐림
	 if (weatherMain === "Clear") {
	     iconClass = "icon-sun mr-3"; // 맑음
	 }else if (weatherMain === "Rain"){
		 iconClass = "icon-umbrella mr-3"; // 비
	 }else if (weatherMain === "snow"){
		 iconClass = "icon-drop mr-3"; // 눈
	 }
	 document.getElementById("todaysWeather").className = iconClass;
}
window.onload = function(){
    loadJSON(parseWeather);
};