 document.addEventListener('DOMContentLoaded', function() {
  var calendarEl = document.getElementById('calendar');

  var calendar = new FullCalendar.Calendar(calendarEl, {

    googleCalendarApiKey: 'AIzaSyDwtxfKI-6YrDq4f1pcRWLw52Ql9Nprk58',

    headerToolbar: {
        left: 'prev',
        center: 'title',
        right: 'next'
      },
    eventSources: [
    {
          googleCalendarId: 'mealkis00@gmail.com',
          className: '밀키의 냉장고',
          color: '#F4797E'
        },
    {
          googleCalendarId : "ko.south_korea#holiday@group.v.calendar.google.com", 
          className : "한국 공휴일", 
          color : "#7DA0FA"
      }
    ]
  });
  calendar.render();
});