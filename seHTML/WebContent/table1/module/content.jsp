<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<div id="content">
	<h3>테이블 만들고 꾸미기</h3>
	<table cellspacing="0" cellpadding="0" class="movieTable">
		<thead>
			<tr>
				<th class="number">번호</th>
				<th class="poster">포스터</th>
				<th>영화제목</th>
				<th class="director">영화감독</th>
				<th class="date">상영일</th>
			</tr>
		</thead>
		<tbody>
			<tr class="odd">
				<td>1</td>
				<td><img src="../img//movie1.jpg" alt=""></td>
				<td><a
					href=" https://movie.naver.com/movie/bi/mi/basic.nhn?code=66381">맘마미아!Mamma
						Mia!</a></td>
				<td class="director">필리다 로이드</td>
				<td>2008.09.03</td>
			</tr>
			<tr>
				<td>2</td>
				<td><img src="../img/movie2.jpg" alt=""></td>
				<td>건축학 개론</td>
				<td class="director">이용주</td>
				<td>2012.03.22</td>
			</tr>
			<tr class="odd">
				<td>3</td>
				<td><img src="../img/movie3.jpg" alt=""></td>
				<td>비긴 어게인</td>
				<td class="director">존 카니</td>
				<td>2014.08.13</td>
			</tr>
		</tbody>
		<tfoot>
			<tr>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
				<td>총 3편</td>
			</tr>
		</tfoot>
	</table>
</div>