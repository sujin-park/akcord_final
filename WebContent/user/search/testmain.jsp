<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@include file="/common/template/head_include.jsp"%>
<%@ include file="/common/template/nav.jsp"%>
<style>
.gi-2x {
	font-size: 2em;
}

.gi-3x {
	font-size: 3em;
}

.gi-4x {
	font-size: 4em;
}

.gi-5x {
	font-size: 5em;
	
}
.media-heading { display: inline-block; white-space: nowrap; overflow: hidden; text-overflow: ellipsis; }
</style>`


<script>

$(document).ready(function() {
	$('#searchBtn').click(function() {
		$('form[name=searchform]').attr('method','POST').attr('action','${root}/search/search.akcord').submit();
		
	});
});
</script>

<form id="searchform" name="searchform">
<div class="form-group" style="margin-top: 50pt;">
  <label for="usr" class="col-sm-2"></label>
  <label for="usr" class="col-sm-1">검색어:</label>
  <label class="col-sm-6">
  <input type="text" class="form-control " id="usr" name="usr">
  </label>
  <button type="button"  class="col-sm-1" id="searchBtn" name="searchBtn">
 <p ><span class="glyphicon glyphicon-search" ></span></p> 
</button>
</div>



</form>


<div class="container">
<div class="col-sm-12 form-group">
		<hr>
		<c:forEach var="b" items="${Searchvalue}">
		
	<div class="media "  style="cursor: pointer;"  onclick="location.href='${b.link}';">
			
			<label class="media-heading col-sm-6" >${b.title }</label>
			<label class="media-heading col-sm-2"></label>
			<label class="media-heading col-sm-2">아이디 : ${b.bloggername }</label>
			<p class="media-body col-sm-2"></p>
			<p class="media-body col-sm-10" style="height: 50px; wilabelh: 100%;">${b.description	 }</p>
			<label class ="col-sm-4">${b.postdate}</label>
		
			<label class ="col-sm-6" onclick="location.href='${b.link}';">링크 : ${b.link}</label>

		
		</div>
			
		<hr>
			</c:forEach>
	
			</div>
	</div>
		
  
</body>
</html>