package dto;

import java.util.Calendar;
import java.util.TimeZone;

public class WorldTime {

	private WorldTime instance = new WorldTime();
	private String cities;

	public WorldTime() {
	}

	public String getCities() {
		return cities;
	}

	public void setCities(String cities) {
		this.cities = cities;
	}

	public WorldTime getInstance() {
		return instance;
	}

	public void Time(String cities) {
		TimeZone timeZone = TimeZone.getTimeZone(cities);
		Calendar now = Calendar.getInstance(timeZone);
		int year = now.get(Calendar.YEAR), month = now.get(Calendar.MONTH), day = now.get(Calendar.DATE),
				hour = now.get(Calendar.HOUR), minute = now.get(Calendar.MINUTE);
		System.out.println(year + "년 " + month + "월 " + day + "일 " + hour + "시 " + minute + "분");
	}
}
