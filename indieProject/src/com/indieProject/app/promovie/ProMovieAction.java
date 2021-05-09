package com.indieProject.app.promovie;

import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.chrome.ChromeDriver;
import org.openqa.selenium.chrome.ChromeOptions;

import com.indieProject.action.Action;
import com.indieProject.action.ActionForward;
import com.indieProject.app.promovie.vo.ChromeDriverVO;

public class ProMovieAction implements Action{
	
	private WebDriver driver;
	private String url;
	
    public static final String WEB_DRIVER_ID ="webdriver.chrome.driver";
    public static final String WEB_DRIVER_PATH = ChromeDriverVO.getPath();
	@Override
	public ActionForward execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		req.setCharacterEncoding("UTF-8");
		resp.setCharacterEncoding("UTF-8");
		
		ActionForward forward = new ActionForward();
		
		
		
		
		System.setProperty(WEB_DRIVER_ID,WEB_DRIVER_PATH);
		ChromeOptions options = new ChromeOptions();
		options.addArguments("headless");
		//희광추가
		options.addArguments("no-sandbox");
		options.addArguments("disable-dev-shm-usage");
		options.addArguments("lang=ko");
		driver = new ChromeDriver(options);
		
		url = "https://indieground.kr/indie/releaseList.do";
		WebElement el1 = null;
    	List<WebElement> el2 = null;
    	List<WebElement> el3 = null;
    	List<WebElement> el4 = null;
    	driver.get(url);
    	try {
			Thread.sleep(1000);
		} catch (InterruptedException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
    	el1 = driver.findElement(By.id("viewBtn"));//더보기 버튼
		
		//동적
		el1.click();
		
		try {
			Thread.sleep(1000);
		} catch (InterruptedException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
    	
		el2 = driver.findElements(By.className("library_img"));
		el3 = driver.findElements(By.cssSelector("p.title"));
		el4 = driver.findElements(By.cssSelector("p.info"));
		
		JSONArray jsonPoster = new JSONArray();
		for(int i = 0; i < el2.size(); i++) {
			
			
			JSONObject jsonPrepare = new JSONObject();
			jsonPrepare.put("img",el2.get(i).findElement(By.tagName("img")).getAttribute("src"));
			jsonPrepare.put("title",el3.get(i).getAttribute("textContent"));
			jsonPrepare.put("date", el4.get(i).findElement(By.tagName("span")).getAttribute("textContent"));
			jsonPoster.add(jsonPrepare);
		}
		
		
		
		
		req.setAttribute("jsonPoster", jsonPoster);

		forward.setPath("/app/proMovie/proMovie2.jsp");
		forward.setRedirect(false);
    	//드라이버 종료
    	try {
			if(driver != null) {
			driver.close();
			driver.quit();
			}//end if
		} catch (Exception e) {
			// TODO Auto-generated catch block
			throw new RuntimeException(e.getMessage());
		}

		

		
		return forward;
	}

    

}
