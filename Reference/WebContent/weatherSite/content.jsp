<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<main>
	<div class="wrap">
		<div id="selectLoc">
			<select name="loc" id="loc">
				<option value="loc">서울특별시 동작구 신대방제2동</option>
			</select>
			<button>
				<img src="resources/images/btn_bookmark.png" alt="btn_bookmark"
					id="locBtn" />
			</button>
			<button>
				<img src="resources/images/btn_search.png" alt="btn_search"
					id="locBtn" />
			</button>
			<div id="currentWeather">지금 내리는 비는 23시00분에 그칠 것으로 예상됨.</div>
			<button id="warning">
				기상특보:발효중<img src="resources/images/arrow_down.png" alt="arrow_down"
					id="warningIcon" />
			</button>
		</div>
		<!-- selectLoc -->

		<div class="firstContent">
			<div class="presentWrap">
				<p>
					<script>
						currentTime(0);
					</script>
				</p>
				<img src="resources/images/DB05.png" alt="" /> <span
					class="temperature">19.0</span><span>℃</span>
				<div class="presentWeatherWrap">
					<span>체감온도(22℃)</span> <span><img
						src="resources/images/icon_humidity.png" alt="강수확률"
						class="weatherIcon" />100%</span> <span><img
						src="resources/images/icon_direction.png" alt="풍향및풍속"
						class="weatherIcon" />동 8.6km/h</span> <span><img
						src="resources/images/icon_rainfall.png" class="weatherIcon"
						alt="강수량" />2.5mm</span>
				</div>
			</div>
			<div class="presentWrap">
				<p>
					<script>
						currentTime(1);
					</script>
				</p>
				<img src="resources/images/DB05.png" alt="" /> <span
					class="temperature">19.0</span><span>℃</span>
				<div class="presentWeatherWrap">
					<span>체감온도(22℃)</span> <span><img
						src="resources/images/icon_humidity.png" alt="강수확률"
						class="weatherIcon" />100%</span> <span><img
						src="resources/images/icon_direction.png" alt="풍향및풍속"
						class="weatherIcon" />동 8.6km/h</span> <span><img
						src="resources/images/icon_rainfall.png" class="weatherIcon"
						alt="강수량" />2.5mm</span>
				</div>
			</div>
			<div class="presentWrap">
				<p>
					<script>
						currentTime(2);
					</script>
				</p>
				<img src="resources/images/DB05.png" alt="" /> <span
					class="temperature">19.0</span><span>℃</span>
				<div class="presentWeatherWrap">
					<span>체감온도(22℃)</span> <span><img
						src="resources/images/icon_humidity.png" alt="강수확률"
						class="weatherIcon" />100%</span> <span><img
						src="resources/images/icon_direction.png" alt="풍향및풍속"
						class="weatherIcon" />동 8.6km/h</span> <span><img
						src="resources/images/icon_rainfall.png" class="weatherIcon"
						alt="강수량" />2.5mm</span>
				</div>
			</div>
			<div class="presentWrap">
				<p>
					<script>
						currentTime(3);
					</script>
				</p>
				<img src="resources/images/DB05.png" alt="" /> <span
					class="temperature">19.0</span><span>℃</span>
				<div class="presentWeatherWrap">
					<span>체감온도(22℃)</span> <span><img
						src="resources/images/icon_humidity.png" alt="강수확률"
						class="weatherIcon" />100%</span> <span><img
						src="resources/images/icon_direction.png" alt="풍향및풍속"
						class="weatherIcon" />동 8.6km/h</span> <span><img
						src="resources/images/icon_rainfall.png" class="weatherIcon"
						alt="강수량" />2.5mm</span>
				</div>
			</div>
		</div>
		<!-- presentWrap -->
		<div class="clear"></div>
		<div id="update"></div>
		<span id="currentTime"><img
			src="resources/images/icon_refresh.png" alt="icon_refresh"
			id="icon_refresh" />업데이트<script>
				today()
			</script></span>
	</div>
	<!-- firstContent -->
	<div class="lastContent"></div>
	<!-- lastContent -->
</main>
