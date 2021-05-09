package com.indieProject.app.promovie;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;
import org.openqa.selenium.By;
import org.openqa.selenium.JavascriptExecutor;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.chrome.ChromeDriver;
import org.openqa.selenium.chrome.ChromeOptions;

import com.indieProject.action.Action;
import com.indieProject.action.ActionForward;
import com.indieProject.app.promovie.vo.ChromeDriverVO;

public class LoadMovieDetailAction implements Action{
	private WebDriver driver;
	private String url;
	
    public static final String WEB_DRIVER_ID ="webdriver.chrome.driver";
    public static final String WEB_DRIVER_PATH = ChromeDriverVO.getPath();
	@Override
	public ActionForward execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		req.setCharacterEncoding("UTF-8");
		resp.setCharacterEncoding("UTF-8");
		ActionForward forward = new ActionForward();
		
		String title = req.getParameter("title");
		System.out.println(title);
		System.setProperty(WEB_DRIVER_ID,WEB_DRIVER_PATH);
		ChromeOptions options = new ChromeOptions();
		options.addArguments("headless");
		//희광추가
		options.addArguments("no-sandbox");
		options.addArguments("disable-dev-shm-usage");
		options.addArguments("lang=ko");
		driver = new ChromeDriver(options);
		
		url = "https://indieground.kr/indie/releaseList.do";
		
		driver.get(url);
    	try {
			Thread.sleep(1000);
		} catch (InterruptedException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		System.out.println("들어옴1");
		
		
		WebElement btn = driver.findElement(By.id("viewBtn"));//더보기 버튼
		System.out.println(btn);
		//동적
		btn.click();
		try {
			Thread.sleep(1000);
		} catch (InterruptedException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		List<WebElement> el1 = driver.findElements(By.cssSelector("p.title"));
		System.out.println(el1);
		System.out.println("들어옴2");

		for(int i = 0; i < el1.size(); i++) {
			System.out.println(el1.get(i).getAttribute("textContent") + " 현재 제목");
			System.out.println(title + " 받은 제목");
			if(el1.get(i).getAttribute("textContent").equals(title)) {
				
				WebElement child1 = el1.get(i);
				System.out.println(child1 + " 1");
				/*WebElement child2 = child1.findElement(By.xpath(".."));
				System.out.println(child2 + " 2");
				WebElement child3 = child2.findElement(By.xpath(".."));
				System.out.println(child3 + " 3");*/
				WebElement parent = child1.findElement(By.xpath("./../../.."));
				
				System.out.println(parent.getTagName() + " p");
				parent.click();
				Thread.sleep(3000);
				
				System.out.println("클릭?");

				WebElement libraryView = driver.findElement(By.className("library_view"));
				System.out.println(libraryView);
				JSONObject jsonDetail = new JSONObject();
				jsonDetail.put("poster", (libraryView.findElement(By.className("movie_info_poster"))).findElement(By.tagName("img")).getAttribute("src"));
				System.out.println((libraryView.findElement(By.className("movie_info_poster"))).findElement(By.tagName("img")).getAttribute("src"));
				
				jsonDetail.put("title", driver.findElement(By.className("subject")).getText());
				System.out.println(driver.findElement(By.className("subject")).getText());
				
				WebElement explain = driver.findElement(By.className("explain"));
				WebElement intro = explain.findElement(By.cssSelector("ul.cf"));
				System.out.println(intro);
				List<WebElement> introList = intro.findElements(By.tagName("li"));
				System.out.println(introList);
				jsonDetail.put("length", introList.get(3).getText());
				jsonDetail.put("age", introList.get(4).getText());
				System.out.println(introList.get(3).getText());
				System.out.println(introList.get(4).getText());
				
				List<WebElement> cf = driver.findElements(By.cssSelector("dl.cf"));
				jsonDetail.put("company", cf.get(0).findElement(By.tagName("dd")).getText());
				jsonDetail.put("director", cf.get(2).findElement(By.tagName("dd")).getText());
				jsonDetail.put("genre", cf.get(4).findElement(By.tagName("dd")).getText());
				System.out.println(cf.get(0).findElement(By.tagName("dd")).getText());
				System.out.println(cf.get(2).findElement(By.tagName("dd")).getText());
				System.out.println(cf.get(4).findElement(By.tagName("dd")).getText());
				
				WebElement synopTag = driver.findElement(By.className("movie_story")).findElement(By.tagName("dd"));
				jsonDetail.put("synop", synopTag.getText());
				System.out.println(synopTag.getText());
				
				req.setAttribute("jsonDetail", jsonDetail);
				
				forward.setPath("/app/proMovie/proMovieDetail2.jsp");
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
		
		return forward;
	}

}
