<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/common/template/searchbar.jsp"%>

<style>
.media-heading { display: inline-block; white-space: nowrap; overflow: hidden; text-overflow: ellipsis; }
.media-body { display: inline-block; white-space: nowrap; overflow: hidden; text-overflow: ellipsis; }

</style>


<script>
	$(document).ready(
			function() {
				$('#blogBtn').click(
						function() {
							$('form[name=searchform]').attr('method', 'POST')
									.attr('action',
											'${root}/search/blog.akcord')
									.submit();

						});

				$('#jisicBtn').click(
						function() {
							$('form[name=searchform]').attr('method', 'POST')
									.attr('action',
											'${root}/search/jisic.akcord')
									.submit();

						});

				$('#akcordBtn').click(
						function() {
							$('form[name=searchform]').attr('method', 'POST')
									.attr('action',
											'${root}/search/akcord.akcord')
									.submit();

						});

				$('#cafeBtn').click(
						function() {
							$('form[name=searchform]').attr('method', 'POST')
									.attr('action',
											'${root}/search/cafe.akcord')
									.submit();

						});
			});
</script>

<!-- <form id="searchform" name="searchform">
	<div class="form-group" style="margin-top: 50pt;">
		<label for="usr" class="col-sm-2"></label> <label for="usr"
			class="col-sm-1">검색어:</label> <label class="col-sm-6"> <input
			type="text" class="form-control " id="usr" name="usr">
		</label>
		<button type="button" class="col-sm-1" id="searchBtn" name="searchBtn">
			<p>
				<span class="glyphicon glyphicon-search"></span>
			</p>
		</button>
	</div>


</form>	 -->

<div class="col-sm-6 col-sm-offset-3">
	<button class="btn btn-danger" type="button" id="blogBtn"
		name="blogBtn">BlogSEARCH</button>
	<button class="btn btn-danger" type="button" id="jisicBtn"
		name="jisicBtn">JisicSEARCH</button>
	<button class="btn btn-danger" type="button" id="cafeBtn"
		name="cafeBtn">CafeSEARCH</button>
	<button class="btn btn-danger" type="button" id="akcordBtn"
		name="akcordBtn">AkcordSEARCH</button>

</div>
<div class="container">
	<div class="col-sm-12 form-group">
		<hr>
		<c:forEach var="c" items="${Searchvalue}">

			<div class="media " style="cursor: pointer;"
				onclick="location.href='${c.link}';">

				<label class="media-heading col-sm-6">${c.subject }</label> <label
					class="media-heading col-sm-2"></label> <label
					class="media-heading col-sm-2">아이디 : ${c.user_name }</label>
				<p class="media-body col-sm-2"></p>
				<p class="media-body col-sm-10" overflow:hidden;>${c.content }</p>
				<label class="col-sm-4">${c.reg_date}</label> <label
					class="col-sm-8" onclick="location.href='${c.link}';">${c.link}</label>


			</div>

			<hr>
		</c:forEach>

	</div>
</div>

</body>
</html>