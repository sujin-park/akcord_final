<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/common/template/head_include.jsp" %>
<%@ include file="/common/template/nav.jsp" %>

<script>
$(document).ready(
		function() {
			$('#searchBtn').click(
					function() {
						$('form[name=searchform]').attr('method', 'POST')
								.attr('action',
										'${root}/search/search.akcord')
								.submit();

					});
		});

</script>





<div class="jumbotron" style="height:150px; margin-top:30px;">
<form id="searchform" name="searchform">
          <div class="col-sm-6 col-sm-offset-3">
	            <div class="input-group">
				      <input type="text" class="form-control" id="usr" name="usr" size=25 placeholder="검색어를 입력해주세요">
				      <span class="input-group-btn">
				        <button class="btn btn-danger" type="button" id="searchBtn" name="searchBtn">SEARCH</button>
				      </span>
	          </div>
	  </div>
	</form>
</div>
