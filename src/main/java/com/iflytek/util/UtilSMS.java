package com.iflytek.util;

/*import com.taobao.api.ApiException;
import com.taobao.api.DefaultTaobaoClient;
import com.taobao.api.TaobaoClient;
import com.taobao.api.request.AlibabaAliqinFcSmsNumSendRequest;
import com.taobao.api.response.AlibabaAliqinFcSmsNumSendResponse;*/

public class UtilSMS {

/*	public static void main(String[] args) {
		UtilSMS.getAddress("芜湖大学12","15755184185");
		UtilSMS.getRandomNumber("adsfads","15755184185");

	}*/
	
	public static void getAddress(String number,String phone) {
		/*String str="{\"address\":\""+number+"\"}";
		String url="http://gw.api.taobao.com/router/rest";
		TaobaoClient client = new DefaultTaobaoClient(url,"23718494","bcbf0632198f773761e92c7bd1142308");
		AlibabaAliqinFcSmsNumSendRequest req = new AlibabaAliqinFcSmsNumSendRequest();
		req.setExtend("123456");
		req.setSmsType("normal");
		req.setSmsFreeSignName("沙子");
		req.setSmsParamString(str);
		req.setRecNum(phone);
		req.setSmsTemplateCode("SMS_58055037");
		AlibabaAliqinFcSmsNumSendResponse rsp = null;
		
			try {
				rsp = client.execute(req);
			} catch (ApiException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
	
		
		System.out.println(rsp.getBody());
	}
	
	
	
	public static void getRandomNumber(String number,String phone){
		
		String str="{\"name\":\""+number+"\"}";
		String url="http://gw.api.taobao.com/router/rest";
		TaobaoClient client = new DefaultTaobaoClient(url,"23718494","bcbf0632198f773761e92c7bd1142308");
		AlibabaAliqinFcSmsNumSendRequest req = new AlibabaAliqinFcSmsNumSendRequest();
		req.setExtend("123456");
		req.setSmsType("normal");
		req.setSmsFreeSignName("沙子");
		req.setSmsParamString(str);
		req.setRecNum(phone);
		req.setSmsTemplateCode("SMS_58095039");
		AlibabaAliqinFcSmsNumSendResponse rsp = null;
		try {
			rsp = client.execute(req);
		} catch (ApiException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		System.out.println(rsp.getBody());
	}
	
        public static void getxx(String number,String phone){
		
		String str="{\"applica\":\""+number+"\"}";
		String url="http://gw.api.taobao.com/router/rest";
		TaobaoClient client = new DefaultTaobaoClient(url,"23718494","bcbf0632198f773761e92c7bd1142308");
		AlibabaAliqinFcSmsNumSendRequest req = new AlibabaAliqinFcSmsNumSendRequest();
		req.setExtend("123456");
		req.setSmsType("normal");
		req.setSmsFreeSignName("沙子");
		req.setSmsParamString(str);
		req.setRecNum(phone);
		req.setSmsTemplateCode("SMS_60290214");
		AlibabaAliqinFcSmsNumSendResponse rsp = null;
		try {
			rsp = client.execute(req);
		} catch (ApiException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		System.out.println(rsp.getBody());*/
	}

}
