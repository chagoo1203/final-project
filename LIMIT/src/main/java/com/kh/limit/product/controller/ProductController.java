package com.kh.limit.product.controller;

import java.io.BufferedReader;
import java.io.DataOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.kh.limit.common.model.vo.Attachment;
import com.kh.limit.common.model.vo.Interested;
import com.kh.limit.common.model.vo.ResellInfo;
import com.kh.limit.common.model.vo.Trade;
import com.kh.limit.product.model.service.ProductService;
import com.kh.limit.product.model.vo.Product;

@Controller
public class ProductController {
	
	@Autowired
	private ProductService productService;
	
	@RequestMapping("resellList.resell")
	public ModelAndView resellList(ModelAndView mv) {
		
		mv.addObject("brand", productService.selectBrand())
		  .addObject("collection", productService.selectCollection())
		  .addObject("list", productService.selectResellList())
		  .setViewName("product/resellBoardList");
		
		return mv;
		
	}
	
	@RequestMapping("resellDetail.resell")
	public ModelAndView selectResellProduct(ModelAndView mv, int pno) {
		
		int result = productService.increaseCount(pno);
		
		if(result > 0) {
			Product p = productService.selectResellProduct(pno);
			ArrayList<Attachment> list = productService.selectAttachmentList(pno);
			mv.addObject("p", p)
			  .addObject("list", list)
			  .setViewName("product/resellBoardDetailView");
		} else {
			mv.addObject("errorMsg", "비상~ 비상~").setViewName("common/errorPage");
		}
		
		return mv;
		
	}
	
	@RequestMapping("resellBuy.resell")
	public ModelAndView selectDetailBuyProduct(ModelAndView mv, int pno) {
		
		Product p = productService.selectResellProduct(pno);
		ArrayList<Product> list = productService.selectDetailProduct(pno);
		
		mv.addObject("list", list)
		  .addObject("p", p)
		  .setViewName("product/resellProductBuy");
		
		return mv;
		
	}
	
	@RequestMapping("resellSell.resell")
	public ModelAndView selectDetailSellProduct(ModelAndView mv, int pno) {
		
		Product p = productService.selectResellProduct(pno);
		ArrayList<Attachment> list = productService.selectAttachmentList(pno);
		
		mv.addObject("p", p)
		  .addObject("list", list)
		  .setViewName("product/resellProductSell");
		
		return mv;
		
	}
	
	@RequestMapping("insertSellProduct.resell")
	public ModelAndView insertSellProduct(ModelAndView mv, ResellInfo ri) {
		
		int result = productService.insertSellProduct(ri);
		
		if(result > 0) {
			mv.setViewName("redirect:/resellDetail.resell?pno=" + ri.getProductNo());
		} else {
			mv.addObject("errorMsg", "비상~ 비상~")
			  .setViewName("common/errorPage");
		}
		
		return mv;
	}
	
	@RequestMapping("insertInterest.resell")
	public String insertInterestProduct(Interested i, Model model) {
		
		int count = productService.selectInterestProduct(i); 
		
		int result = 0;
		
		if(count > 0) {
			result = productService.deleteInterestProduct(i) * productService.reduceInterestProduct(i);
		} else {
			result = productService.insertInterestProduct(i) * productService.updateInterestProduct(i);
		}
		
		if(result > 0) {
			return "redirect:/resellDetail.resell?pno=" + i.getProductNo();
		} else {
			model.addAttribute("errorMsg", "비상~");
			return "common/errorPage";
		}
		
	}
	
	@ResponseBody
	@RequestMapping("priceGraphWeek.resell")
	public ArrayList<Trade> priceGraphWeek(int productNo, Model model){
		
		ArrayList<Trade> list = productService.priceGraphWeek(productNo);
		model.addAttribute("list", list);
		return list;
		
	}
	
	@ResponseBody
	@RequestMapping("priceGraphMonth.resell")
	public ArrayList<Trade> priceGraphMonth(int productNo, Model model){
		
		ArrayList<Trade> list = productService.priceGraphMonth(productNo);
		model.addAttribute("list", list);
		return list;
		
	}
	
	@ResponseBody
	@RequestMapping("priceGraphYear.resell")
	public ArrayList<Trade> priceGraphYear(int productNo, Model model){
		
		ArrayList<Trade> list = productService.priceGraphYear(productNo);
		model.addAttribute("list", list);
		return list;
		
	}
	
	@ResponseBody
	@RequestMapping("kakaopay.resell")
	public String kakaopay(String userId, String productName, String resellPrice) {
		
		try {
			URL url = new URL("https://kapi.kakao.com/v1/payment/ready"); // url주소
			HttpURLConnection urlConnection = (HttpURLConnection)url.openConnection(); // 서버연결 역할
			urlConnection.setRequestMethod("POST"); // POST방식을 사용하겠다
			urlConnection.setRequestProperty("Authorization", "KakaoAK a8eda9021d0b9b9c308e65b4168d33e3" ); //인증 이 요청이 카카오페이로부터 인증받은 요청인지 내가 발급받은 어드민키를 통해 알아본다
			urlConnection.setRequestProperty("Content-type", "application/x-www-form-urlencoded;charset=utf-8");
			//urlConnection.setDoInput(true); 이 연결을 통해서 내가 서버로부터 받아올게 있는지 / 이건 기본적으로 default값이 true라 생략가능
			urlConnection.setDoOutput(true); // 이 연결을 통해서 내가 서버에 전해줄게 있는지(있으면 true)
			String parameter = "cid=TC0ONETIME&partner_order_id=partner_order_id&partner_user_id="+userId+"&item_name="+productName+"&quantity=1&total_amount="+resellPrice+"&tax_free_amount=0"
					+ "&approval_url=http://localhost:8989/limit/resellList.resell&cancel_url=http://localhost:8989/limit/resellList.resell&fail_url=http://localhost:8989/limit/resellList.resell";
			OutputStream stream = urlConnection.getOutputStream(); // 무언가를 전달하기 위한 통로 생성
			DataOutputStream dataStream = new DataOutputStream(stream); // 무언가=데이터를 전달하기 위한 통로 생성
			dataStream.writeBytes(parameter); // 바이트로 전달해야한다. writeBytes = 바이트로 자동형변환되는 함수
			//dataStream.flush(); // 가지고 있는 걸 비우는 함수 -> 비운다 : 통로를 통해 데이터를 보낸다.
			dataStream.close(); // close()를 하면 flush를 알아서 실행한다.
			
			int result = urlConnection.getResponseCode();
			
			InputStream inputStream;
			if(result == 200) { // http코드에서 정상적인 통신을 뜻하는 코드가 200이고 그 외에는 에러이다
				// 통신 성공시
				inputStream = urlConnection.getInputStream();
			} else {
				// 실패시
				inputStream = urlConnection.getErrorStream();
			}
			InputStreamReader inputReader = new InputStreamReader(inputStream); //받아온 값을 읽어주는 역할
			BufferedReader bufferedReader = new BufferedReader(inputReader);// 바이트 형태로 주고받은 값을 다시 문자열로 형변환 해야한다
			return bufferedReader.readLine();
		} catch (MalformedURLException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		return "product/resellBoardList";
	}

}
