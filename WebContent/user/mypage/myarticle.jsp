<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/common/template/head_include.jsp"%>
<link rel="stylesheet" href="/akcord_project/user/group/css/group.css">
<%@ include file="/common/template/nav.jsp" %>
<script>
$(document).ready(function() {
   $(document).on('click', '#deleteBtn', function() {
      var seq = $(this).parents('td').siblings().eq(1).text();
      alert(seq);
      var category = $(this).parents('td').siblings().eq(2).text();
      alert(category);
         $(location).attr('href','${root}/mypage/delete.akcord?seq='+seq+'&category='+category);
      });
});

</script>
	<div class="container akcord">
		<div class="col-sm-12">
				<div class="page-header titleinfo">
					    <h2 id="container"><i class="fa fa-id-badge"></i>  &nbsp;<b>내 글 보기</b></h2><h5>내가 쓴 글을 모아볼 수 있습니다.</h5>
				</div>
            <div class="panel panel-default">
               <div class="panel-body">
                  <div class="row" style="padding-bottom:10px;">
                     <div class="col-sm-6 pull-left">
                     <!-- 
                        <button type="button" id="create" class="btn btn-sm btn-danger">그룹방 개설</button>
                        <button type="button" id="accept" class="btn btn-sm btn-default">승인 리스트</button>
                     -->
                     </div>
                     <div class="row">
                        <div class="form-group form-inline">
                           <div class="col-sm-6 pull-right">
                              <div class="col-sm-3"></div>
                              <div class="col-sm-9">
                                 <select class="form-control" name="key">

                                    <option value="QNA">지식인</option>
                                    <option value="GROUP">그룹방</option>
                                    <option value="QNA_COMMENT">지식인 답변</option>
                                 </select>
                                    <input type="text" class="form-control" name="word" placeholder="검색어 입력" size="25">
                                    <button type="button" class="btn btn-sm btn-danger">SEARCH</button>
                              </div>
                           </div>
                        </div>
                     </div>
                  </div>
                     <div class="row">
                        <div class="table-container table-responsive" style="margin-left: 20px; margin-right: 20px">
                           <table class="table table-filter" id="extable">
                              <tbody>
                                 <tr class="primary" align="center">
                                    <td width="15%">번호</td>
                                    <td width="10%">글 번호</td>
                                    <td width="15%">분류</td>
                                    <td width="20%">글 제목</td>
                                    <td width="15%">작성자</td>
                                    <td width="10%">생성일</td>
                                    <td width="15%">삭제</td>
                                 </tr>
                              <c:forEach var="mypage" items="${mypage}" varStatus="i">
                                 <input type="hidden" id="" name="category" value="${mypage.category}">
                                 <input type="hidden" id="" name="seq" value="${mypage.seq}">
                                 <input type="hidden" id="" name="group_id" value="${group.group_id}">
                                 <tr>
                                    <td>
                                       <div class="media">
                                          <p class="media-meta">${i.count}</p>
                                       </div>
                                    </td>
                                    <td>
                                       <div class="media">
                                       <div class="media-meta" id="">${mypage.seq}</div>
                                       </div>
                                    </td>
                                    <td>
                                       <div class="media">
                                          <div class="media-meta" id="">${mypage.category}</div>
                                       </div>
                                    </td>
                                    <td>
                                       <div class="media">
                                          <span class="media-meta" id="">${mypage.subject}</span>
                                       </div>
                                    </td>
                                    <td>
                                       <div class="media">
                                          <span class="media-meta">${userInfo.name}</span>
                                       </div>
                                    </td>
                                    <td>
                                       <div class="media">
                                          <span class="media-meta">${mypage.reg_date}</span>
                                       </div>
                                    </td>
                                    <td>
                                       <p align="center" data-placement="top" data-toggle="tooltip" title="Edit">
                                          <button type="button" id="deleteBtn" class="btn btn-danger">
                                           삭제
                                           </button>
                                        </p>
                                     </td>
                                 </tr>
                              </c:forEach>
                              </tbody>
                           </table>
                        </div>
                     </div>
               </div>
			<div align="center" style="clear:both;">
			${navigator.navigator}
			</div>
			<div class="col-md-6"></div>
			</div>
            </div>
         </div>
<%@include file="/common/template/footer.jsp"%>