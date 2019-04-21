package com.iflytek.controller;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.iflytek.utils.PaymentUtil;




@Controller
@RequestMapping("CommCon")
public class CommCon {
	@RequestMapping("/us")
	public String st(HttpServletRequest req){
	
		 return "aandex";
	}
	@RequestMapping("/insert")
	public void getIndexs(HttpServletRequest req,HttpServletResponse response) throws IOException{
		String p0_Cmd = "Buy";// 业务类型，固定值为buy，即“买”
		String p1_MerId = "10001126856";// 在易宝注册的商号
		String p2_Order = req.getParameter("p2_Order");// 订单编号
		String p3_Amt = req.getParameter("p3_Amt");// 支付的金额
		String p4_Cur = "CNY";// 交易种币，固定值为CNY，表示人民币
		String p5_Pid = "";// 商品名称
		String p6_Pcat = "";// 商品各类
		String p7_Pdesc = "";// 商品描述
		String p8_Url = "http://localhost:8080/buy/BackServlet";// 电商的返回页面，当支付成功后，易宝会重定向到这个页面
		String p9_SAF = "";// 送货地址
		String pa_MP = "";// 商品扩展信息
		String pd_FrpId = req.getParameter("pd_FrpId");// 支付通道，即选择银行
		String pr_NeedResponse = "1";// 应答机制，固定值为1

		// 密钥，由易宝提供，只有商户和易宝知道这个密钥。
		String keyValue = "69cl522AV6q613Ii4W6u8K6XuW8vM1N6bFgyv769220IuYe9u37N4y7rI4Pl";

		// 通过上面的参数、密钥、加密算法，生成hmac值
		// 参数的顺序是必须的，如果没有值也不能给出null，而应该给出空字符串。
		String hmac = PaymentUtil.buildHmac(p0_Cmd, p1_MerId, p2_Order, p3_Amt,
				p4_Cur, p5_Pid, p6_Pcat, p7_Pdesc, p8_Url, p9_SAF, pa_MP,
				pd_FrpId, pr_NeedResponse, keyValue);
		
		// 把所有参数连接到网关地址后面
		String url = "https://www.yeepay.com/app-merchant-proxy/node";
		url += "?p0_Cmd=" + p0_Cmd + 
				"&p1_MerId=" + p1_MerId +
				"&p2_Order=" + p2_Order + 
				"&p3_Amt=" + p3_Amt + 
				"&p4_Cur=" + p4_Cur + 
				"&p5_Pid=" + p5_Pid + 
				"&p6_Pcat=" + p6_Pcat + 
				"&p7_Pdesc=" + p7_Pdesc + 
				"&p8_Url=" + p8_Url + 
				"&p9_SAF=" + p9_SAF + 
				"&pa_MP=" + pa_MP + 
				"&pd_FrpId=" + pd_FrpId + 
				"&pr_NeedResponse=" + pr_NeedResponse + 
				"&hmac=" + hmac;
//		System.out.println(url);
		// 重定向到网关
		response.sendRedirect(url);
		
	}
	//进入初始页面
	@RequestMapping("/userMain")
	public String start(HttpServletRequest req){
	req.getSession().setAttribute("falg", 0);
		 return "indexs";
	}
	
	@RequestMapping("/back")
	public String back(HttpServletRequest req){
	req.getSession().setAttribute("falg", 0);
		 return "indexs";
	}
 
	@RequestMapping("/book")
	public String book(HttpServletRequest req){
	
		 return "book";
	}
	
	@RequestMapping("/backindex")
	public String backindex(HttpServletRequest req){
	
		 return "indexs";
	}
	
	@RequestMapping("/backbusinesser")
	public String backbusinesser(HttpServletRequest req){
	
		 return "businesser";
	}
	@RequestMapping("/backpersonal")
	public String backpersonal(HttpServletRequest req){
	
		 return "personal";
	}
	@RequestMapping("/backmapperson")
	public String backmapperson(HttpServletRequest req){
	
		 return "MapPerson";
	}
	@RequestMapping("/backnews")
	public String backnews(HttpServletRequest req){
	
		 return "news";
	}
	@RequestMapping("/backabout")
	public String backabout(HttpServletRequest req){
	
		 return "about";
	}
	
	@RequestMapping("/businesser")
	public String businesser(HttpServletRequest req){
	
		 return "carrier";
	}
	@RequestMapping("/web")
	public String web(HttpServletRequest req){
	
		 return "MapPerson";
	}
	@RequestMapping("/webbus")
	public String webbus(HttpServletRequest req){
	
		 return "MapBus";
	}
	
	@RequestMapping("/follow")
	public String follow(HttpServletRequest req){
	
		 return "follow";
	}
  //承运商页面的跳转
	@RequestMapping("/carriermain")
	public String carriermain(HttpServletRequest req){
	
		 return "carriermain";
	}
	@RequestMapping("/carrierperson")
	public String carrierperson(HttpServletRequest req){
	
		 return "carrierperson";
	}
	@RequestMapping("/carriernews")
	public String carriernews(HttpServletRequest req){
	
		 return "carriernews";
	}
	@RequestMapping("/carriertouser")
	public String carriertouser(HttpServletRequest req){
	
		 return "carriertouser";
	}
	@RequestMapping("/carrierdeal")
	public String carrierdeal(HttpServletRequest req){
	
		 return "carrierdeal";
	}
	@RequestMapping("/carrierinquiry")
	public String carrierinquiry(HttpServletRequest req){
	
		 return "carrierinquiry";
	}
	
	@RequestMapping("/Map")
	public String map(HttpServletRequest req){
	
		 return "Map";
	}
	//结束
	
	//管理员界面跳转
	@RequestMapping("/main")
	public String main(HttpServletRequest req){
	
		 return "managermain";
	}
	@RequestMapping("/top")
	public String top(HttpServletRequest req){
	
		 return "top";
	}
	@RequestMapping("/left")
	public String left(HttpServletRequest req){
	
		 return "left";
	}
	@RequestMapping("/index")
	public String index(HttpServletRequest req){
	
		 return "managerindex";
	}
	@RequestMapping("/advise")
	public String imglist(HttpServletRequest req){
	
		 return "manageradvise";
	}
	
	@RequestMapping("/imgtable")
	public String imgtable(HttpServletRequest req){
	
		 return "imgtable";
	}
	@RequestMapping("/project")
	public String project(HttpServletRequest req){
	
		 return "managercarrier";
	}
	
	@RequestMapping("/search")
	public String search(HttpServletRequest req){
	
		 return "manageruser";
	}
	
	@RequestMapping("/tab")
	public String tab(HttpServletRequest req){
	
		 return "managernews";
	}
	
	@RequestMapping("/form")
	public String from(HttpServletRequest req){
	
		 return "managerinformation";
	}
	@RequestMapping("/service")
	public String right(HttpServletRequest req){
	
		 return "service";
	}
	@RequestMapping("/footer")
	public String footer(HttpServletRequest req){
	
		 return "footer";
	}
	
	/*@ResponseBody
	@RequestMapping("/time")
	public String time(HttpServletRequest req){
		String t=DateUtil.getTime();
		
		 return t;
	}*/
	
	
	
	//结束
	
	
	
}
