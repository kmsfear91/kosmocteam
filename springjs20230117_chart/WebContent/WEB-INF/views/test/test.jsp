<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<article>
	<header>
		<h1>deptJsonDemo</h1>
	</header>
	<ul class="list-unstyled">
		<li class="border-top my-3"></li>
	</ul>
	<div class="container">
		<div class="row">
			<button type="button" id="testBtn" class="btn btn-outline-secondary btn-sm">Click</button>
			<div style="margin-top: 15px;">
				<table class="table">
					<colgroup>
						<col width="20%" />
						<col width="20%" />
						<col width="20%" />
						<col width="20%" />
						<col width="20%" />
					</colgroup>
					<thead>
						<tr>
							<th>Num</th>
							<th>Id</th>
							<th>Name</th>
							<th>Age</th>
							<th>Gender</th>
						</tr>
					</thead>
					<tbody id="target">
						<%-- Target --%>
					</tbody>
					<tfoot>
						<tr>
							<td colspan="5" style="text-align: center;" id="target2">
								<%-- Target2! --%>
							</td>
						</tr>
					</tfoot>
				</table>
			</div>
		</div>
	</div>
</article>
<script>
	class Paging {
		constructor(totalData)
		{
			this.totalData = totalData; // 총 회원 수
			this.dataPerPage = 5; // 한 페이지에 나타낼 멤버 수
			this.pageCount = 5; // 페이징에 나타낼 페이지 수
			this.globalCurrentPage = 1;
			this.memberList = [];
		}
		addMemberList(memberList) {
			this.memberList = memberList;
		}
		getMemberList (idx) {
			return this.memberList[idx];
		}
	}

	let ref = null;
	$(function() {
		$('#testBtn').click(function() {
			$.ajaxSetup({
				cache: false
			});
			$.ajax({
				url: "../testRest",
				success: function(jsonData) {
					memberList = jsonData;
					ref = new Paging(jsonData.length);
					ref.addMemberList(memberList);
					list(1, ref.dataPerPage);
					page(ref.totalData, ref.dataPerPage, ref.pageCount, 1);
				}
			});
		})
	});

	function list(nowPage, dataPerPage) {
		let listHtml = "";

		nowPage = parseInt(nowPage, 10);
		dataPerPage = parseInt(dataPerPage, 10);

		for (let i = (nowPage - 1) * dataPerPage; i < (nowPage - 1) * dataPerPage + dataPerPage; i++) {
			if (ref.getMemberList(i) != null) {
				listHtml += "<tr><td>" + ref.getMemberList(i).num + "</td>"
				+ "<td>" + ref.getMemberList(i).id + "</td>"
				+ "<td>" + ref.getMemberList(i).name + "</td>"
				+ "<td>" + ref.getMemberList(i).age + "</td>"
				+ "<td>" + ref.getMemberList(i).gender + "</td></tr>";
			}
		}
		$("#target").html(listHtml);
	}

	function page(totalData, dataPerPage, pageCount, nowPage) {
		console.log("nowPage : " + nowPage);
		totalPage = Math.ceil(totalData / dataPerPage); //총 페이지 수

		if(totalPage < pageCount){
			pageCount = totalPage;
		}

		let pageGroup = Math.ceil(nowPage / pageCount); // 페이지 그룹
		let last = pageGroup * pageCount; // 화면에 보여질 마지막 페이지 번호
		if (last > totalPage) {
			last = totalPage;
		}
		let first = last - (pageCount - 1); // 화면에 보여질 첫번째 페이지 번호
		let next = last + 1;
		let prev = first - 1;
		let pageHtml = "";
		if (prev > 0) {
			pageHtml += "<span>[<a href='#' id='prev'>이전</a>] </span>";
		}
		//페이징 번호 표시 
		for (var i = first; i <= last; i++) {
			pageHtml += "<span>[<a href='#' id='" + i + "'>" + i + "</a>] </span>";
		}
		if (last < totalPage) {
			pageHtml += "<span>[<a href='#' id='next'>다음</a>]</span>";
		}
		$("#target2").html(pageHtml);

		//페이징 번호 클릭 이벤트 
		$("#target2 span a").click(function () {
			let $id = $(this).attr("id");
			console.log("1 : " + $(this).attr("id"));
			selectedPage = $(this).text();
			console.log("2 : " + selectedPage);
			if ($id == "prev") {
				selectedPage = prev;
			}
			if ($id == "next") {
				console.log(next);
				selectedPage = next;
			}
			console.log("3 : " + selectedPage);
			ref.globalCurrentPage = selectedPage;
			page(totalData, dataPerPage, pageCount, selectedPage);
			list(selectedPage, dataPerPage);
		});
	}
</script>