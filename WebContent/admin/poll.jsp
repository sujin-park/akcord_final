<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="root" value="${pageContext.request.contextPath}"/>
<script src="${root }/admin/Chart.js"></script>
<script type="text/javascript">
$(document).ready(function (){
       
       var pseq=$('#poll_id').attr('data-seq');
      var poll_id=$('#poll_id').attr('data-seq');
      var user_id=${user.user_id};
//      var content = $('input:radio[name=poll_id]:checked').val();
      
   $.ajax({         
             type: 'GET', 
             dataType: 'json',
             url: '${root}/poll/pollupdate.akcord?poll_id='+poll_id+'&user_id='+user_id,
             //data : {'data', data},
         
       success : function(data){
               var output;
                 if(data.pdid!=0){
                    output = "";
                    output += '<button type="button" class="btn btn-danger" id="doPollBtn">';
                   output += '선택';
                  output +='</button>';                
                    $('#btn').prepend(output);
                    }
                 else
                   $('#btn').children('#doPollBtn').eq('0').empty();
          }   
      });
   $('#pollResultBtn').click(function (){
      
   $.ajax({
       type: 'GET', 
       dataType: 'json',
       url: '${root}/poll/result.akcord?pseq='+pseq,
       success : function(data){
           resultModal(data);
           }
      });
   });
});
function resultModal(cdata){
    var myChart;
   $('#pollResultModal').on('show.bs.modal', function(event) {
      var data=new Array('FFB6C1', 'FFCFDA ','FFD0CD','FAEB78 ','FFE650','FFC6A5','FF9696','6EE5A3','73E1E1',
            '96F56E','84FB84','52E252','8C8CFF','64AAFF','5AD2FF');
      //txt초기화
      //var len = data.pollresult.length;
       var modal = $(this)

       var label = [];
       var value=[];
       var bgcolor=[];

       for(var i=0;i<cdata.pollresult.length;i++) {
             label[i] = cdata.pollresult[i].content;
             value[i] = cdata.pollresult[i].cnt;
             bgcolor[i]= "#"+data[Math.floor(Math.random()*data.length)];
             
    }
  
        $('#myChart').remove(); // this is my <canvas> element
            $('#graph-container').append('<canvas id="myChart"><canvas>');
       
          
        var ctx = document.getElementById("myChart").getContext("2d");
     if( cdata.ChartType == "doughnut"){
        myChart=new Chart(ctx, {
              type: 'doughnut',
               data: {
                   labels: label,
                   datasets: [{
                       label: cdata.Subject,
                       data:value,
                     fillColor: bgcolor,
                   strokeColor: bgcolor,
                 pointColor: bgcolor,
               backgroundColor:bgcolor
                   }]
               },
               options: {
                  responsive: true
               }
           });
     }
     else if( cdata.ChartType == "line"){
        myChart=new Chart(ctx, {
              type: 'line',
               data: {
                   labels: label,
                   datasets: [{
                       label: cdata.Subject,
                      data:value,
                       backgroundColor: '#FFB6C1',
                         borderColor: '#FFB6C1',
                     fill: false,
                   }]
               },
             options: {
                scales: {
                    yAxes: [{
                        stacked: true
                    }]
                }
            }
              });
        }
     
     else{
     myChart=new Chart(ctx, {
           type: cdata.ChartType,
            data: {
                labels: label,
                datasets: [{
                    label: cdata.Subject,
                    data:value,
                    backgroundColor: bgcolor,
                    borderColor: bgcolor,
                    borderWidth: 1
                }]
            },
            options: {
                scales: {
                    yAxes: [{
                        ticks: {
                            beginAtZero:true
                        }
                    }]
                }
            }
        });
     }
       modal.find('#pollcontent').val(myChart);
        modal.find('#pollsubject').val(cdata.Subject);
});
   
   $('#pollResultModal').modal();
   
  }
$(document).on('click','#doPollBtn',function(){//동적으로 만든class들은 다시 다큐먼트로드해서 해야 이벤트가 먹음:   on(이벤트의종류,필터,기능)
   var poll_id=$('#poll_id').attr('data-seq');
   var user_id=${user.user_id};
   var content = $('input:radio[name=poll_id]:checked').val();
   $(location).attr('href','${root}/poll/dopoll.akcord?poll_id='+poll_id+'&user_id='+user_id+'&content='+content);
});
</script>
<div class="card my-1 card-primary" id="append1">
            <div class="card-block text-center">
              <p class="lead"><b>설문조사</b></p>
            </div>
             <b>${psubject }</b>
            <ul class="list-group list-group-flush">
            <c:forEach var="plist" items="${plist }">
                 <li class="list-group-item"><input type="radio" name="poll_id" id="poll_id" data-seq="${plist.poll_id }"value="${plist.content }">${plist.content}</li>
<!--                  <li class="list-group-item"><i class="mx-auto fa d-inline fa-clock-o"></i>&nbsp;5&nbsp;<b>JAVA 공부방</b></li> -->
             </c:forEach>
             <li><div class="col-sm-12"  id="btn" align="right">
             <div class="col-sm-6"></div>
           <button type="button" class="btn btn-danger" id="pollResultBtn">
            결과
            </button>
             </div>
         </li>
            </ul>
</div>



<div id="pollResultModal" class="modal fade" role="dialog">
   <div class="modal-dialog" style="width: 40%;">
       <!-- Modal content-->
       <div class="modal-content">
          <div class="modal-header">
              <button type="button" class="close" data-dismiss="modal">&times;</button>
              <h4 class="modal-title">투표결과</h4>
            </div>
            <div class="modal-body">
             <div class="row">
                <div class="col-sm-12" style="margin: 10px;">
                   <label class="col-sm-2 control-label">제목</label>
                              <input type="text" name="pollsubject" id="pollsubject" class="form-control" placeholder="주제"  value="">
                              
   
                       <div class="col-sm-10">
                           <label id="subject" class="col-sm-12 control-label"></label>
                       </div>
                   </div>
                 <div class="col-sm-12" style="margin: 10px;">
                   <label class="col-sm-2 control-label">내용</label>
                     <div style="width:100%">
                       <div id="graph-container" >
                  <canvas id="myChart" height="500" width="500"></canvas>
                       </div>
                   </div>
                       <div class="col-sm-10">
                           <label id="content" class="col-sm-12 control-label"></label>
                       </div>
                   </div>
                </div>
         </div>
            <div class="modal-footer">
              <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
            </div>
       </div>
   </div>
</div>