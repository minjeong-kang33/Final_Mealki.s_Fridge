function formatDate(dateString) {
  const date = new Date(dateString);
  const year = date.getFullYear();
  const month = ("0" + (date.getMonth() + 1)).slice(-2);
  const day = ("0" + date.getDate()).slice(-2);

  return `${year}-${month}-${day}`;
}

function loadNotices() {
  $.ajax({
    url: '/Mealki/board/getNotices',
    type: 'GET',
    dataType: 'json',
    success: function (data) {
      let noticeHTML = '<table id="notice" class="table table-borderless">';
      
      data.forEach(function (boardDTO) {
        if (boardDTO.bo_status === 1) {
          const formattedDate = formatDate(boardDTO.bo_date);
          
          noticeHTML +=
            '<tr class="notice-row" onclick="location.href=\'../../Mealki/groupware/board/boardContent?bo_num=' +
            boardDTO.bo_num +
             '\'" style="cursor:pointer;">';
          if (boardDTO.top_fixed === 1) {
            noticeHTML +=
              '<td class="bo-title-hover" style="width:70px; font-weight: bold; text-align: left; background-color:#e6e6f4;">&nbsp;&nbsp;[중요] ' +
              boardDTO.bo_title +
              '</td>';
            noticeHTML +=
              '<td style=" width:15px; font-weight: bold; text-align: center; background-color:#e6e6f4;">' +
              boardDTO.bo_name +
              '</td>';  
            noticeHTML +=
              '<td style=" width:15px; font-weight: bold; text-align: center; background-color:#e6e6f4;">' +
              formattedDate +
              '</td>';
          } else {
            noticeHTML +=
              '<td class="bo-title-hover" style=" width:70px; text-align: left;">  ' + boardDTO.bo_title + '</td>';
            noticeHTML += '<td style=" width:15px; text-align: center;">' + boardDTO.bo_name + '</td>';
            noticeHTML += '<td style=" width:15px; text-align: center;">' + formattedDate + '</td>';
          }
          noticeHTML += '</tr>';
        }
      });
      noticeHTML += '</table>';
      $('#table_content').html(noticeHTML);
    },
    error: function (jqXHR, textStatus, errorThrown) {
      console.error('Error loading notices:', textStatus, errorThrown);
    },
  });
}

$(document).ready(function () {
  loadNotices();
});

