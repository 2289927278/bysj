package com.iflytek.util;

public class UtilPrice {

	/*public static void main(String[] args) {
		System.out.println(getPrice("10","2", "2", "4"));

	}*/
	public static Double getPrice(String c_pay,String c_weight,String c_add ,String w){
		Double pay=Double.valueOf(c_pay.toString());
		int weight=Integer.parseInt(c_weight);
		int add=Integer.parseInt(c_add);
		
		Double goodsweight=Double.valueOf(w.toString());
		if(goodsweight<=weight){
			return pay;
		}else{
			return pay+(goodsweight-weight)*add;
		}
	}

}
